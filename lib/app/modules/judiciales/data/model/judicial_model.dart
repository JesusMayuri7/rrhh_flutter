import 'dart:convert';

import '../../domain/judicial_detail_entity.dart';
import '../../domain/judicial_entity.dart';
import 'judicial_detalle_model.dart';

List<JudicialModel> judicialModelFromJson(String str) =>
    List<JudicialModel>.from(
        json.decode(str).map((x) => JudicialModel.fromJson(x)));

String judicialModelToJson(List<JudicialModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class JudicialModel extends JudicialEntity {
  JudicialModel(
      {required String anio,
      required int id,
      required String presupuesto,
      required String fuente,
      required int fuenteId,
      required String descArea,
      required int orgAreaId,
      required String finalidad,
      required int metaId,
      required String cargo,
      required String fechaIngreso,
      required String dni,
      required String nombres,
      required String detalle,
      required String nroExpedienteJudicial,
      required String expedientePvn,
      required String expedienteMtc,
      required String expedienteMef,
      required String estadoProcesal,
      required num montoJudicial,
      required num montoPlanilla,
      required String observacion,
      required String documentoOrh,
      required String codigoPlaza,
      required String nroCap,
      required String descEscala,
      required List<JudicialDetailEntity> judicialDetailEntity
      })
      : super(
            id: id,
            anio: anio,
            presupuesto: presupuesto,
            fuente: fuente,
            fuenteId: fuenteId,
            descArea: descArea,
            orgAreaId: orgAreaId,
            finalidad: finalidad,
            metaId: metaId,
            cargo: cargo,
            dni: dni,
            fechaIngreso: fechaIngreso,
            nombres: nombres,
            detalle: detalle,
            nroExpedienteJudicial: nroExpedienteJudicial,
            expedientePvn: expedientePvn,
            expedienteMef: expedienteMef,
            expedienteMtc: expedienteMtc,
            estadoProcesal: estadoProcesal,
            montoJudicial: montoJudicial,
            montoPlanilla: montoPlanilla,
            observacion: observacion,
            documentoOrh: documentoOrh,
            codigoPlaza: codigoPlaza,
            nroCap: nroCap,
            descEscala: descEscala,
            judicialDetailEntity: judicialDetailEntity
            );

  factory JudicialModel.fromJson(Map<String, dynamic> json) => JudicialModel(
        id: json["id"],
        anio: json["anio"] ?? '',
        presupuesto: json["presupuesto"] ?? '',
        descArea: json["desc_area"] ?? '',
        orgAreaId: json["org_area_id"] ?? 0,
        finalidad: json["finalidad"] ?? '',
        metaId: json["meta_id"] ?? 0,
        fechaIngreso: json['fecha_ingreso'] ?? '',
        fuente: json['abv_fuente'] ?? '',
        fuenteId: json['fuente_id'] ?? 0,
        dni: json['dni'] ?? '',
        cargo: json["cargo"] ?? '',
        nombres: json["nombres"] ?? '',
        montoJudicial: json['monto_judicial'] ?? 0,
        montoPlanilla: json['monto_planilla'] ?? 0,
        detalle: json["detalle"] ?? '',
        nroExpedienteJudicial: json["nro_expediente_judicial"] ?? '',
        expedientePvn: json["expediente_pvn"] ?? '',
        expedienteMtc: json["expediente_mtc"] ?? '',
        expedienteMef: json["expediente_mef"] ?? '',
        estadoProcesal: json['estado_procesal'] ?? '',
        observacion: json['observacion'] ?? '',
        documentoOrh: json['documento_orh'] ?? '',
        codigoPlaza: json['codigo_plaza'] ?? '',
        nroCap: json['nro_cap'] ?? '',
        descEscala: json['desc_escala'] ?? '',
        judicialDetailEntity: judicialDetailModelFromJson(json['judicial_detalle'] ?? [])
      );

  Map<String, dynamic> toJson() => {
        "anio": anio,
        "id": id,
        "presupuesto": presupuesto,
        "desc_area": descArea,
        "org_area_id": orgAreaId,
        "eexpediente": descArea,
        "finalidad": finalidad,
        "meta_id": metaId,
        "fecha_ingreso": fechaIngreso,
        "dni": dni,
        "cargo": cargo,
        "nombres": nombres,
        "monto_judicial": montoJudicial,
        "monto_planilla": montoPlanilla,
        "detalle": detalle,
        "nro_expediente_judicial": nroExpedienteJudicial,
        "expediente_pvn": expedientePvn,
        "expediente_mtc": expedienteMtc,
        "expediente_mef": expedienteMef,
        "estado_procesal": estadoProcesal,
        "fuente": fuente,
        "fuente_id": fuenteId,
        'observacion': observacion,
        'documento_orh': documentoOrh,
        'codigo_plaza': codigoPlaza,
        'nro_cap': nroCap,
      };
}
