import 'package:equatable/equatable.dart';

class ClasificadorEntity extends Equatable {
  final int id;
  final String dscClasificador;

  ClasificadorEntity({
    required this.id,
    required this.dscClasificador,
  });

  @override
  List<Object?> get props => [id, dscClasificador];
}
