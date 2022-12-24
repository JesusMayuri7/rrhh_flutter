// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'certificados_bloc.dart';

/*
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

import 'package:rrhh_clean/app/modules/certificados/domain/entities/concepto_entity.dart';
import 'package:rrhh_clean/app/modules/certificados/domain/entities/modalidad_entity.dart';
import 'package:rrhh_clean/core/domain/models/item_model.dart';
*/
enum CertificadoStatus { initial, loading, valid, loaded, failure, saved }

// INITIAL al iniciar el formulario
// LOADING al ejecutar un proceso
// LOADED_INIT data inicial cargada
// VALID al validar un certificado
// FAILURE error producido
// SAVED data grabada
@immutable
abstract class CertificadosState extends Equatable {
  //const CertificadosState();
}

class InitialCertificadosState extends CertificadosState {
  @override
  List<Object?> get props => [];
}

class LoadingCertificadosState extends CertificadosState {
  @override
  List<Object?> get props => [];
}

class ErrorCertificadoState extends CertificadosState {
  final String status;
  final String message;

  ErrorCertificadoState({required this.status, required this.message});
  @override
  List<Object?> get props => [message, status];
}

class ModalidadConceptoClasificadorState extends CertificadosState {
  final List<ModalidadEntity> modalidad;
  final List<ConceptoEntity> concepto;
  final List<ClasificadorEntity> clasificador;
  ModalidadConceptoClasificadorState(
      {required this.modalidad,
      required this.concepto,
      required this.clasificador});

  @override
  List<Object?> get props => [this.modalidad, this.concepto, this.clasificador];
}

class LoadedCertificadosState extends CertificadosState {
  final String status;
  final String message;
  final String detalle;
  final String tipo;
  final String certificado;
  final double montoCertificado;
  final String anio;
  final ModalidadEntity modalidad;
  final ConceptoEntity concepto;
  final ClasificadorEntity clasificador;
  final List<ModalidadEntity> modalidadList;
  final List<ClasificadorEntity> clasificadorList;
  final List<ConceptoEntity> conceptoList;
  final List<Map<String, dynamic>> clasificadorConcepto;
  LoadedCertificadosState({
    required this.status,
    required this.message,
    required this.conceptoList,
    required this.clasificadorList,
    required this.modalidadList,
    required this.concepto,
    required this.clasificador,
    required this.detalle,
    required this.tipo,
    required this.modalidad,
    required this.montoCertificado,
    required this.certificado,
    required this.anio,
    required this.clasificadorConcepto,
  });

  LoadedCertificadosState copyWidth({
    String? status,
    String? message,
    String? certificado,
    String? anio,
    String? detalle,
    String? tipo,
    double? montoCertificado,
    List<Map<String, dynamic>>? clasificadorConcepto,
    ModalidadEntity? modalidad,
    ClasificadorEntity? clasificador,
    ConceptoEntity? concepto,
    List<ModalidadEntity>? modalidadList,
    List<ClasificadorEntity>? clasificadorList,
    List<ConceptoEntity>? conceptoList,
  }) =>
      LoadedCertificadosState(
          modalidadList: modalidadList ?? this.modalidadList,
          clasificadorList: clasificadorList ?? this.clasificadorList,
          conceptoList: conceptoList ?? this.conceptoList,
          concepto: concepto ?? this.concepto,
          clasificador: clasificador ?? this.clasificador,
          status: status ?? this.status,
          message: message ?? this.message,
          detalle: detalle ?? this.detalle,
          tipo: tipo ?? this.tipo,
          modalidad: modalidad ?? this.modalidad,
          anio: anio ?? this.anio,
          montoCertificado: montoCertificado ?? this.montoCertificado,
          certificado: certificado ?? this.certificado,
          clasificadorConcepto:
              clasificadorConcepto ?? this.clasificadorConcepto);

  @override
  List<Object?> get props => [
        conceptoList,
        clasificadorList,
        modalidadList,
        concepto,
        clasificador,
        status,
        message,
        certificado,
        anio,
        montoCertificado,
        clasificadorConcepto,
        modalidad,
        detalle,
        tipo
      ];

  @override
  bool get stringify => true;
}
