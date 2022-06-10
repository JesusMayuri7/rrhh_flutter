import 'package:equatable/equatable.dart';

class ConceptoEntity extends Equatable {
  final int id;
  final String dscConcepto;

  ConceptoEntity({required this.id, required this.dscConcepto});
  @override
  List<Object?> get props => [id, dscConcepto];
}
