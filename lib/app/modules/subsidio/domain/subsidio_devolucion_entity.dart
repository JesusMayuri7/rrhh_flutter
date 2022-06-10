import 'package:equatable/equatable.dart';

class SubsidioDevolucionEntity extends Equatable {
  SubsidioDevolucionEntity(
      {required this.id,
      required this.anio,
      required this.modalidadId,
      required this.dscModalidad,
      required this.certificadoId,
      required this.dscCertificado,
      required this.codigoPlaza,
      required this.codigoSiga,
      required this.fuenteId,
      required this.dscFuente,
      required this.metaId,
      required this.dscMeta,
      required this.dni,
      required this.nombres,
      required this.expediente,
      required this.fechaDevengado,
      required this.clasificadorId,
      required this.dscClasificador,
      required this.tipo,
      required this.estado,
      required this.mesProceso,
      required this.montoDevolucion});

  final int id;
  final int anio;
  final int modalidadId;
  final String dscModalidad;
  final int certificadoId;
  final String dscCertificado;
  final String codigoPlaza;

  final String codigoSiga;
  final int fuenteId;
  final String dscFuente;
  final int metaId;
  final String dscMeta;
  final String dni;
  final String nombres;
  final String expediente;
  final String fechaDevengado;
  final int clasificadorId;
  final String dscClasificador;
  final String tipo;
  final String estado;
  final int mesProceso;
  final double montoDevolucion;

  @override
  List<Object> get props {
    return [
      id,
      anio,
      modalidadId,
      dscModalidad,
      certificadoId,
      dscCertificado,
      codigoPlaza,
      codigoSiga,
      fuenteId,
      dscFuente,
      metaId,
      dscMeta,
      dni,
      nombres,
      expediente,
      fechaDevengado,
      clasificadorId,
      dscClasificador,
      tipo,
      estado,
      mesProceso,
      montoDevolucion
    ];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'anio': anio,
      'modalidadId': modalidadId,
      'dscModalidad': dscModalidad,
      'certificadoId': certificadoId,
      'dscCertificado': dscCertificado,
      'codigoPlaza': codigoPlaza,
      'codigoSiga': codigoSiga,
      'fuenteId': fuenteId,
      'dscFuente': dscFuente,
      'metaId': metaId,
      'dscMeta': dscMeta,
      'dni': dni,
      'nombres': nombres,
      'expediente': expediente,
      'fechaDevengado': fechaDevengado,
      'clasificadorId': clasificadorId,
      'dscClasificador': dscClasificador,
      'tipo': tipo,
      'estado': estado,
      'mesProceso': mesProceso,
      'montoDevolucion': montoDevolucion,
    };
  }
}
