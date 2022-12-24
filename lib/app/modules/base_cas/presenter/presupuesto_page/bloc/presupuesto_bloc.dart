import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/entities/presupuesto_cas_entity.dart';
import '../../../domain/usecases/pim_cas_use_case.dart';

part 'presupuesto_event.dart';
part 'presupuesto_state.dart';

class PresupuestoBloc extends Bloc<PresupuestoEvent, PresupuestoState> {
  PresupuestoBloc(this._presupuestoCasUseCase) : super(PresupuestoLoaded()) {
    on<PresupuestoCasEventLoading>(_onPresupuestoCasEventLoadingEventToState);
  }

  PimCasUseCase _presupuestoCasUseCase;

  _onPresupuestoCasEventLoadingEventToState(
      PresupuestoCasEventLoading event, Emitter<PresupuestoState> emit) async {
    emit(PresupuestoLoading());
    var result = await _presupuestoCasUseCase(event.anio);
    emit(result.fold((l) {
      return PresupuestoError(message: l.toString());
    }, (r) {
      //List<PresupuestoCasEntity> lista = _agregarMontoTotal(r);
      List<PresupuestoCasEntity> lista =
          List<PresupuestoCasEntity>.from(r.data).toList();
      return PresupuestoLoaded(presupuestoCasList: _agregarMontoTotal(lista));
    }));
  }

  List<PresupuestoCasEntity> _agregarMontoTotal(
      List<PresupuestoCasEntity> _lista) {
    double pia = 0;
    double pim = 0;
    double certificado = 0;
    double devengado = 0;
    double enero = 0;
    double febrero = 0;
    double marzo = 0;
    double abril = 0;
    double mayo = 0;
    double junio = 0;
    double julio = 0;
    double agosto = 0;
    double setiembre = 0;
    double octubre = 0;
    double noviembre = 0;
    double diciembre = 0;

    _lista.map((e) {
      pia += e.pia;
      pim += e.pim;
      certificado += e.certificado;
      devengado += e.devengado;
      enero += e.enero;
      febrero += e.febrero;
      marzo += e.marzo;
      abril += e.abril;
      mayo += e.mayo;
      junio += e.junio;
      julio += e.julio;
      agosto += e.agosto;
      setiembre += e.setiembre;
      octubre += e.octubre;
      noviembre += e.noviembre;
      diciembre += e.diciembre;
    }).toList();
    _lista.add(PresupuestoCasEntity(
      anoEje: 0,
      fuente: '',
      producto: '',
      meta: '',
      clasificador: '',
      pia: pia,
      pim: pim,
      certificado: certificado,
      devengado: devengado,
      enero: enero,
      febrero: febrero,
      marzo: marzo,
      abril: abril,
      mayo: mayo,
      junio: junio,
      julio: julio,
      agosto: agosto,
      setiembre: setiembre,
      octubre: octubre,
      noviembre: noviembre,
      diciembre: diciembre,
    ));
    return _lista;
  }
}
