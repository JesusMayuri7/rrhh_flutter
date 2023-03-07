// To parse this JSON data, do
//
//     final judicialDetailModel = judicialDetailModelFromJson(jsonString);

import 'dart:convert';
import 'package:rrhh_clean/app/modules/judiciales/domain/judicial_detail_entity.dart';

JudicialDetailModel judicialDetailModelFromJson(String str) => JudicialDetailModel.fromJson(json.decode(str));

class JudicialDetailModel extends JudicialDetailEntity{
    JudicialDetailModel({
        required this.id,
        required this.judicialId,
        required this.detalle,
        required this.expedientePvn,
        required this.nroDocumento,
        required this.fechaExpedientePvn,
        required this.createdAt,
        required this.updatedAt,
    }):super(id: id,judicialId: judicialId,detalle: detalle,expedientePvn: expedientePvn,nroDocumento: nroDocumento,
    fechaExpedientePvn: fechaExpedientePvn,createdAt: createdAt,updatedAt: updatedAt);

    int id;
    int judicialId;
    String detalle;
    String expedientePvn;
    String nroDocumento;
    String fechaExpedientePvn;
    String createdAt;
    String updatedAt;

    factory JudicialDetailModel.fromJson(Map<String, dynamic> json) => JudicialDetailModel(
        id: json["id"] ?? 0,
        judicialId: json["judicial_id"] ?? 0,
        detalle: json["detalle"] ?? '',
        expedientePvn: json["expediente_pvn"] ?? '',
        nroDocumento: json["nro_documento"] ?? '',
        fechaExpedientePvn: json["fecha_expediente_pvn"] ?? '',
        createdAt: json["created_at"] ?? '',
        updatedAt: json["updated_at"] ?? '',
    );

}
