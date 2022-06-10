import 'package:equatable/equatable.dart';

class CertificadoEntity extends Equatable {
  CertificadoEntity({
    required this.anoEje,
    required this.certificadoId,
    required this.clasificadorId,
    required this.dscCertificado,
    required this.fuente,
    required this.fuenteBase,
    required this.clasificador,
    required this.modalidad,
    required this.tipo,
    required this.detalle,
    required this.concepto,
    required this.secFunc,
    required this.finalidad,
    required this.idmetaAnual,
    required this.monto,
    required this.devengado,
    required this.saldo,
    required this.enero,
    required this.febrero,
    required this.marzo,
    required this.abril,
    required this.mayo,
    required this.junio,
    required this.julio,
    required this.agosto,
    required this.setiembre,
    required this.octubre,
    required this.noviembre,
    required this.diciembre,
  });

  final int anoEje;
  final int certificadoId;
  final int clasificadorId;
  final String dscCertificado;
  final int fuente;
  final String fuenteBase;
  final String clasificador;
  final String modalidad;
  final String tipo;
  final String detalle;
  final String concepto;
  final String secFunc;
  final String finalidad;
  final int idmetaAnual;
  final double monto;
  final double saldo;
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

  @override
  List<Object?> get props => [
        anoEje,
        certificadoId,
        clasificadorId,
        dscCertificado,
        fuente,
        fuenteBase,
        clasificador,
        modalidad,
        tipo,
        detalle,
        concepto,
        secFunc,
        finalidad,
        idmetaAnual,
        monto,
        saldo,
        devengado,
        enero,
        febrero,
        marzo,
        abril,
        mayo,
        junio,
        julio,
        agosto,
        setiembre,
        octubre,
        noviembre,
        diciembre,
      ];

  Map<String, dynamic> toMap() {
    return {
      "ano_eje": anoEje,
      "certificado_id": certificadoId,
      "clasificador_id": clasificadorId,
      "dsc_certificado": dscCertificado,
      "fuente": fuente,
      "fuente_base": fuenteBase,
      "clasificador": clasificador,
      "modalidad": modalidad,
      "tipo": tipo,
      "detalle": detalle,
      "concepto": concepto,
      "sec_func": secFunc,
      "finalidad": finalidad,
      "idmeta_anual": idmetaAnual,
      "monto": monto,
      "devengado": devengado,
      "saldo": saldo,
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
  }
}
