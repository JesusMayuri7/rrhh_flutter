import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
//import 'package:supercharged/supercharged.dart';
import 'package:collection/collection.dart';
import 'package:rrhh_clean/app/modules/liquidacion/bloc/liquidacion_bloc.dart';

import 'package:rrhh_clean/app/modules/liquidacion/domain/entities/liquidacion_detalle._entity.dart';
import 'package:rrhh_clean/app/modules/liquidacion/domain/entities/liquidacion_entity.dart';
import 'package:rrhh_clean/app/modules/liquidacion/domain/entities/liquidacion_resumen_entity.dart';
import 'package:rrhh_clean/app/modules/liquidacion/domain/usecases/get_liquidacion_data_initial_usecase.dart';
import 'package:rrhh_clean/app/modules/liquidacion/domain/usecases/get_liquidacion_resumen_siaf.dart';
import 'package:rrhh_clean/app/modules/liquidacion/domain/usecases/get_list_liquidacion_usecase.dart';
import 'package:rrhh_clean/app/modules/liquidacion/domain/usecases/sum_liquidacion_detalle_usecase.dart';

import 'package:rrhh_clean/app/modules/liquidacion/domain/usecases/update_liquidacion_usecase.dart';

part 'liquidacion_list_event.dart';
part 'liquidacion_list_state.dart';

class LiquidacionListBloc
    extends Bloc<LiquidacionListEvent, LiquidacionListState> {
  LiquidacionListBloc(
      this.getListLiquidacionUseCase,
      this.gettLiquidacionResumenUseCase,
      this.sumLiquidacionDetalleUseCase,
      this.liquidacionBloc,
      this.getDataInitialUseCase,
      this.updateLiquidacionUseCase)
      : super(LiquidacionListInitial()) {
    on<SetLiquidacionFilteredTextEvent>(_onSetLiquidacionFilteredTextEvent);
    on<SetLiquidacionFilteredAnioEvent>(
        _onSetLiquidacionFilteredAnioEventToState);
    on<SetLiquidacionFilteredModalidadEvent>(
        _onSetLiquidacionFilteredModalidadEvent);
    on<SetAllClasificadoresEvent>(_onSetAllClasificadoresEvent);
    on<GetListLiquidacionEvent>(_onGetListLiquidacionEvent);
    on<SetLiquidacionDetalleEvent>(_onSetLiquidacionDetalleEventToState);
    on<UpdateLiquidacionEvent>(_onUpdateLiquidacionEventToState);
  }

  final GetListLiquidacionUseCase getListLiquidacionUseCase;
  final GettLiquidacionResumenUseCase gettLiquidacionResumenUseCase;
  final SumLiquidacionDetalleUseCase sumLiquidacionDetalleUseCase;

  final UpdateLiquidacionUseCase updateLiquidacionUseCase;
  final GetLiquidacionDataInitialUseCase getDataInitialUseCase;
  final LiquidacionBloc liquidacionBloc;

  _onSetLiquidacionFilteredTextEvent(
      event, Emitter<LiquidacionListState> emit) async {
    if (event is SetLiquidacionFilteredTextEvent) {
      if (event.criterio.isNotEmpty) {
        emit((state as LiquidacionListLoaded).copyWith(
            listLiquidacionFiltered: (state as LiquidacionListLoaded)
                .listLiquidacionFiltered
                .where((element) =>
                    element.dscCertificado.endsWith(event.criterio) ||
                    element.nombres.contains(event.criterio.toUpperCase()))
                .toList(),
            status: LiquidacionStatus.LiquidacionLoaded));
      } else
        emit((state as LiquidacionListLoaded).copyWith(
            listLiquidacionFiltered: (state as LiquidacionListLoaded)
                .listLiquidacion
                .where((element) =>
                    element.anio == (state as LiquidacionListLoaded).anio &&
                    element.dscModalidad == event.modalidad)
                .toList(),
            status: LiquidacionStatus.LiquidacionLoaded));
    }
  }

  _onSetLiquidacionFilteredAnioEventToState(
      SetLiquidacionFilteredAnioEvent event,
      Emitter<LiquidacionListState> emit) async* {
    emit((state as LiquidacionListLoaded).copyWith(
        anio: event.anio,
        listLiquidacionFiltered: (state as LiquidacionListLoaded)
            .listLiquidacion
            .where((element) =>
                element.anio == event.anio &&
                element.dscModalidad ==
                    (state as LiquidacionListLoaded).modalidad)
            .toList(),
        status: LiquidacionStatus.LiquidacionLoaded));
  }

  _onSetLiquidacionFilteredModalidadEvent(
      event, Emitter<LiquidacionListState> emit) async {
    if (event is SetLiquidacionFilteredModalidadEvent) {
      if (state is LiquidacionListLoaded) {
        emit((state as LiquidacionListLoaded).copyWith(
            liquidacionDetalle: [],
            modalidad: event.dscModalidad,
            listLiquidacionFiltered: (state as LiquidacionListLoaded)
                .listLiquidacion
                .where((element) =>
                    element.anio == (state as LiquidacionListLoaded).anio &&
                    element.dscModalidad == event.dscModalidad)
                .toList(),
            status: LiquidacionStatus.LiquidacionLoaded));
      }
    }
  }

  _onSetAllClasificadoresEvent(SetAllClasificadoresEvent event,
      Emitter<LiquidacionListState> emit) async* {
    emit((state as LiquidacionListLoaded).copyWith(
        allClasificadores: event.allClasificadores,
        status: LiquidacionStatus.LiquidacionLoaded));
  }

  _onGetListLiquidacionEvent(
      GetListLiquidacionEvent event, Emitter<LiquidacionListState> emit) async {
    var result = await this.getListLiquidacionUseCase(event.anio);
    emit(result.fold((l) {
      if (state is LiquidacionListLoaded)
        return (state as LiquidacionListLoaded)
            .copyWith(status: LiquidacionStatus.LiquidacionListError);
      else
        return LiquidacionListLoaded(
            modalidad: event.modalidad,
            anio: event.anio,
            listLiquidacion: [],
            listLiquidacionFiltered: [],
            status: LiquidacionStatus.LiquidacionListError);
    }, (r) {
      return LiquidacionListLoaded(
          modalidad: event.modalidad,
          anio: event.anio,
          listLiquidacion: r.data,
          listLiquidacionFiltered: r.data
              .where((element) =>
                  element.anio == event.anio &&
                  element.dscModalidad == event.modalidad)
              .toList(),
          status: LiquidacionStatus.LiquidacionLoaded);
    }));
  }

  _onSetLiquidacionDetalleEventToState(SetLiquidacionDetalleEvent event,
      Emitter<LiquidacionListState> emit) async {
    if (state is LiquidacionListLoaded) {
      List<LiquidacionDetalleEntity> liquidacionDetalle =
          List.from(event.liquidacionDetalle);

      // Suma Vertical de los montos de Liquidacion Detalle
      //      var sumLiquidacionDetale = await this.sumLiquidacionDetalleUseCase(liquidacionDetalle);

/*
        emit(sumLiquidacionDetale.fold((l) => LiquidacionListInitial(), (r) {
          return (state as LiquidacionListLoaded).copyWith(
              dscCertificado: event.dscCertificado,
              liquidacionDetalle: r,
              nombres: event.nombres);
*/

      emit((state as LiquidacionListLoaded).copyWith(
          nombres: event.nombres,
          dscCertificado: event.dscCertificado,
          liquidacionDetalle: liquidacionDetalle));
    }
  }

  _onUpdateLiquidacionEventToState(
      UpdateLiquidacionEvent event, Emitter<LiquidacionListState> emit) async {
    var updateLiquidacion = await this.updateLiquidacionUseCase(
        ParamsUpdateLiquidacion(
            campo: event.campo,
            valor: event.valor,
            liquidacionId: event.liquidacionId));

    emit(updateLiquidacion.fold((l) {
      return LiquidacionListInitial();
    }, (r) {
      LiquidacionEntity liquidacion = r['data'];
      print('data ' + liquidacion.dscCertificado);
      return LiquidacionListLoaded(
        anio: liquidacion.anio,
        modalidad: liquidacion.dscModalidad,
        status: LiquidacionStatus.LiquidacionUpdated,
        listLiquidacionFiltered: [
          for (var item in event.liquidacion)
            if (item.id == liquidacion.id)
              item.copyWith(
                  metaId: liquidacion.metaId,
                  fuenteId: liquidacion.fuenteId,
                  finalidad: liquidacion.finalidad,
                  certificadoId: liquidacion.certificadoId,
                  dscCertificado: liquidacion.dscCertificado,
                  codigoPlaza: liquidacion.codigoPlaza,
                  codigoSiga: liquidacion.codigoSiga,
                  expediente: liquidacion.expediente,
                  fechaExpediente: liquidacion.fechaExpediente,
                  dni: liquidacion.dni,
                  nombres: liquidacion.nombres,
                  certificadoDevengadoId: liquidacion.certificadoDevengadoId,
                  dscCertificadoDevengado: liquidacion.dscCertificado,
                  fuenteDevengadoId: liquidacion.fuenteDevengadoId,
                  metaDevengadoId: liquidacion.metaDevengadoId,
                  finalidadDevengado: liquidacion.finalidadDevengado,
                  proceso: liquidacion.proceso)
            else
              item
        ],
        listLiquidacion: [
          for (var item in event.liquidacion)
            if (item.id == liquidacion.id)
              item.copyWith(
                  metaId: liquidacion.metaId,
                  fuenteId: liquidacion.fuenteId,
                  finalidad: liquidacion.finalidad,
                  certificadoId: liquidacion.certificadoId,
                  dscCertificado: liquidacion.dscCertificado,
                  codigoPlaza: liquidacion.codigoPlaza,
                  codigoSiga: liquidacion.codigoSiga,
                  expediente: liquidacion.expediente,
                  fechaExpediente: liquidacion.fechaExpediente,
                  dni: liquidacion.dni,
                  nombres: liquidacion.nombres,
                  certificadoDevengadoId: liquidacion.certificadoDevengadoId,
                  dscCertificadoDevengado: liquidacion.dscCertificado,
                  fuenteDevengadoId: liquidacion.fuenteDevengadoId,
                  metaDevengadoId: liquidacion.metaDevengadoId,
                  finalidadDevengado: liquidacion.finalidadDevengado,
                  proceso: liquidacion.proceso)
            else
              item
        ],
      );
    }));
  }

  Map<String, dynamic> _buildResumen(String _dscClasificador,
      String _dscCertificado, List<LiquidacionEntity> _listLiquidacion) {
    // Extraer solo el certificado seleccionado
    var certificado = _listLiquidacion
        .where((element) => element.dscCertificado == _dscCertificado)
        .map((e) => e.toMap());

    Map<String, double> fuentes = {};

    var fuenteGroup = groupBy(certificado,
                (Map<String, dynamic> obj) => obj['fuenteId'].toString())
            .map((key, value) {
      return MapEntry(
          key,
          value.map((e) {
            e.remove('fuenteId');
            e.remove('anio');
            e.remove('codigoPlaza');
            e.remove('id');
            e.remove('codigoSiga');
            e.remove('dscCertificado');
            e.remove('nombres');
            e.remove('expediente');
            e.remove('dni');
            return e;
          }).toList());
    })
        //.map((key, value) => MapEntry(key, value.map((e) => {'finalidad': e['finalidad']})))
        ;

    Map<String, dynamic> finalMap = Map();

    for (var finalidad in (fuenteGroup.keys)) {
      double totalFuente = 0;
      var map = Map();
      var finalidadGroup =
          groupBy(fuenteGroup[finalidad] as List,
                  (obj) => ((obj as Map)['finalidad']))
              .map((key, value) => MapEntry(
                  key,
                  value.map((e) {
                    e.remove('finalidad');
                    return e;
                  }).toList()));

      for (var clasificador in finalidadGroup.keys) {
        var clasificadorGroup = finalidadGroup[clasificador];
        map[clasificador] = clasificadorGroup
            ?.map((e) => (e['liquidacionDetalle'] as List).where((element) {
                  return element['clasificador'] == _dscClasificador;
                }))
            .fold({
          'montoCertificado': 0,
          'montoLiquidacion': 0,
          'montoDevengado': 0,
          'montoDevolucion': 0
        }, (Map previousValue, element) {
          totalFuente += element.first['montoCertificado'].toDouble();
          return {
            'montoCertificado': previousValue['montoCertificado'].toDouble() +
                element.first['montoCertificado'].toDouble(),
            'montoLiquidacion': previousValue['montoLiquidacion'] +
                element.first['montoDevengado'].toDouble(),
            'montoDevengado': previousValue['montoDevengado'] +
                element.first['montoDevengado'].toDouble(),
            'montoDevolucion': previousValue['montoDevolucion'] +
                element.first['montoDevolucion'].toDouble(),
          };
        });
      }
      fuentes[finalidad] = totalFuente;

      map = {finalidad: map};

      finalMap = {...finalMap, ...map};
    }

    return finalMap;
/*
    for (var clasificador in fuenteGroup.keys) {
      var clasificadorGroup = fuenteGroup[clasificador];
      var liquidacionDetalle =
          clasificadorGroup?.map((e) => e['liquidacionDetalle']);
      //listado.add(liquidacionDetalle as LiquidacionDetalleEntity);

      newMap[clasificador] = liquidacionDetalle?.map(
          (e) => e.where((element) => element['clasificador'] == '2.3.28.11'));
      
    }
//    print('newMap' + newMap.toString());
    return newMap;

    */
  }

  Map<String, dynamic> updateMap({
    /// Update a map with another map
    /// Example:
    ///   Map map1 = {'name': 'Omid', }
    ///   Map map2 = {'family': 'Raha', }
    ///   Map map = updateMap(data:map1, update:map2);
    /// Result:
    ///   map = {'name': 'Omid', 'family': 'Raha',}
    required Map<String, dynamic> data,
    required Map<String, dynamic> update,
  }) {
    if (update == null) return data;
    update.forEach((key, value) {
      data[key] = value;
    });
    return data;
  }
}

/*
      for (var liquidacion in finalidadGroup.keys) {
        List<LiquidacionEntity> liquid =
            List.from(finalidadGroup[liquidacion] as List);
        for (var detalle in liquid) {
          detalle.liquidacionDetalle
              .where((element) => element.clasificador == '2.3.28.11')
              .map((e) {
            montoCertificado += e.montoCertificado;
            montoLiquidacion += e.montoLiquidacion;
            montoDevengado += e.montoDevengado;
          });
          map['liquidacionDetalle'] = {
            montoCertificado,
            montoLiquidacion,
            montoDevengado
          };
        }
      }
*/
/*
      map = {finalidad: map};
      finalMap = {...finalMap, ...map};
    }
    //print(finalMap.toString());

    //RO
    final List<LiquidacionEntity> certificadoRO =
        certificado.where((element) => element.fuenteId == 1).toList();

    // RDR
    final List<LiquidacionEntity> certificadoRDR =
        certificado.where((element) => element.fuenteId == 2).toList();

    certificadoRO.sort((a, b) => a.finalidad.compareTo(b.finalidad));

    certificadoRDR.sort((a, b) => a.finalidad.compareTo(b.finalidad));
*/
// El certificado debe ser por fuente y despues agrupar por meta
/* var groupCertificadoRO = certificadoRO
        .groupBy<Map<String, dynamic>, List<LiquidacionDetalleEntity>>(
            (element) => {'finalidad': element.finalidad},
            valueTransform: (e) => e.liquidacionDetalle);

    var groupCertificadoRDR = certificadoRDR
        .groupBy<Map<String, dynamic>, List<LiquidacionDetalleEntity>>(
            (element) => {'finalidad': element.finalidad},
            valueTransform: (e) => e.liquidacionDetalle);
*/
//groupCertificadoRDR

// De vertical a Horizontal
//var pivot = certificado.whe

/*   List<Object> heading =
        List.from(certificado[0].liquidacionDetalle[0].toMap().keys.toList());*/

//print(heading.toString());
// print(newMap.toString());

// El certificado debe ser por fuente y despues agrupar por meta
/*
    final value = certificado[0]
        .liquidacionDetalle
        .fold(Map<String, List<LiquidacionDetalleEntity>>(),
            (Map<String, List<LiquidacionDetalleEntity>> a, b) {
          a.putIfAbsent(b.clasificador, () => []).add(b);
          return a;
        })
        .values
        .where((l) => l.isNotEmpty)
        .map((l) => {
              'FuenteId': l.first.clasificador,
              'Clasificador': l
                  .map((e) => {
                        'monto_certificado': e.montoCertificado,
                        'monto_liquidacion': e.montoLiquidacion,
                        'monto_devengado': e.montoDevengado,
                      })
                  .toList()
            })
        .toList();
*/
// print(value);

/* // El certificado debe ser por fuente y despues agrupar por meta 
    final value = certificado
        .fold(Map<String, List<LiquidacionEntity>>(),
            (Map<String, List<LiquidacionEntity>> a, b) {
          a.putIfAbsent(b.fuenteId.toString(), () => []).add(b);
          return a;
        })
        .values
        .where((l) => l.isNotEmpty)
        .map((l) => {
              'FuenteId': l.first.fuenteId,
              'Meta': l.first.finalidad,
              'Clasificador': l
                  .map((e) => {
                        'liquidacion_detalle': e.liquidacionDetalle,
                      })
                  .toList()
            })
        .toList();
*/
//    print(value);
