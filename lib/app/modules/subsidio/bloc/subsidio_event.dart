part of 'subsidio_bloc.dart';

abstract class SubsidioEvent extends Equatable {
  const SubsidioEvent();
}

class SubsidioDataInitialLoad extends SubsidioEvent {
  final String anio;
  SubsidioDataInitialLoad({
    required this.anio,
  });

  @override
  List<Object> get props => [this.anio];
}
