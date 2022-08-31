import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:rrhh_clean/app/modules/liquidacion/domain/usecases/add_liquidacion_usecase.dart';
import 'package:rrhh_clean/core/domain/entities/clasificador_entity.dart';
import 'package:rrhh_clean/core/domain/use_cases/get_clasificadores_usecase.dart';

part 'new_liquidacion_event.dart';
part 'new_liquidacion_state.dart';

class NewLiquidacionBloc
    extends Bloc<NewLiquidacionEvent, NewLiquidacionState> {
  NewLiquidacionBloc(
    this._getClasificadoresUseCase,
    this._addLiquidacionUseCase,
  ) : super(NewLiquidacionSuccessState(
            clasificadorMonto: [], clasificadores: [])) {
    on<AddLiquidacionEvent>(_onAddLiquidacionEventToState);
    on<GetLiquidacionClasificadoresEvent>(
        _onGetLiquidacionClasificadoresEventToState);
    on<AddClasificadorMontoEvent>(_onAddClasificadorMontoEventToState);
  }

  final GetClasificadoresUseCase _getClasificadoresUseCase;

  final AddLiquidacionUseCase _addLiquidacionUseCase;

  _onAddLiquidacionEventToState(
      AddLiquidacionEvent event, Emitter<NewLiquidacionState> emit) async {
    if (state is NewLiquidacionSuccessState) {
      var result = await this._addLiquidacionUseCase(event.liquidacionEntity);
      emit(result.fold((l) {
        print(l.toString());
        return (state as NewLiquidacionSuccessState)
            .copyWith(status: AddLiquidacionStatus.Failure);
      }, (r) {
        return (state as NewLiquidacionSuccessState).copyWith(
            status: AddLiquidacionStatus.Saved,
            clasificadorMonto: [],
            total: 0);
      }));
    }
  }

  _onGetLiquidacionClasificadoresEventToState(
      event, Emitter<NewLiquidacionState> emit) async {
    if (event is GetLiquidacionClasificadoresEvent) {
      var result = await this._getClasificadoresUseCase(event.anio);
      emit(result.fold((l) {
        return (state as NewLiquidacionSuccessState)
            .copyWith(status: AddLiquidacionStatus.Failure);
      }, (r) {
        return (state as NewLiquidacionSuccessState).copyWith(
            status: AddLiquidacionStatus.ClasificadorLoaded,
            clasificadores: r.data,
            clasificadorMonto: [],
            total: 0);
      }));
    }
  }

  _onAddClasificadorMontoEventToState(
      event, Emitter<NewLiquidacionState> emit) async {
    if (event is AddClasificadorMontoEvent) {
      if (state is NewLiquidacionSuccessState) {
        num totalizado = 0;
        List<Map<String, dynamic>> lista = [];
        (state is NewLiquidacionSuccessState)
            ? lista =
                List.of((state as NewLiquidacionSuccessState).clasificadorMonto)
            : lista = [];
        totalizado = (state as NewLiquidacionSuccessState).total;
        if (lista
            .every((element) => element['id'] != event.clasificadorEntity.id)) {
          if (lista.length == 0) {
            lista.add({
              'dsc_clasificador': event.clasificadorEntity.dscClasificador,
              'id': event.clasificadorEntity.id,
              'monto_certificado': event.montoCertificado
            });
            totalizado += event.montoCertificado;
          } else {
            lista.insert(0, {
              'dsc_clasificador': event.clasificadorEntity.dscClasificador,
              'id': event.clasificadorEntity.id,
              'monto_certificado': event.montoCertificado
            });
          }
          totalizado += event.montoCertificado;
          emit((state as NewLiquidacionSuccessState).copyWith(
              status: AddLiquidacionStatus.ClasificadorAded,
              clasificadorMonto: lista,
              total: totalizado));
        }
      }
    }
  }
}
