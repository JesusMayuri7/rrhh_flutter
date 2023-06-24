// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class ModalidadEntity extends Equatable {
  final int id;
  final String dsc_modalidad;

  ModalidadEntity({
    required this.id,
    required this.dsc_modalidad,
  });

  @override
  List<Object> get props => [id, dsc_modalidad];


  @override
  bool get stringify => true;
}
