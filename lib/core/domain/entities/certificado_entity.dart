import 'package:equatable/equatable.dart';

class CertificadoEntity extends Equatable {
  CertificadoEntity({
    required this.id,
    required this.anio,
    required this.dscCertificado,
    required this.activo,
    required this.detalle,
    required this.monto,
    required this.solicitante,
    required this.docSolicitado,
    required this.docCertificacion,
  });

  final int id;
  final String anio;
  final String dscCertificado;
  final int activo;
  final String detalle;
  final String monto;
  final String solicitante;
  final String docSolicitado;
  final String docCertificacion;

  @override
  List<Object> get props {
    return [
      id,
      anio,
      dscCertificado,
      activo,
      detalle,
      monto,
      solicitante,
      docSolicitado,
      docCertificacion,
    ];
  }
}
