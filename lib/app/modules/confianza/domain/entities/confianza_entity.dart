import 'package:equatable/equatable.dart';

class ConfianzaEntity extends Equatable {
  ConfianzaEntity(
      {required this.id,
      required this.descArea,
      required this.cargo,
      required this.dni,
      required this.nombres,
      required this.inicio,
      required this.fin,
      required this.docDesignacion,
      required this.docCese,
      required this.direccion,
      required this.modalidad,
      required this.area_id,
      required this.trabajadorId,
      required this.detalle,
      required this.tipo,
      required this.plaza,
      required this.estado});

  final int id;
  final String descArea;
  final String cargo;
  final String dni;
  final String nombres;
  final String inicio;
  final String fin;
  final String docDesignacion;
  final String docCese;
  final String direccion;
  final String modalidad;
  final int area_id;
  final int trabajadorId;
  final String detalle;
  final String tipo;
  final String plaza;
  final String estado;

  @override
  String toString() {
    return 'ConfianzaEntity(id: $id, descArea: $descArea, cargo: $cargo, dni: $dni, nombres: $nombres, inicio: $inicio, fin: $fin, docDesignacion: $docDesignacion, docCese: $docCese, direccion: $direccion, modalidad: $modalidad, orgAreaId: $area_id, trabajadorId: $trabajadorId, detalle: $detalle, tipo: $tipo, plaza: $plaza)';
  }

  @override
  List<Object> get props {
    return [
      id,
      descArea,
      cargo,
      dni,
      nombres,
      inicio,
      fin,
      docDesignacion,
      docCese,
      direccion,
      modalidad,
      area_id,
      trabajadorId,
      detalle,
      tipo,
      plaza,
      estado
    ];
  }

  ConfianzaEntity copyWith(
      {int? id,
      String? descArea,
      String? cargo,
      String? dni,
      String? nombres,
      String? inicio,
      String? fin,
      String? docDesignacion,
      String? docCese,
      String? direccion,
      String? modalidad,
      int? orgAreaId,
      int? trabajadorId,
      String? detalle,
      String? tipo,
      String? plaza,
      String? estado}) {
    return ConfianzaEntity(
        id: id ?? this.id,
        descArea: descArea ?? this.descArea,
        cargo: cargo ?? this.cargo,
        dni: dni ?? this.dni,
        nombres: nombres ?? this.nombres,
        inicio: inicio ?? this.inicio,
        fin: fin ?? this.fin,
        docDesignacion: docDesignacion ?? this.docDesignacion,
        docCese: docCese ?? this.docCese,
        direccion: direccion ?? this.direccion,
        modalidad: modalidad ?? this.modalidad,
        area_id: orgAreaId ?? this.area_id,
        trabajadorId: trabajadorId ?? this.trabajadorId,
        detalle: detalle ?? this.detalle,
        tipo: tipo ?? this.tipo,
        plaza: plaza ?? this.plaza,
        estado: estado ?? this.estado);
  }

  Map<String, dynamic> toMap() => {
        "modalidad": modalidad,
        "tipo": tipo,
        "estado": estado,
        "plaza": plaza,
        //"id": id,
        "desc_area": descArea,
        "cargo": cargo,
        "dni": dni,
        "nombres": nombres,
        "inicio": inicio,
        "fin": fin,
        "doc_designacion": docDesignacion,
        "doc_cese": docCese,
        "direccion": direccion,
        //"org_area_id": orgAreaId,
        //"trabajador_id": trabajadorId,
        "detalle": detalle,
      };

  @override
  bool get stringify => true;
}
