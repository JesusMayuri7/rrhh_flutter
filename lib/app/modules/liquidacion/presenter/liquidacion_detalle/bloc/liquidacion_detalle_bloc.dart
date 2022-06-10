import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';

import 'package:rrhh_clean/app/modules/liquidacion/domain/entities/liquidacion_detalle._entity.dart';
import 'package:rrhh_clean/app/modules/liquidacion/domain/entities/liquidacion_resumen_entity.dart';
import 'package:rrhh_clean/app/modules/liquidacion/domain/usecases/get_liquidacion_resumen_siaf.dart';
import 'package:rrhh_clean/app/modules/liquidacion/domain/usecases/sum_liquidacion_detalle_usecase.dart';
import 'package:rrhh_clean/app/modules/liquidacion/domain/usecases/update_liquidacion_detalle.dart';
import 'package:rrhh_clean/app/modules/liquidacion/presenter/list_liquidacion/bloc/liquidacion_list_bloc.dart';

part 'liquidacion_detalle_event.dart';
part 'liquidacion_detalle_state.dart';

class LiquidacionDetalleBloc
    extends Bloc<LiquidacionDetalleEvent, LiquidacionDetalleState> {
  LiquidacionDetalleBloc(
      {required this.updateLiquidacionDetalleUseCase,
      required this.gettLiquidacionResumenUseCase,
      required this.liquidacionListBloc,
      required this.sumLiquidacionDetalleUseCase})
      : super(LiquidacionDetalleLoaded()) {
    liquidacionDetalleSubscripcion =
        liquidacionListBloc.stream.listen((stateList) {
      print('detalle bloc ' + stateList.runtimeType.toString());

      if (stateList is LiquidacionListLoaded) {
        print('detalle bloc ' + stateList.liquidacionDetalle.length.toString());
        //if (stateList.liquidacionDetalle.length > 0)
        add(SetLiquidacionDetalleEvent(
            dscCertificado: stateList.dscCertificado,
            liquidacionDetalle: stateList.liquidacionDetalle,
            nombres: stateList.nombres));
      }
    });

    on<UpdatedLiquidacionDetalleEvent>(
        _onUpdatedLiquidacionDetalleEventToState);
    on<SetLiquidacionDetalleEvent>(_onSetLiquidacionDetalleEventToState);
    on<SetFocusLiquidacionDetalleEvent>(
        _onSetFocusLiquidacionDetalleEventToState);
  }

  final SumLiquidacionDetalleUseCase sumLiquidacionDetalleUseCase;
  final GettLiquidacionResumenUseCase gettLiquidacionResumenUseCase;
  final LiquidacionListBloc liquidacionListBloc;
  StreamSubscription? liquidacionDetalleSubscripcion;
  final UpdateLiquidacionDetalleUseCase updateLiquidacionDetalleUseCase;

  _onSetFocusLiquidacionDetalleEventToState(
      SetFocusLiquidacionDetalleEvent event,
      Emitter<LiquidacionDetalleState> emit) async {
    print(event.excludeFocus.toString());
    emit((state as LiquidacionDetalleLoaded)
        .copyWith(excludeFocus: event.excludeFocus));
  }

  _onUpdatedLiquidacionDetalleEventToState(UpdatedLiquidacionDetalleEvent event,
      Emitter<LiquidacionDetalleState> emit) async {
    var updateLiquidacionDetale = await this.updateLiquidacionDetalleUseCase(
        ParamsUpdateLiquidacionDetalle(
            dscMonto: event.dscMonto,
            monto: event.monto,
            liquidacionDetalleId: event.liquidacionDetalleId,
            liquidacionDetalle: event.liquidacionDetalle));

    emit(updateLiquidacionDetale.fold((l) {
      return LiquidacionDetalleError(message: l.toString());
    }, (r) {
      LiquidacionDetalleEntity liquidacionDetalle = r['data'];
      return (state as LiquidacionDetalleLoaded).copyWith(liquidacionDetalle: [
        for (var item in event.liquidacionDetalle)
          if (item.id == liquidacionDetalle.id)
            item.copyWith(
              montoCertificado: liquidacionDetalle.montoCertificado,
              montoDevengado: liquidacionDetalle.montoDevengado,
              montoDevolucion: liquidacionDetalle.montoDevolucion,
              montoLiquidacion: liquidacionDetalle.montoLiquidacion,
            )
          else
            item
      ]);
    }));
  }

  _onSetLiquidacionDetalleEventToState(SetLiquidacionDetalleEvent event,
      Emitter<LiquidacionDetalleState> emit) async {
    List<LiquidacionDetalleEntity> liquidacionDetalle =
        List.from(event.liquidacionDetalle);

    // Suma Vertical de los montos de Liquidacion Detalle

    //var sumLiquidacionDetale = await this.sumLiquidacionDetalleUseCase(liquidacionDetalle);

    emit(LiquidacionDetalleLoaded(
        nombres: event.nombres, liquidacionDetalle: liquidacionDetalle));
    /*
    emit(sumLiquidacionDetale
        .fold((l) => LiquidacionDetalleError(message: l.toString()), (r) {
      return LiquidacionDetalleLoaded(
          nombres: event._nombres, liquidacionDetalle: r);
    }));*/
  }

  @override
  void onChange(Change<LiquidacionDetalleState> change) {
    super.onChange(change);
  }

  @override
  Future<void> close() {
    liquidacionDetalleSubscripcion?.cancel();

    return super.close();
  }
}
