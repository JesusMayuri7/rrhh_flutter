import 'dart:convert';

import '../../domain/entities/presupuesto_entity.dart';

List<PresupuestoModel> presupuestoEntityFromJson(String str) {
  List<dynamic> presupuestoCasJson = json.decode(str);
  return List<PresupuestoModel>.from(
      (presupuestoCasJson).map((x) => PresupuestoModel.fromJson(x)));
}

String presupuestoEntityToJson(List<PresupuestoModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PresupuestoModel extends PresupuestoEntity {
  PresupuestoModel({
    required int anoEje,
    required String fuente,
    required String producto,
    required String meta,
    required String especifica3,
    required String subgenerica,
    required String dscClasificadorExt,
    required double pia,
    required double pim,
    required double certificado,
    required double devengado,
    required double enero,
    required double febrero,
    required double marzo,
    required double abril,
    required double mayo,
    required double junio,
    required double julio,
    required double agosto,
    required double setiembre,
    required double octubre,
    required double noviembre,
    required double diciembre,
  }) : super(
          anoEje: anoEje,
          fuente: fuente,
          producto: producto,
          meta: meta,
          especifica3: especifica3,
          subgenerica: subgenerica,
          dscClasificadorExt: dscClasificadorExt,
          pia: pia,
          pim: pim,
          certificado: certificado,
          devengado: devengado,
          enero: enero,
          febrero: febrero,
          marzo: marzo,
          abril: abril,
          mayo: mayo,
          junio: junio,
          julio: julio,
          agosto: agosto,
          setiembre: setiembre,
          octubre: octubre,
          noviembre: noviembre,
          diciembre: diciembre,
        );

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
