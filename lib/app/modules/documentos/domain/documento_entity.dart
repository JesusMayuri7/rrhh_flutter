import 'package:equatable/equatable.dart';

class DocumentoEntity extends Equatable {
  DocumentoEntity({
    required this.anio,
    required this.id,
    required this.asunto,
    required this.expedientePvn,
    required this.expedienteMtc,
    required this.expedienteMef,
    required this.tipo,
    required this.numeroPvn,
    required this.fecha,
    required this.fechaDerivacion,
    required this.destino,
    required this.remite,
    required this.detalle,
    required this.estado,
    required this.control,
  });

  final String anio;
  final int id;
  final String asunto;
  final String expedientePvn;
  final String expedienteMtc;
  final String expedienteMef;
  final String remite;
  final String tipo;
  final String numeroPvn;
  final String fecha;
  final String fechaDerivacion;
  final String destino;
  final String detalle;
  final String estado;
  final String control;

  @override
  List<Object> get props {
    return [
      anio,
      id,
      asunto,
      expedientePvn,
      expedienteMtc,
      expedienteMef,
      tipo,
      remite,
      numeroPvn,
      fecha,
      fechaDerivacion,
      destino,
      remite,
      detalle,
      estado,
      control
    ];
  }
}
