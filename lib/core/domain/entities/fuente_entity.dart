// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class FuenteEntity extends Equatable {
  final int id;
  final String dscFuente;
  final String abvFuente;
  FuenteEntity({
    required this.id,
    required this.dscFuente,
    required this.abvFuente,
  });

  @override
  List<Object> get props => [id, dscFuente, abvFuente];
}
