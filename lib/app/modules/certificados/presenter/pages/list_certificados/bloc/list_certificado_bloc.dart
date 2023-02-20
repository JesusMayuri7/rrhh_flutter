import 'package:bloc/bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rrhh_clean/app/modules/certificados/domain/entities/certificado_entity.dart';
import 'package:rrhh_clean/app/modules/certificados/domain/usecases/list_certificado/get_list_certificados.dart';
import 'package:rrhh_clean/app/modules/certificados/domain/usecases/list_certificado/sum_list_certificados_usecase.dart';

import 'list_certificado_event.dart';
import 'list_certificado_state.dart';

class ListCertificadoBloc
    extends Bloc<ListCertificadoEvent, ListCertificadoState>
    implements Disposable {
  @override
  ListCertificadoBloc(this.listarUseCase, this.sumListCertificadosUseCase)
      : super(LoadedListCertificadoState()) {
    on<FiltrarListCertificadosEvent>(_filtrarListCertificadosEvent);
    on<GetDataAllEvent>(_getDataAllState);
    on<GetListCertificadoEvent>(_listaEventToBaseCasState);
  }

  final GetListCertificadosUseCase listarUseCase;
  final SumListCertificadosUseCase sumListCertificadosUseCase;

  List<CertificadoEntity> listaInicial = [];

  String titleAppBar = 'Start';

  _filtrarListCertificadosEvent(FiltrarListCertificadosEvent event,
      Emitter<ListCertificadoState> emit) async {
    if (state is LoadedListCertificadoState) {
      LoadedListCertificadoState stateCurrent =
          state as LoadedListCertificadoState;
      if (event.certificado.isNotEmpty) {
        double totalCertificado = 0;

        emit(LoadingListCertificadoState());

        List<CertificadoEntity> listFiltered =
            List.from(stateCurrent.listCertificadoOri.where((element) {
          totalCertificado += element.monto;
          return (element.dscCertificado.endsWith(event.certificado) ||
              element.tipo.contains(event.certificado) ||
              element.clasificador.contains(event.certificado) ||
              element.detalle.toUpperCase().contains(event.certificado));
        }).toList());

        if (listFiltered.isEmpty) {
          emit(stateCurrent.copyWidth(
              listCertificadoCur: <CertificadoEntity>[],
              totalCertificado: totalCertificado));
        } else {
/*         
          var listCertificadoUseCase =
              await this.sumListCertificadosUseCase(listFiltered);
          emit(listCertificadoUseCase.fold((l) => InitialListCertificadoState(),
              (r) {
            print(r.runtimeType);
            return stateCurrent.copyWidth(listCertificadoCur: r);
          }));*/
          emit(stateCurrent.copyWidth(listCertificadoCur: listFiltered));
        }
      } else {
        emit(stateCurrent.copyWidth(
            listCertificadoCur: stateCurrent.listCertificadoOri));
      }
    }
  }

  _getDataAllState(event, Emitter<ListCertificadoState> emit) async {
    emit(LoadingListCertificadoState());
    emit(ListDataAllState(event));
  }

  _listaEventToBaseCasState(GetListCertificadoEvent event, Emitter<ListCertificadoState> emit) async {
    emit(LoadingListCertificadoState());
    var result = await listarUseCase('2023');
    emit(result.fold((l) {
      return InitialListCertificadoState();
    }, (r) {
      return LoadedListCertificadoState(
          listCertificadoOri: (r.data as List<CertificadoEntity>),
          listCertificadoCur: (r.data as List<CertificadoEntity>));
    }));
  }

  @override
  void dispose() {}
}
