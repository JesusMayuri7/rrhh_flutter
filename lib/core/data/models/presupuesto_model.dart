import 'dart:convert';

import 'package:dson_adapter/dson_adapter.dart';

import '../../domain/entities/presupuesto_entity.dart';

List<PresupuestoModel> presupuestoEntityFromJson(String str) {
  List<dynamic> presupuestoCasJson = json.decode(str);
  return List<PresupuestoModel>.from(
      (presupuestoCasJson).map((x) { 
        return PresupuestoModel.fromJson(x); } ) );
}

List<PresupuestoModel> presupuestoModelFromJsonDSON(dynamic str) =>
    List<PresupuestoModel>.from(
        (str).map((x) { 

          final result = PresupuestoModel.fromJson(x);
          return result;
           }));

String presupuestoEntityToJson(List<PresupuestoModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PresupuestoModel extends PresupuestoEntity {
  PresupuestoModel({
    required super.anoEje,
    required super.fuente,
    required super.producto,
    required super.meta,
    required super.especifica3,
    required super.subgenerica,
    required super.dscClasificadorExt,
    required super.pia,
    required super.pim,
    required super.certificado,
    required super.devengado,
    required super.enero,
    required super.febrero,
    required super.marzo,
    required super.abril,
    required super.mayo,
    required super.junio,
    required super.julio,
    required super.agosto,
    required super.setiembre,
    required super.octubre,
    required super.noviembre,
    required super.diciembre,
  });

  factory PresupuestoModel.fromJsonDSON({
    required dynamic json,
  }) {
    return DSON().fromJson(json, PresupuestoModel.new, aliases: {
      PresupuestoModel: {
        'anoEje': 'ano_eje',
        'especifica3': 'clasificador',
        'dscClasificadorExt': 'dsc_clasificador_ext',        
      }
    });
  }      

  factory PresupuestoModel.fromJson(Map<String, dynamic> json) =>
      PresupuestoModel(
        anoEje: json["ano_eje"] ?? 0,
        fuente: json['fuente'] ?? '',
        producto: json['producto'] ?? '',
        especifica3: json["clasificador"] ?? '',
        meta: json["meta"] ?? '',
        subgenerica: json["subgenerica"] ?? '',
        dscClasificadorExt: json["dsc_clasificador_ext"] ?? '',
        pia: double.parse(json["pia"]),
        pim: double.parse(json["pim"]),
        certificado: double.parse(json["certificado"]),
        devengado: double.parse(json["devengado"]),
        enero: double.parse(json["enero"]),
        febrero: double.parse(json["febrero"]),
        marzo: double.parse(json["marzo"]),
        abril: double.parse(json["abril"]),
        mayo: double.parse(json["mayo"]),
        junio: double.parse(json["junio"]),
        julio: double.parse(json["julio"]),
        agosto: double.parse(json["agosto"]),
        setiembre: double.parse(json["setiembre"]),
        octubre: double.parse(json["octubre"]),
        noviembre: double.parse(json["noviembre"]),
        diciembre: double.parse(json["diciembre"]),
      );

  Map<String, dynamic> toJson() => {
        "ano_eje": anoEje,
        "fuente": fuente,
        "producto": producto,
        "clasificador": especifica3,
        "subgenerica": subgenerica,
        "dsc_clasificador_ext": dscClasificadorExt,
        "meta": meta,
        "pia": pia.toDouble(),
        "pim": pim.toDouble(),
        "certificado": certificado.toDouble(),
        "devengado": devengado.toDouble(),
        "enero": enero.toDouble(),
        "febrero": febrero.toDouble(),
        "marzo": marzo.toDouble(),
        "abril": abril.toDouble(),
        "mayo": mayo.toDouble(),
        "junio": junio.toDouble(),
        "julio": julio.toDouble(),
        "agosto": agosto.toDouble(),
        "setiembre": setiembre.toDouble(),
        "octubre": octubre.toDouble(),
        "noviembre": noviembre.toDouble(),
        "diciembre": diciembre.toDouble(),
      };
}




