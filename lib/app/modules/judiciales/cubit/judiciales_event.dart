// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'judiciales_bloc.dart';

abstract class JudicialesEvent extends Equatable {
  const JudicialesEvent();

  @override
  List<Object> get props => [];
}

class JudicialesLoadEvent extends JudicialesEvent {
  final String anio;
  JudicialesLoadEvent({
    required this.anio,
  });
}
