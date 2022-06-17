import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rrhh_clean/app/modules/liquidacion/domain/entities/liquidacion_entity.dart';
import 'package:rrhh_clean/app/modules/liquidacion/domain/entities/liquidacion_resumen_entity.dart';
import 'package:rrhh_clean/app/modules/liquidacion/domain/entities/params_liquidacion_resumen.dart';
import 'package:rrhh_clean/app/modules/liquidacion/domain/usecases/get_liquidacion_resumenes.dart';

part 'liquidacion_resumen_event.dart';
part 'liquidacion_resumen_state.dart';

class LiquidacionResumenBloc
    extends Bloc<LiquidacionResumenEvent, LiquidacionResumenState> {
  LiquidacionResumenBloc({required this.gettLiquidacionResumenesUseCase})
      : super(LiquidacionResumenLoaded()) {
    on<LiquidacionResumenLoad>(_onLiquidacionResumenLoadEventToState);
  }

  final GettLiquidacionResumenesUseCase gettLiquidacionResumenesUseCase;

  _onLiquidacionResumenLoadEventToState(LiquidacionResumenLoad event,
      Emitter<LiquidacionResumenState> emit) async {
    print('resumen bloc ' + state.runtimeType.toString());
    //if (state is LiquidacionResumenLoaded)
    {
      var result = await this.gettLiquidacionResumenesUseCase(
          ParamsLiquidacionResumen(
              dscClasificador: event.dscClasificador,
              dscCertificado: event.dscCertificado,
              anio: event.anio));
      emit(result.fold((l) {
        print(l.toString());
        return LiquidacionResumenError(message: l.toString());
      }, (r) {
        List<LiquidacionResumenEntity> listResumenLiquidacion =
            List.from(r[0].data);
        List<LiquidacionResumenEntity> listResumenSiaf = List.from(r[1].data);

        return LiquidacionResumenLoaded(
          allClasificador: event.allClasificador,
          dscClasificador: event.dscClasificador,
          dscCertificado: event.dscCertificado,
          liquidacionResumenSiaf: listResumenSiaf,
          liquidacionResumenLiquidacion: listResumenLiquidacion,
        );
        /*(state as LiquidacionResumenLoaded).copyWith(
          allClasificador: event.allClasificador,
          dscClasificador: event.dscClasificador,
          dscCertificado: event.dscCertificado,
          liquidacionResumenSiaf: listResumenSiaf,
          liquidacionResumenLiquidacion: listResumenLiquidacion,
        );*/
      }));
    }
/*
      yield LiquidacionResumenLoaded(
          dscCertificado: event.dscCertificado,
          dscClasificador: event.dscClasificador,
          listLiquidacion: _buildResumen(event.dscClasificador,
              event.dscCertificado, event.listLliquidacion));
              */
  }
}
