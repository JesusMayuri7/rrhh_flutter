part of 'certificados_bloc.dart';

/*
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:rrhh_clean/app/modules/airhsp/data/models/conceptos_model.dart';
import 'package:rrhh_clean/app/modules/airhsp/domain/entities/concepto_entity.dart';
import 'package:rrhh_clean/app/modules/certificados/domain/entities/modalidad_entity.dart';
import 'package:rrhh_clean/core/domain/models/item_model.dart';
*/

@immutable
abstract class CertificadosEvent extends Equatable {}

class GetDataInitial implements CertificadosEvent {
  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => true;
}

class ValidarCertificadoEvent implements CertificadosEvent {
  final String detalle;
  final ModalidadEntity modalidad;
  final String certificado;
  final String anio;
  final String tipo;
  final double montoCertificado;
  ValidarCertificadoEvent({
    required this.detalle,
    required this.tipo,
    required this.modalidad,
    required this.montoCertificado,
    required this.certificado,
    required this.anio,
  });

  @override
  List<Object?> get props =>
      [detalle, certificado, anio, modalidad, montoCertificado, tipo];

  @override
  bool? get stringify => true;
}

class AgregarCertificadoEvent implements CertificadosEvent {
  final String certificado;
  final double montoCertificado;
  AgregarCertificadoEvent({
    required this.certificado,
    required this.montoCertificado,
  });

  @override
  List<Object> get props => [this.certificado, this.montoCertificado];

  @override
  bool get stringify => throw UnimplementedError();
}

class SaveEvent implements CertificadosEvent {
  @override
  List<Object?> get props => throw UnimplementedError();

  @override
  bool? get stringify => throw UnimplementedError();
}

class SaveCertificadoEvent implements CertificadosEvent {
  final String certiificado;
  final String anio;
  final double montoCertificado;
  final int modalidadId;
  final List<Map<String, dynamic>> conceptoClasificado;
  SaveCertificadoEvent(
      {required this.certiificado,
      required this.anio,
      required this.montoCertificado,
      required this.modalidadId,
      required this.conceptoClasificado});

  @override
  List<Object> get props =>
      [certiificado, anio, montoCertificado, modalidadId, conceptoClasificado];

  @override
  bool get stringify => throw UnimplementedError();
}

class AgregarClasificadorEvent implements CertificadosEvent {
  final List<Map<String, dynamic>> listado;
  final ConceptoEntity concepto;
  final ClasificadorEntity clasificador;
  AgregarClasificadorEvent({
    required this.listado,
    required this.concepto,
    required this.clasificador,
  });

  @override
  List<Object> get props => [this.concepto, this.clasificador];

  @override
  bool get stringify => throw UnimplementedError();
}

class GetModalidadConceptoEvent implements CertificadosEvent {
  @override
  List<Object> get props => [];

  @override
  bool? get stringify => throw UnimplementedError();
}
