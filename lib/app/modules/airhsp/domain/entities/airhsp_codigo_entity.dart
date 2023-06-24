// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

enum ModalidadEntrega { ocasional,periodico,permanete}
enum FrecuenciaEntrega { mensual,periodico,cese,grado,ocasional,corresponder,unica}
enum FrecuenciaMes { enero,febrero,marzo,abril,mayo,junio,julio,agosto,setiembre,octubre,noviembre,diciembre}
enum TipoCodigo { ingreso,aporte}

class AirhspCodigo extends Equatable {
  final int id;
  final int modalidadId;
  final String descModalidad;
  final String anio;
  final String codigo;
  final String descCodigo;
  final String descAbreviatura;
  final String modalidadEntrega;
  final String frecuenciaEntrega;
  final String frecuenciaMes;
  final String tipoCodigo;
  final int afecto;
  final int estado;

  AirhspCodigo({
    required this.id,
    required this.anio,
    required this.modalidadId,
    required this.descModalidad,
    required this.codigo,
    required this.descCodigo,
    required this.descAbreviatura,
    required this.modalidadEntrega,
    required this.frecuenciaEntrega,
    required this.frecuenciaMes,
    required this.tipoCodigo,
    required this.afecto,
    required this.estado,
  });

  @override
  List<Object> get props {
    return [
      id,
      modalidadId,
      descModalidad,
      anio,
      codigo,
      descCodigo,
      descAbreviatura,
      modalidadEntrega,
      frecuenciaEntrega,
      frecuenciaMes,
      tipoCodigo,
      afecto,
      estado,
    ];
  }

  @override
  bool get stringify => true;
}
