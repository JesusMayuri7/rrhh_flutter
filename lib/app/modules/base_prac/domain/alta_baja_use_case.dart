// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dartz/dartz.dart';

import 'package:rrhh_clean/app/modules/base_prac/domain/i_prac_repository.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';
import 'package:rrhh_clean/core/domain/use_cases/usecase.dart';
import 'package:rrhh_clean/core/errors/failure.dart';

class AltaBajaPracUseCase implements UseCase<ResponseModel, ParamsAltaBaja> {
  final IPracRepository iPracRepository;

  AltaBajaPracUseCase({
    required this.iPracRepository,
  });

  @override
  Future<Either<Failure, ResponseModel>> call(ParamsAltaBaja params) async {
    return await iPracRepository.altaBajaPrac(params);
  }
}

class ParamsAltaBaja {
  int id;
  int anio;
  String fechaBaja;
  String fechaAlta;
  String codigoBaja;
  String codigoAlta;
  String plaza;
  String descUnidad;
  String descArea;
  String dni;
  String nombres;
  String tramite;
  String estado;
  String estados;
  String estadoPap;
  String estadoOpp;
  String estadoAir;

  ParamsAltaBaja({
    required this.id,
    required this.anio,
    required this.fechaBaja,
    required this.fechaAlta,
    required this.codigoBaja,
    required this.codigoAlta,
    required this.plaza,
    required this.descUnidad,
    required this.descArea,
    required this.dni,
    required this.nombres,
    required this.tramite,
    required this.estado,
    required this.estados,
    required this.estadoPap,
    required this.estadoOpp,
    required this.estadoAir,
  });

  @override
  String toString() {
    return 'ParamsAltaBaja(id: $id, anio: $anio, fechaBaja: $fechaBaja, fechaAlta: $fechaAlta, codigoBaja: $codigoBaja, codigoAlta: $codigoAlta, plaza: $plaza, descUnidad: $descUnidad, descArea: $descArea, dni: $dni, nombres: $nombres, tramite: $tramite, estado: $estado, estados: $estados, estadoPap: $estadoPap, estadoOpp: $estadoOpp, estadoAir: $estadoAir)';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'anio': anio,
      'fechaBaja': fechaBaja,
      'fechaAlta': fechaAlta,
      'codigoBaja': codigoBaja,
      'codigoAlta': codigoAlta,
      'plaza': plaza,
      'descUnidad': descUnidad,
      'descArea': descArea,
      'dni': dni,
      'nombres': nombres,
      'tramite': tramite,
      'estado': estado,
      'estados': estados,
      'estadoPap': estadoPap,
      'estadoOpp': estadoOpp,
      'estadoAir': estadoAir,
    };
  }

  factory ParamsAltaBaja.fromMap(Map<String, dynamic> map) {
    return ParamsAltaBaja(
      id: map['id'] as int,
      anio: map['anio'] as int,
      fechaBaja: map['fechaBaja'] as String,
      fechaAlta: map['fechaAlta'] as String,
      codigoBaja: map['codigoBaja'] as String,
      codigoAlta: map['codigoAlta'] as String,
      plaza: map['plaza'] as String,
      descUnidad: map['descUnidad'] as String,
      descArea: map['descArea'] as String,
      dni: map['dni'] as String,
      nombres: map['nombres'] as String,
      tramite: map['tramite'] as String,
      estado: map['estado'] as String,
      estados: map['estados'] as String,
      estadoPap: map['estadoPap'] as String,
      estadoOpp: map['estadoOpp'] as String,
      estadoAir: map['estadoAir'] as String,
    );
  }

  ParamsAltaBaja copyWith({
    int? id,
    int? anio,
    String? fechaBaja,
    String? fechaAlta,
    String? codigoBaja,
    String? codigoAlta,
    String? plaza,
    String? descUnidad,
    String? descArea,
    String? dni,
    String? nombres,
    String? tramite,
    String? estado,
    String? estados,
    String? estadoPap,
    String? estadoOpp,
    String? estadoAir,
  }) {
    return ParamsAltaBaja(
      id: id ?? this.id,
      anio: anio ?? this.anio,
      fechaBaja: fechaBaja ?? this.fechaBaja,
      fechaAlta: fechaAlta ?? this.fechaAlta,
      codigoBaja: codigoBaja ?? this.codigoBaja,
      codigoAlta: codigoAlta ?? this.codigoAlta,
      plaza: plaza ?? this.plaza,
      descUnidad: descUnidad ?? this.descUnidad,
      descArea: descArea ?? this.descArea,
      dni: dni ?? this.dni,
      nombres: nombres ?? this.nombres,
      tramite: tramite ?? this.tramite,
      estado: estado ?? this.estado,
      estados: estados ?? this.estados,
      estadoPap: estadoPap ?? this.estadoPap,
      estadoOpp: estadoOpp ?? this.estadoOpp,
      estadoAir: estadoAir ?? this.estadoAir,
    );
  }

  String toJson() => json.encode(toMap());

  factory ParamsAltaBaja.fromJson(String source) =>
      ParamsAltaBaja.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant ParamsAltaBaja other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.anio == anio &&
        other.fechaBaja == fechaBaja &&
        other.fechaAlta == fechaAlta &&
        other.codigoBaja == codigoBaja &&
        other.codigoAlta == codigoAlta &&
        other.plaza == plaza &&
        other.descUnidad == descUnidad &&
        other.descArea == descArea &&
        other.dni == dni &&
        other.nombres == nombres &&
        other.tramite == tramite &&
        other.estado == estado &&
        other.estados == estados &&
        other.estadoPap == estadoPap &&
        other.estadoOpp == estadoOpp &&
        other.estadoAir == estadoAir;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        anio.hashCode ^
        fechaBaja.hashCode ^
        fechaAlta.hashCode ^
        codigoBaja.hashCode ^
        codigoAlta.hashCode ^
        plaza.hashCode ^
        descUnidad.hashCode ^
        descArea.hashCode ^
        dni.hashCode ^
        nombres.hashCode ^
        tramite.hashCode ^
        estado.hashCode ^
        estados.hashCode ^
        estadoPap.hashCode ^
        estadoOpp.hashCode ^
        estadoAir.hashCode;
  }
}
