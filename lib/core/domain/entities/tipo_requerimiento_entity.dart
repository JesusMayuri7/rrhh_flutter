import 'package:equatable/equatable.dart';

class TipoRequerimientoEntity extends Equatable {
  final int id;
  final String descTipoRequerimiento;
  final String anio;
  final int isActivo;

  TipoRequerimientoEntity({
    required this.id,
    required this.descTipoRequerimiento,
    required this.anio,
    required this.isActivo,
  });

  @override
  List<Object> get props => [id, anio,descTipoRequerimiento,isActivo];


  @override
  bool get stringify => true;
}