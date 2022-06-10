part of 'subsidio_devolucion_bloc.dart';

abstract class SubsidioDevolucionEvent extends Equatable {
  const SubsidioDevolucionEvent();
}

class SubsidioDevolucionUpdate extends SubsidioDevolucionEvent {
  final int id;
  final String campo;
  final String valor;
  SubsidioDevolucionUpdate({
    required this.id,
    required this.campo,
    required this.valor,
  });

  @override
  List<Object> get props => [this.id, this.campo, this.valor];
}

class SubsidioDevolucionModalidad extends SubsidioDevolucionEvent {
  final String modalidad;
  SubsidioDevolucionModalidad({
    required this.modalidad,
  });

  @override
  String toString() => 'SubsidioDevolucionModalidad( modalidad: $modalidad)';

  @override
  List<Object> get props => [this.modalidad];
}

class SubsidioDevolucionLoad extends SubsidioDevolucionEvent {
  final String anio;
  final String modalidad;
  SubsidioDevolucionLoad({
    required this.anio,
    required this.modalidad,
  });

  @override
  String toString() =>
      'SubsidioDevolucionLoad(anio: $anio, modalidad: $modalidad)';

  @override
  List<Object> get props => [this.anio, this.modalidad];
}
