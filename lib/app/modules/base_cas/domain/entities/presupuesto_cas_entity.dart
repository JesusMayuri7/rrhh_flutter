// To parse this JSON data, do
//
//     final presupuestoCasEntity = presupuestoCasEntityFromMap(jsonString);

import 'dart:convert';

List<PresupuestoCasEntity> presupuestoCasEntityFromMap(String str) =>
    List<PresupuestoCasEntity>.from(
        json.decode(str).map((x) => PresupuestoCasEntity.fromMap(x)));

String presupuestoCasEntityToMap(List<PresupuestoCasEntity> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class PresupuestoCasEntity {
  PresupuestoCasEntity({
    required this.anoEje,
    required this.fuente,
    required this.producto,
    required this.meta,
    required this.clasificador,
    this.pia = 0,
    this.pim = 0,
    this.certificado = 0,
    this.devengado = 0,
    this.enero = 0,
    this.febrero = 0,
    this.marzo = 0,
    this.abril = 0,
    this.mayo = 0,
    this.junio = 0,
    this.julio = 0,
    this.agosto = 0,
    this.setiembre = 0,
    this.octubre = 0,
    this.noviembre = 0,
    this.diciembre = 0,
  });

  final int anoEje;
  final String fuente;
  final String producto;
  final String meta;
  final String clasificador;
  final double pia;
  final double pim;
  final double certificado;
  final double devengado;
  final double enero;
  final double febrero;
  final double marzo;
  final double abril;
  final double mayo;
  final double junio;
  final double julio;
  final double agosto;
  final double setiembre;
  final double octubre;
  final double noviembre;
  final double diciembre;

  factory PresupuestoCasEntity.fromMap(Map<String, dynamic> json) =>
      PresupuestoCasEntity(
        anoEje: json["ano_eje"],
        fuente: json['fuente'],
        producto: json['producto'],
        clasificador: json["especifica3"],
        meta: json['meta'],
        pia: json["pia"],
        pim: json["pim"],
        certificado: json["certificado"],
        devengado: json["devengado"],
        enero: json["enero"],
        febrero: json["febrero"],
        marzo: json["marzo"],
        abril: json["abril"],
        mayo: json["mayo"],
        junio: json["junio"],
        julio: json["julio"],
        agosto: json["agosto"],
        setiembre: json["setiembre"],
        octubre: json["octubre"],
        noviembre: json["noviembre"],
        diciembre: json["diciembre"],
      );

  Map<String, dynamic> toMap() => {
        "ano_eje": anoEje,
        "fuente": fuente,
        "producto": producto,
        "meta": meta,
        "especifica3": clasificador,
        "pia": pia,
        "pim": pim,
        "certificado": certificado,
        "devengado": devengado,
        "enero": enero,
        "febrero": febrero,
        "marzo": marzo,
        "abril": abril,
        "mayo": mayo,
        "junio": junio,
        "julio": julio,
        "agosto": agosto,
        "setiembre": setiembre,
        "octubre": octubre,
        "noviembre": noviembre,
        "diciembre": diciembre,
      };

  @override
  String toString() {
    return 'PresupuestoCasEntity(anoEje: $anoEje, fuente: $fuente, producto: $producto, meta: $meta, especifica3: $clasificador, pia: $pia, pim: $pim, certificado: $certificado, devengado: $devengado, enero: $enero, febrero: $febrero, marzo: $marzo, abril: $abril, mayo: $mayo, junio: $junio, julio: $julio, agosto: $agosto, setiembre: $setiembre, octubre: $octubre, noviembre: $noviembre, diciembre: $diciembre)';
  }

  PresupuestoCasEntity copyWith({
    int? anoEje,
    String? fuente,
    String? producto,
    String? meta,
    String? especifica3,
    double? pia,
    double? pim,
    double? certificado,
    double? devengado,
    double? enero,
    double? febrero,
    double? marzo,
    double? abril,
    double? mayo,
    double? junio,
    double? julio,
    double? agosto,
    double? setiembre,
    double? octubre,
    double? noviembre,
    double? diciembre,
  }) {
    return PresupuestoCasEntity(
      anoEje: anoEje ?? this.anoEje,
      fuente: fuente ?? this.fuente,
      producto: producto ?? this.producto,
      meta: meta ?? this.meta,
      clasificador: especifica3 ?? this.clasificador,
      pia: pia ?? this.pia,
      pim: pim ?? this.pim,
      certificado: certificado ?? this.certificado,
      devengado: devengado ?? this.devengado,
      enero: enero ?? this.enero,
      febrero: febrero ?? this.febrero,
      marzo: marzo ?? this.marzo,
      abril: abril ?? this.abril,
      mayo: mayo ?? this.mayo,
      junio: junio ?? this.junio,
      julio: julio ?? this.julio,
      agosto: agosto ?? this.agosto,
      setiembre: setiembre ?? this.setiembre,
      octubre: octubre ?? this.octubre,
      noviembre: noviembre ?? this.noviembre,
      diciembre: diciembre ?? this.diciembre,
    );
  }
}
