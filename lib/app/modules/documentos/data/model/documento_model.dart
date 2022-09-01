import 'dart:convert';

import '../../domain/documento_entity.dart';

List<DocumentoModel> documentoModelFromJson(String str) =>
    List<DocumentoModel>.from(
        json.decode(str).map((x) => DocumentoModel.fromJson(x)));

String documentoModelToJson(List<DocumentoModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DocumentoModel extends DocumentoEntity {
  DocumentoModel({
    required String anio,
    required int id,
    required String asunto,
    required String tipo,
    required String expedientePvn,
    required String expedienteMtc,
    required String expedienteMef,
    required String numeroPvn,
    required String destino,
    required String fecha,
    required String remite,
    required String detalle,
    required String estado,
    required String control,
  }) : super(
            anio: anio,
            id: id,
            asunto: asunto,
            tipo: tipo,
            expedientePvn: expedientePvn,
            expedienteMtc: expedienteMtc,
            expedienteMef: expedienteMef,
            numeroPvn: numeroPvn,
            destino: destino,
            remite: remite,
            fecha: fecha,
            detalle: detalle,
            estado: estado,
            control: control);

  factory DocumentoModel.fromJson(Map<String, dynamic> json) => DocumentoModel(
        id: json["id"],
        anio: json["anio"] ?? '',
        asunto: json["asunto"] ?? '',
        expedientePvn: json["expediente_pvn"] ?? '',
        expedienteMtc: json["expediente_mtc"] ?? '',
        expedienteMef: json["expediente_mef"] ?? '',
        numeroPvn: json["numero_pvn"] ?? '',
        fecha: json['fecha'] ?? '',
        tipo: json['tipo'] ?? '',
        remite: json['remite'] ?? '',
        destino: json["destino"] ?? '',
        detalle: json["detalle"] ?? '',
        estado: json["estado"] ?? '',
        control: json["control"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "anio": anio,
        "id": id,
        "asunto": asunto,
        "eexpediente_pvn": expedientePvn,
        "eexpediente_mtc": expedienteMtc,
        "eexpediente_mef": expedienteMef,
        "numero_pvn": numeroPvn,
        "fecha": fecha,
        "remite": remite,
        "destino": destino,
        "detalle": detalle,
        "estado": estado,
        "tipo": tipo,
        "control": control,
      };
}
