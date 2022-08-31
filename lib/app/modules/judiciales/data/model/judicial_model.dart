import 'dart:convert';

import '../../domain/judicial_entity.dart';

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
      required String descArea,
      required String finalidad,
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
      required String descEscala})
      : super(
            id: id,
            anio: anio,
            presupuesto: presupuesto,
            fuente: fuente,
            descArea: descArea,
            finalidad: finalidad,
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
            descEscala: descEscala);

  factory JudicialModel.fromJson(Map<String, dynamic> json) => JudicialModel(
        id: json["id"],
        anio: json["anio"] ?? '',
        presupuesto: json["presupuesto"] ?? '',
        descArea: json["desc_area"] ?? '',
        finalidad: json["finalidad"] ?? '',
        fechaIngreso: json['fecha_ingreso'] ?? '',
        fuente: json['fuente'] ?? '',
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
      );

  Map<String, dynamic> toJson() => {
        "anio": anio,
        "id": id,
        "presupuesto": presupuesto,
        "eexpediente": descArea,
        "finalidad": finalidad,
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
        'observacion': observacion,
        'documento_orh': documentoOrh,
        'codigo_plaza': codigoPlaza,
        'nro_cap': nroCap,
      };
}
