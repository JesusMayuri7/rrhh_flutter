import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ListCertificadoEvent extends Equatable {
  ListCertificadoEvent([List props = const <dynamic>[]]) : super();
}

class ListarListCertificadoEvent implements ListCertificadoEvent {
  @override
  List<Object> get props => throw UnimplementedError();

  @override
  bool get stringify => throw UnimplementedError();
}

class GetListCertificadoEvent implements ListCertificadoEvent {
  @override
  List<Object> get props => throw UnimplementedError();

  @override
  bool get stringify => throw UnimplementedError();
}

class GetDataAllEvent implements ListCertificadoEvent {
  final List<Object> listado;

  GetDataAllEvent(this.listado);
  @override
  List<Object> get props => [listado];

  @override
  bool get stringify => true;
}

class FiltrarListCertificadosEvent implements ListCertificadoEvent {
  final String certificado;

  FiltrarListCertificadosEvent({required this.certificado});
  @override
  List<Object> get props => [certificado];

  @override
  bool get stringify => true;
}
