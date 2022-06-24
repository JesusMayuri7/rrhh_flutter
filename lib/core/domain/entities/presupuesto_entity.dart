// To parse this JSON data, do
//
//     final presupuestoCasEntity = presupuestoCasEntityFromMap(jsonString);

import 'dart:convert';

List<PresupuestoEntity> presupuestoEntityFromMap(String str) =>
    List<PresupuestoEntity>.from(
        json.decode(str).map((x) => PresupuestoEntity.fromMap(x)));

String presupuestoEntityToMap(List<PresupuestoEntity> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class PresupuestoEntity {
  PresupuestoEntity(
      {required this.anoEje,
      required this.fuente,
      required this.producto,
      required this.meta,
      required this.especifica3,
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
      required this.subgenerica,
      required this.dscClasificadorExt});

  final int anoEje;
  final String fuente;
  final String producto;
  final String meta;
  final String especifica3;
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
  final String subgenerica;
  final String dscClasificadorExt;

  factory PresupuestoEntity.fromMap(Map<String, dynamic> json) =>
      PresupuestoEntity(
        anoEje: json["ano_eje"],
        fuente: json['fuente'],
        producto: json['producto'],
        especifica3: json["clasificador"],
        meta: json['meta'],
        subgenerica: json["subgenerica"],
        dscClasificadorExt: json["dsc_clasificador_ext"],
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
        "especifica3": especifica3,
        "subgenerica": subgenerica,
        "dsc_clasificador_ext": dscClasificadorExt,
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
    return 'PresupuestoEntity(anoEje: $anoEje, fuente: $fuente, producto: $producto, meta: $meta, especifica3: $especifica3, pia: $pia, pim: $pim, certificado: $certificado, devengado: $devengado, enero: $enero, febrero: $febrero, marzo: $marzo, abril: $abril, mayo: $mayo, junio: $junio, julio: $julio, agosto: $agosto, setiembre: $setiembre, octubre: $octubre, noviembre: $noviembre, diciembre: $diciembre, subgenerica: $subgenerica)';
  }

  PresupuestoEntity copyWith({
    int? anoEje,
    String? fuente,
    String? producto,
    String? meta,
    String? especifica3,
    String? subgenerica,
    String? dscClasificadorExt,
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
    return PresupuestoEntity(
      anoEje: anoEje ?? this.anoEje,
      fuente: fuente ?? this.fuente,
      producto: producto ?? this.producto,
      meta: meta ?? this.meta,
      especifica3: especifica3 ?? this.especifica3,
      dscClasificadorExt: dscClasificadorExt ?? this.dscClasificadorExt,
      subgenerica: subgenerica ?? this.dscClasificadorExt,
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
