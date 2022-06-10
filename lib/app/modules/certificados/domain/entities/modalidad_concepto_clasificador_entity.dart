import 'package:equatable/equatable.dart';
import 'concepto_entity.dart';

import 'modalidad_entity.dart';

import '../../../../../core/domain/entities/clasificador_entity.dart';

class ModalidadConceptoClasificadorEntity extends Equatable {
  ModalidadConceptoClasificadorEntity(
      {required this.modalidad,
      required this.concepto,
      required this.clasificador});

  final List<ModalidadEntity> modalidad;
  final List<ConceptoEntity> concepto;
  final List<ClasificadorEntity> clasificador;

  @override
  List<Object?> get props => [modalidad, concepto, clasificador];
}
