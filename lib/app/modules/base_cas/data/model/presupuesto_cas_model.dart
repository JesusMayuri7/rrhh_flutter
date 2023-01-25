import 'dart:convert';

import '../../domain/entities/presupuesto_cas_entity.dart';

List<PresupuestoCasModel> presupuestoCasEntityFromJson(String str) {
  List<dynamic> presupuestoCasJson = json.decode(str);
  return List<PresupuestoCasModel>.from(
      (presupuestoCasJson).map((x) => PresupuestoCasModel.fromJson(x)));
}

String presupuestoCasEntityToJson(List<PresupuestoCasModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PresupuestoCasModel extends PresupuestoCasEntity {
  PresupuestoCasModel({
    required int anoEje,
    required String fuente,
    required String producto,
    required String meta,
    required String especifica3,
    required num pia,
    required num pim,
    required num certificado,
    required num devengado,
    required num enero,
    required num febrero,
    required num marzo,
    required num abril,
    required num mayo,
    required num junio,
    required num julio,
    required num agosto,
    required num setiembre,
    required num octubre,
    required num noviembre,
    required num diciembre,
  }) : super(
          anoEje: anoEje,
          fuente: fuente,
          producto: producto,
          clasificador: especifica3,
          meta: meta,
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

  factory PresupuestoCasModel.fromJson(Map<String, dynamic> json) =>
      PresupuestoCasModel(
        anoEje: json["ano_eje"],
        fuente: json['fuente'],
        producto: json['producto'],
        especifica3: json["clasificador"],
        meta: json["meta"] ?? '',
        pia: json["pia"] ?? 0,
        pim: json["pim"] ?? 0,
        certificado: json["certificado"] ?? 0,
        devengado: json["devengado"] ?? 0,
        enero: json["enero"] ?? 0,
        febrero: json["febrero"] ?? 0,
        marzo: json["marzo"] ?? 0,
        abril: json["abril"] ?? 0,
        mayo: json["mayo"] ?? 0,
        junio: json["junio"] ?? 0,
        julio: json["julio"] ?? 0,
        agosto: json["agosto"] ?? 0,
        setiembre: json["setiembre"] ?? 0,
        octubre: json["octubre"] ?? 0,
        noviembre: json["noviembre"] ?? 0,
        diciembre: json["diciembre"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "ano_eje": anoEje,
        "fuente": fuente,
        "producto": producto,
        "especifica3": clasificador,
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
