import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../../../core/domain/entities/clasificador_entity.dart';
import '../../../../domain/entities/concepto_entity.dart';
import '../../../../domain/entities/modalidad_entity.dart';

import '../../../../domain/usecases/agregar_certificado/get_modalidad_concepto_clasificador_use_case.dart';
import '../../../../domain/usecases/agregar_certificado/save_certificado_use_case.dart';
import '../../../../domain/usecases/agregar_certificado/validar_certificado_cas_use_case.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import '../../../../../../../core/domain/use_cases/usecase.dart';

part 'certificados_event.dart';
part 'certificados_state.dart';

class CertificadosBloc extends Bloc<CertificadosEvent, CertificadosState>
    implements Disposable {
  @override
  CertificadosBloc(this.validarCertificadoUseCase, this.saveCertificadoUseCase,
      this.getModalidadConceptoClasificadorUseCase)
      : super(InitialCertificadosState()) {
    on<SaveEvent>(_saveCertificado);
    on<GetModalidadConceptoEvent>(_getModalidadConceptoClasificador);
    on<GetDataInitial>(_getDataInitial);
    on<ValidarCertificadoEvent>(_validarCertificado);
    on<AgregarClasificadorEvent>(_agregarClasificador);
    on<DeleteCertificadosEvent>(_deleteClasificadorEvent);
  }

  final ValidarCertificadoUseCase validarCertificadoUseCase;
  final SaveCertificadoUseCase saveCertificadoUseCase;
  final GetModalidadConceptoClasificadorUseCase
      getModalidadConceptoClasificadorUseCase;

  String titleAppBar = 'Start';

  List<Map<String, dynamic>> listaActual = [];

  FutureOr<void> _deleteClasificadorEvent(
      DeleteCertificadosEvent event, Emitter<CertificadosState> emit) {
    if (state is LoadedCertificadosState) {
      final certificados = (state as LoadedCertificadosState);
      List<Map<String, dynamic>> newCertificados =
          certificados.clasificadorConcepto.where((e) {
        int index = certificados.clasificadorConcepto.indexOf(e);
        return (index != event.id);
      }).toList();
      emit((state as LoadedCertificadosState).copyWidth(
          status: 'loaded',
          message: 'Clasificador cargado',
          clasificadorConcepto: newCertificados));
    }
  }

  _saveCertificado(SaveEvent event, Emitter<CertificadosState> emit) async {
    if (state is LoadedCertificadosState) {
      final estado = (state as LoadedCertificadosState);
      emit(LoadingCertificadosState());

      var result = await this.saveCertificadoUseCase(ParamsSave(
          detalle: estado.detalle,
          tipo: estado.tipo,
          anio: estado.anio,
          certificado: estado.certificado,
          modalidad: estado.modalidad,
          montoCertificado: estado.montoCertificado,
          clasificadorConcepto: estado.clasificadorConcepto));
      emit(result.fold(
        (l) => estado.copyWidth(status: 'failure', message: 'Error al grabar'),
        (r) => estado.copyWidth(
            status: 'saved',
            message: 'Se grabó exitosamente',
            clasificadorConcepto: [],
            certificado: '',
            montoCertificado: 0.0,
            detalle: ''),
      ));
    }
  }

  _getModalidadConceptoClasificador(
      event, Emitter<CertificadosState> emit) async* {
    var result = await this.getModalidadConceptoClasificadorUseCase(NoParams());
    emit(result.fold((l) {
      return ErrorCertificadoState(status: 'failure', message: 'Error');
    }, (r) {
      return ModalidadConceptoClasificadorState(
          modalidad: r.modalidad,
          concepto: r.concepto,
          clasificador: r.clasificador);
    }));
  }

  _getDataInitial(GetDataInitial event, Emitter<CertificadosState> emit) async {
    emit(LoadingCertificadosState());
    var result = await this.getModalidadConceptoClasificadorUseCase(NoParams());
    emit(result.fold((l) {
      return ErrorCertificadoState(
          status: 'failure',
          message: 'Error al recuperar la informacion inicial' + l.toString());
    }, (r) {
      return LoadedCertificadosState(
          status: 'loaded',
          message: 'message',
          detalle: '',
          tipo: '',
          modalidad: r.modalidad[0],
          concepto: r.concepto[0],
          clasificador: r.clasificador[0],
          modalidadList: List.of(r.modalidad),
          conceptoList: r.concepto,
          clasificadorList: r.clasificador,
          montoCertificado: 0,
          certificado: '0',
          anio: '2021',
          clasificadorConcepto: []);
    }));
  }

  _validarCertificado(event, Emitter<CertificadosState> emit) async {
    var result = await this.validarCertificadoUseCase(
        ParamsValidar(anio: event.anio, certificado: event.certificado));
    emit(result.fold((l) {
      return (state as LoadedCertificadosState).copyWidth(
          status: 'failure',
          message: 'Error al validar certificado',
          detalle: event.detalle,
          tipo: event.tipo,
          modalidad: event.modalidad,
          certificado: event.certificado,
          anio: event.anio,
          montoCertificado: event.montoCertificado,
          clasificadorConcepto: []);
    }, (r) {
      if (r.status && r.data != null) {
        return (state as LoadedCertificadosState).copyWidth(
            status: 'valid',
            message: 'certificado valido',
            detalle: event.detalle,
            tipo: event.tipo,
            modalidad: event.modalidad,
            certificado: event.certificado,
            anio: event.anio,
            montoCertificado: event.montoCertificado,
            clasificadorConcepto: []);
      } else
        return (state as LoadedCertificadosState)
            .copyWidth(status: 'failure', message: 'certificado ya existe');
    }));
  }

  _agregarClasificador(event, Emitter<CertificadosState> emit) async {
    List<Map<String, dynamic>> lista = [];

    if (state is LoadedCertificadosState) {
      lista = List.of((state as LoadedCertificadosState).clasificadorConcepto);
      if (lista
          .every((element) => element['concepto_id'] != event.concepto.id)) {
        if (lista.length == 0) {
          lista.add({
            'clasificador': event.clasificador.dscClasificador,
            'clasificador_id': event.clasificador.id,
            'concepto': event.concepto.dscConcepto,
            'concepto_id': event.concepto.id
          });
        } else {
          lista.insert(0, {
            'clasificador': event.clasificador.dscClasificador,
            'clasificador_id': event.clasificador.id,
            'concepto': event.concepto.dscConcepto,
            'concepto_id': event.concepto.id
          });
        }
        emit((state as LoadedCertificadosState).copyWidth(
            status: 'loaded',
            message: 'Clasificador cargado',
            clasificadorConcepto: lista));
      }
    }
  }

/*
  Stream<BaseCasState> _calcularEventToBaseCasState(BaseCasEvent event) async* {
    List<BaseCasEntity> listado = (state as LoadedBaseCasState).listBaseCas;
    //double totalAnualAcumulado = 0;
    yield LoadingBaseCasState();
    var calcularParams = (event as CalcularBaseCasEvent);
    var result = await calcularCasUseCase(ParamsCalcular(
        lista: listado,
        meses: calcularParams.meses,
        uit: calcularParams.uit,
        porcentajeMaximoEssalud: calcularParams.porcentajeMaximoEssalud,
        aguinaldoSemestral: calcularParams.aguinaldoSemestral,
        porcentajeEssalud: calcularParams.porcentajeEssalud));

    yield result.fold(
        (l) => InitialBaseCasState(),
        (r) => LoadedBaseCasState(
            listBaseCas: r.listaBaseCas, totalAnual: r.totalAcumulado));
  }

  Stream<BaseCasState> _listaEventToBaseCasState(BaseCasEvent event) async* {
    yield LoadingBaseCasState();
    var result = await listarUseCase(NoParams());
    yield result.fold((l) {
      return InitialBaseCasState();
    }, (r) {
      this.listaInicial = r;
      return LoadedBaseCasState(listBaseCas: r);
    });
  }
  */

/*
  Stream<BaseCasState> _filterEventToBaseCasState(BaseCasEvent event) async* {
    yield LoadingBaseCasState();
    List<BaseCasEntity> listado = listaInicial;
    double totalAnualAcumulado = 0;
    if ((event as FilterBaseCasEvent).filterText == 'TODOS')
      yield LoadedBaseCasState(
          listBaseCas: listado, totalAnual: totalAnualAcumulado);
    else {
      List<BaseCasEntity> lista = listado.where((element) {
        if (element.presupuesto == event.filterText ||
            element.estadoAir == event.filterText)
          totalAnualAcumulado = totalAnualAcumulado + element.total;
        return element.presupuesto == event.filterText ||
            element.estadoAir == event.filterText;
      }).toList();
      yield LoadedBaseCasState(
          listBaseCas: lista, totalAnual: totalAnualAcumulado);
    }
  }

  */

  @override
  void dispose() {}
}
