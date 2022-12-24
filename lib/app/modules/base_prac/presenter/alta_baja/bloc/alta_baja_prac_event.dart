part of 'alta_baja_prac_bloc.dart';

abstract class AltaBajaPracEvent extends Equatable {
  const AltaBajaPracEvent();

  @override
  List<Object> get props => [];
}

class AltaBajaPracEventLoad extends AltaBajaPracEvent {
  final ParamsAltaBaja params;
  AltaBajaPracEventLoad({
    required this.params,
  });
}

class AltaBajaPracEventNewFuente extends AltaBajaPracEvent {
  final String newFuente;
  AltaBajaPracEventNewFuente({
    required this.newFuente,
  });
}
