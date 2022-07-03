class BaseCapEntity {
  BaseCapEntity({
    required this.id,
    required this.anio,
    required this.orgAreaId,
    required this.descArea,
    required this.idpap,
    required this.idcap,
    required this.pdId,
    required this.plaza,
    required this.plazaOld,
    required this.estadoActual,
    required this.estadoOpp,
    required this.estadoPap,
    required this.estadoAir,
    required this.tipoIngreso,
    required this.feIngreso,
    required this.tipoSalida,
    required this.feSalida,
    required this.finLicencia,
    required this.dni,
    required this.nombres,
    required this.modalidad,
    required this.asigFamiliarAir,
    required this.uniforme,
    required this.vale,
    required this.sede,
    required this.fuenteBase,
    required this.feNac,
    required this.cargocap,
    required this.cargoPap,
    required this.metaId,
    required this.meta,
    required this.finalidad,
    required this.producto,
    required this.nivelO,
    required this.descNivel,
    required this.idnivel,
    required this.idescala,
    required this.descEscala,
    required this.tipoEscala,
    required this.codigoPlaza,
    required this.detalle,
    required this.capPvnId,
    required this.montoEscalaNext,
    required this.ppto2021,
    required this.epsAporta,
    required this.montoBasico,
    required this.montoEscalaAnterior,
    required this.montoEscala,
    required this.asigFam,
    this.essalud = 0,
    this.epsSalud = 0,
    this.sctrSalud = 0,
    this.sctrSaludGrati = 0,
    this.vidaLey = 0,
    this.sctrPension = 0,
    this.sctrPensionGrati = 0,
    this.totalBasico = 0,
    this.eneMonto = 0,
    this.eneEssalud = 0,
    this.eneSctrSalud = 0,
    this.eneVidaley = 0,
    this.eneSctrPension = 0,
    this.eneEscolaridad = 0,
    this.febMonto = 0,
    this.febEssalud = 0,
    this.febSctrSalud = 0,
    this.febVidaley = 0,
    this.febSctrPension = 0,
    this.marMonto = 0,
    this.marEssalud = 0,
    this.marSctrSalud = 0,
    this.marVidaley = 0,
    this.marSctrPension = 0,
    this.abrMonto = 0,
    this.abrEssalud = 0,
    this.abrSctrSalud = 0,
    this.abrVidaley = 0,
    this.abrSctrPension = 0,
    this.mayMonto = 0,
    this.mayEssalud = 0,
    this.maySctrSalud = 0,
    this.mayVidaley = 0,
    this.maySctrPension = 0,
    this.mayCts = 0,
    this.junMonto = 0,
    this.junEssalud = 0,
    this.junSctrSalud = 0,
    this.junVidaley = 0,
    this.junSctrPension = 0,
    this.julMonto = 0,
    this.julEssalud = 0,
    this.julSctrSalud = 0,
    this.julVidaley = 0,
    this.julSctrPensionGrati = 0,
    this.julBoni = 0,
    this.julGrati = 0,
    this.agoMonto = 0,
    this.agoEssalud = 0,
    this.agoSctrSalud = 0,
    this.agoVidaley = 0,
    this.agoSctrPension = 0,
    this.setMonto = 0,
    this.setEssalud = 0,
    this.setSctrSalud = 0,
    this.setVidaley = 0,
    this.setSctrPension = 0,
    this.octMonto = 0,
    this.octEssalud = 0,
    this.octSctrSalud = 0,
    this.octVidaley = 0,
    this.octSctrPension = 0,
    this.novMonto = 0,
    this.novEssalud = 0,
    this.novSctrSalud = 0,
    this.novVidaley = 0,
    this.novSctrPension = 0,
    this.novCts = 0,
    this.dicMonto = 0,
    this.dicEssalud = 0,
    this.dicSctrSalud = 0,
    this.dicVidaley = 0,
    this.dicSctrPensionGrati = 0,
    this.dicBoni = 0,
    this.dicGrati = 0,
  });

  final int id;
  final int anio;
  final int orgAreaId;
  final String descArea;
  final int idpap;
  final int idcap;
  final int pdId;
  final String plaza;
  final String plazaOld;
  final String estadoActual;
  final String estadoOpp;
  final String estadoPap;
  final String estadoAir;
  final String tipoIngreso;
  final String feIngreso;
  final String tipoSalida;
  final String feSalida;
  final String finLicencia;
  final String dni;
  final String nombres;
  final String modalidad;
  final double asigFam;
  final double uniforme;
  final double vale;
  final String sede;
  final String fuenteBase;
  final String feNac;
  final String cargocap;
  final String cargoPap;
  final int metaId;
  final String meta;
  final String finalidad;
  final String producto;
  final String nivelO;
  final String descNivel;
  final int idnivel;
  final int idescala;
  final String descEscala;
  final String tipoEscala;
  final String codigoPlaza;
  final String detalle;
  final int capPvnId;
  final double montoEscalaNext;
  final String ppto2021;
  final int epsAporta;
  final double montoBasico;
  final double montoEscalaAnterior;
  final double montoEscala;
  final double asigFamiliarAir;
  final double totalBasico;
  final double essalud;
  final double epsSalud;
  final double sctrSalud;
  final double sctrSaludGrati;
  final double vidaLey;
  final double sctrPension;
  final double sctrPensionGrati;
  final double eneMonto;
  final double eneEssalud;
  final double eneSctrSalud;
  final double eneVidaley;
  final double eneSctrPension;
  final double eneEscolaridad;
  final double febMonto;
  final double febEssalud;
  final double febSctrSalud;
  final double febVidaley;
  final double febSctrPension;
  final double marMonto;
  final double marEssalud;
  final double marSctrSalud;
  final double marVidaley;
  final double marSctrPension;
  final double abrMonto;
  final double abrEssalud;
  final double abrSctrSalud;
  final double abrVidaley;
  final double abrSctrPension;
  final double mayMonto;
  final double mayEssalud;
  final double maySctrSalud;
  final double mayVidaley;
  final double maySctrPension;
  final double mayCts;
  final double junMonto;
  final double junEssalud;
  final double junSctrSalud;
  final double junVidaley;
  final double junSctrPension;
  final double julMonto;
  final double julEssalud;
  final double julSctrSalud;
  final double julVidaley;
  final double julSctrPensionGrati;
  final double julBoni;
  final double julGrati;
  final double agoMonto;
  final double agoEssalud;
  final double agoSctrSalud;
  final double agoVidaley;
  final double agoSctrPension;
  final double setMonto;
  final double setEssalud;
  final double setSctrSalud;
  final double setVidaley;
  final double setSctrPension;
  final double octMonto;
  final double octEssalud;
  final double octSctrSalud;
  final double octVidaley;
  final double octSctrPension;
  final double novMonto;
  final double novEssalud;
  final double novSctrSalud;
  final double novVidaley;
  final double novSctrPension;
  final double novCts;
  final double dicMonto;
  final double dicEssalud;
  final double dicSctrSalud;
  final double dicVidaley;
  final double dicSctrPensionGrati;
  final double dicBoni;
  final double dicGrati;

  BaseCapEntity copyWith({
    int? id,
    int? anio,
    int? orgAreaId,
    String? descArea,
    int? idpap,
    int? idcap,
    int? pdId,
    String? plaza,
    String? plazaOld,
    String? estadoActual,
    String? estadoOpp,
    String? estadoPap,
    String? estadoAir,
    String? tipoIngreso,
    String? feIngreso,
    String? tipoSalida,
    String? feSalida,
    String? finLicencia,
    String? dni,
    String? nombres,
    String? modalidad,
    double? asigFam,
    double? montoEscala,
    double? montoBasico,
    double? asigFamiliarAir,
    double? uniforme,
    double? vale,
    String? sede,
    String? fuenteBase,
    String? feNac,
    String? cargocap,
    String? cargoPap,
    int? metaId,
    String? meta,
    String? finalidad,
    String? producto,
    String? nivelO,
    String? descNivel,
    int? idnivel,
    int? idescala,
    String? descEscala,
    String? tipoEscala,
    String? codigoPlaza,
    String? detalle,
    int? capPvnId,
    double? montoEscalaNext,
    double? montoEscalaAnterior,
    String? ppto2021,
    double? totalBasico,
    int? epsAporta,
    double? essalud,
    double? epsSalud,
    double? sctrSalud,
    double? sctrSaludGrati,
    double? vidaLey,
    double? sctrPension,
    double? sctrPensionGrati,
    double? eneMonto,
    double? eneEssalud,
    double? eneSctrSalud,
    double? eneVidaley,
    double? eneSctrPension,
    double? eneEscolaridad,
    double? febMonto,
    double? febEssalud,
    double? febSctrSalud,
    double? febVidaley,
    double? febSctrPension,
    double? marMonto,
    double? marEssalud,
    double? marSctrSalud,
    double? marVidaley,
    double? marSctrPension,
    double? abrMonto,
    double? abrEssalud,
    double? abrSctrSalud,
    double? abrVidaley,
    double? abrSctrPension,
    double? mayMonto,
    double? mayEssalud,
    double? maySctrSalud,
    double? mayVidaley,
    double? maySctrPension,
    double? mayCts,
    double? junMonto,
    double? junEssalud,
    double? junSctrSalud,
    double? junVidaley,
    double? junSctrPension,
    double? julMonto,
    double? julEssalud,
    double? julSctrSalud,
    double? julVidaley,
    double? julSctrPensionGrati,
    double? julBoni,
    double? julGrati,
    double? agoMonto,
    double? agoEssalud,
    double? agoSctrSalud,
    double? agoVidaley,
    double? agoSctrPension,
    double? setMonto,
    double? setEssalud,
    double? setSctrSalud,
    double? setVidaley,
    double? setSctrPension,
    double? octMonto,
    double? octEssalud,
    double? octSctrSalud,
    double? octVidaley,
    double? octSctrPension,
    double? novMonto,
    double? novEssalud,
    double? novSctrSalud,
    double? novVidaley,
    double? novSctrPension,
    double? novCts,
    double? dicMonto,
    double? dicEssalud,
    double? dicSctrSalud,
    double? dicVidaley,
    double? dicSctrPensionGrati,
    double? dicBoni,
    double? dicGrati,
  }) =>
      BaseCapEntity(
        id: id ?? this.id,
        anio: anio ?? this.anio,
        orgAreaId: orgAreaId ?? this.orgAreaId,
        descArea: descArea ?? this.descArea,
        idpap: idpap ?? this.idpap,
        idcap: idcap ?? this.idcap,
        pdId: pdId ?? this.pdId,
        plaza: plaza ?? this.plaza,
        plazaOld: plazaOld ?? this.plazaOld,
        estadoActual: estadoActual ?? this.estadoActual,
        estadoOpp: estadoOpp ?? this.estadoOpp,
        estadoPap: estadoPap ?? this.estadoPap,
        estadoAir: estadoAir ?? this.estadoAir,
        tipoIngreso: tipoIngreso ?? this.tipoIngreso,
        feIngreso: feIngreso ?? this.feIngreso,
        tipoSalida: tipoSalida ?? this.tipoSalida,
        feSalida: feSalida ?? this.feSalida,
        finLicencia: finLicencia ?? this.finLicencia,
        dni: dni ?? this.dni,
        nombres: nombres ?? this.nombres,
        modalidad: modalidad ?? this.modalidad,
        asigFam: asigFam ?? this.asigFam,
        uniforme: uniforme ?? this.uniforme,
        vale: vale ?? this.vale,
        sede: sede ?? this.sede,
        fuenteBase: fuenteBase ?? this.fuenteBase,
        feNac: feNac ?? this.feNac,
        cargocap: cargocap ?? this.cargocap,
        cargoPap: cargoPap ?? this.cargoPap,
        metaId: metaId ?? this.metaId,
        meta: meta ?? this.meta,
        finalidad: finalidad ?? this.finalidad,
        producto: producto ?? this.producto,
        nivelO: nivelO ?? this.nivelO,
        descNivel: descNivel ?? this.descNivel,
        idnivel: idnivel ?? this.idnivel,
        idescala: idescala ?? this.idescala,
        descEscala: descEscala ?? this.descEscala,
        tipoEscala: tipoEscala ?? this.tipoEscala,
        codigoPlaza: codigoPlaza ?? this.codigoPlaza,
        detalle: detalle ?? this.detalle,
        capPvnId: capPvnId ?? this.capPvnId,
        montoEscalaNext: montoEscalaNext ?? this.montoEscalaNext,
        ppto2021: ppto2021 ?? this.ppto2021,
        essalud: essalud ?? this.essalud,
        epsSalud: epsSalud ?? this.epsSalud,
        sctrSalud: sctrSalud ?? this.sctrSalud,
        sctrSaludGrati: sctrSaludGrati ?? this.sctrSaludGrati,
        vidaLey: vidaLey ?? this.vidaLey,
        sctrPension: sctrPension ?? this.sctrPension,
        sctrPensionGrati: sctrPensionGrati ?? this.sctrPensionGrati,
        montoEscala: montoEscala ?? this.montoEscala,
        montoEscalaAnterior: montoEscalaAnterior ?? this.montoEscalaAnterior,
        montoBasico: montoBasico ?? this.montoBasico,
        asigFamiliarAir: asigFamiliarAir ?? this.asigFamiliarAir,
        totalBasico: totalBasico ?? this.totalBasico,
        epsAporta: epsAporta ?? this.epsAporta,
        eneMonto: eneMonto ?? this.eneMonto,
        eneEssalud: eneEssalud ?? this.eneEssalud,
        eneSctrSalud: eneSctrSalud ?? this.eneSctrSalud,
        eneVidaley: eneVidaley ?? this.eneVidaley,
        eneSctrPension: eneSctrPension ?? this.eneSctrPension,
        eneEscolaridad: eneEscolaridad ?? this.eneEscolaridad,
        febMonto: febMonto ?? this.febMonto,
        febEssalud: febEssalud ?? this.febEssalud,
        febSctrSalud: febSctrSalud ?? this.febSctrSalud,
        febVidaley: febVidaley ?? this.febVidaley,
        febSctrPension: febSctrPension ?? this.febSctrPension,
        marMonto: marMonto ?? this.marMonto,
        marEssalud: marEssalud ?? this.marEssalud,
        marSctrSalud: marSctrSalud ?? this.marSctrSalud,
        marVidaley: marVidaley ?? this.marVidaley,
        marSctrPension: marSctrPension ?? this.marSctrPension,
        abrMonto: abrMonto ?? this.abrMonto,
        abrEssalud: abrEssalud ?? this.abrEssalud,
        abrSctrSalud: abrSctrSalud ?? this.abrSctrSalud,
        abrVidaley: abrVidaley ?? this.abrVidaley,
        abrSctrPension: abrSctrPension ?? this.abrSctrPension,
        mayMonto: mayMonto ?? this.mayMonto,
        mayEssalud: mayEssalud ?? this.mayEssalud,
        maySctrSalud: maySctrSalud ?? this.maySctrSalud,
        mayVidaley: mayVidaley ?? this.mayVidaley,
        maySctrPension: maySctrPension ?? this.maySctrPension,
        mayCts: mayCts ?? this.mayCts,
        junMonto: junMonto ?? this.junMonto,
        junEssalud: junEssalud ?? this.junEssalud,
        junSctrSalud: junSctrSalud ?? this.junSctrSalud,
        junVidaley: junVidaley ?? this.junVidaley,
        junSctrPension: junSctrPension ?? this.junSctrPension,
        julMonto: julMonto ?? this.julMonto,
        julEssalud: julEssalud ?? this.julEssalud,
        julSctrSalud: julSctrSalud ?? this.julSctrSalud,
        julVidaley: julVidaley ?? this.julVidaley,
        julSctrPensionGrati: julSctrPensionGrati ?? this.julSctrPensionGrati,
        julBoni: julBoni ?? this.julBoni,
        julGrati: julGrati ?? this.julGrati,
        agoMonto: agoMonto ?? this.agoMonto,
        agoEssalud: agoEssalud ?? this.agoEssalud,
        agoSctrSalud: agoSctrSalud ?? this.agoSctrSalud,
        agoVidaley: agoVidaley ?? this.agoVidaley,
        agoSctrPension: agoSctrPension ?? this.agoSctrPension,
        setMonto: setMonto ?? this.setMonto,
        setEssalud: setEssalud ?? this.setEssalud,
        setSctrSalud: setSctrSalud ?? this.setSctrSalud,
        setVidaley: setVidaley ?? this.setVidaley,
        setSctrPension: setSctrPension ?? this.setSctrPension,
        octMonto: octMonto ?? this.octMonto,
        octEssalud: octEssalud ?? this.octEssalud,
        octSctrSalud: octSctrSalud ?? this.octSctrSalud,
        octVidaley: octVidaley ?? this.octVidaley,
        octSctrPension: octSctrPension ?? this.octSctrPension,
        novMonto: novMonto ?? this.novMonto,
        novEssalud: novEssalud ?? this.novEssalud,
        novSctrSalud: novSctrSalud ?? this.novSctrSalud,
        novVidaley: novVidaley ?? this.novVidaley,
        novSctrPension: novSctrPension ?? this.novSctrPension,
        novCts: novCts ?? this.novCts,
        dicMonto: dicMonto ?? this.dicMonto,
        dicEssalud: dicEssalud ?? this.dicEssalud,
        dicSctrSalud: dicSctrSalud ?? this.dicSctrSalud,
        dicVidaley: dicVidaley ?? this.dicVidaley,
        dicSctrPensionGrati: dicSctrPensionGrati ?? this.dicSctrPensionGrati,
        dicBoni: dicBoni ?? this.dicBoni,
        dicGrati: dicGrati ?? this.dicGrati,
      );

  factory BaseCapEntity.fromMap(Map<String, dynamic> json) => BaseCapEntity(
        id: json["id"],
        anio: json["anio"],
        orgAreaId: json["org_area_id"],
        descArea: json["desc_area"],
        idpap: json["idpap"],
        idcap: json["idcap"],
        pdId: json["pd_id"],
        plaza: json["plaza"],
        plazaOld: json["plaza_old"],
        estadoActual: json["estado_actual"],
        estadoOpp: json["estado_opp"],
        estadoPap: json["estado_pap"],
        estadoAir: json['estado_air'],
        tipoIngreso: json["tipo_ingreso"],
        feIngreso: json["fe_ingreso"],
        tipoSalida: json["tipo_salida"],
        feSalida: json["fe_salida"],
        finLicencia: json["fin_licencia"],
        dni: json["dni"],
        nombres: json["nombres"],
        modalidad: json["modalidad"],
        asigFamiliarAir: json["asig_familiar_air"],
        uniforme: json["uniforme"],
        vale: json["vale"],
        sede: json["sede"],
        fuenteBase: json["fuente_base"],
        feNac: json["fe_nac"],
        cargocap: json["cargocap"],
        cargoPap: json["cargo_pap"],
        metaId: json["meta_id"],
        meta: json["meta"],
        finalidad: json["finalidad"],
        producto: json["producto"],
        nivelO: json["nivelO"],
        descNivel: json["desc_nivel"],
        idnivel: json["idnivel"],
        idescala: json["idescala"],
        descEscala: json["desc_escala"],
        tipoEscala: json["tipo_escala"],
        codigoPlaza: json["codigo_plaza"],
        detalle: json["detalle"],
        capPvnId: json["cap_pvn_id"],
        montoEscalaAnterior: json["monto_escala_anterior"],
        montoEscalaNext: json["monto_escala_next"],
        ppto2021: json["ppto_2021"],
        epsAporta: json['eps_aporta'],
        montoBasico: json["monto_basico"],
        montoEscala: json["monto_escala"],
        asigFam: json["asig_fam"],
        totalBasico: json["total_basico"],
        essalud: json['essalud'],
        epsSalud: json['epsSalud'],
        sctrSalud: json['sctrSalud'],
        sctrSaludGrati: json['sctrSaludGrati'],
        vidaLey: json['vidaLey'],
        sctrPension: json['sctrPension'],
        sctrPensionGrati: json['sctrPensionGrati'],
        eneMonto: json["ene_monto"],
        eneEssalud: json["ene_essalud"],
        eneSctrSalud: json["ene_sctr_salud"],
        eneVidaley: json["ene_vidaley"],
        eneSctrPension: json["ene_sctr_pension"],
        eneEscolaridad: json["ene_escolaridad"],
        febMonto: json["feb_monto"],
        febEssalud: json["feb_essalud"],
        febSctrSalud: json["feb_sctr_salud"],
        febVidaley: json["feb_vidaley"],
        febSctrPension: json["feb_sctr_pension"],
        marMonto: json["mar_monto"],
        marEssalud: json["mar_essalud"],
        marSctrSalud: json["mar_sctr_salud"],
        marVidaley: json["mar_vidaley"],
        marSctrPension: json["mar_sctr_pension"],
        abrMonto: json["abr_monto"],
        abrEssalud: json["abr_essalud"],
        abrSctrSalud: json["abr_sctr_salud"],
        abrVidaley: json["abr_vidaley"],
        abrSctrPension: json["abr_sctr_pension"],
        mayMonto: json["may_monto"],
        mayEssalud: json["may_essalud"],
        maySctrSalud: json["may_sctr_salud"],
        mayVidaley: json["may_vidaley"],
        maySctrPension: json["may_sctr_pension"],
        mayCts: json["may_cts"],
        junMonto: json["jun_monto"],
        junEssalud: json["jun_essalud"],
        junSctrSalud: json["jun_sctr_salud"],
        junVidaley: json["jun_vidaley"],
        junSctrPension: json["jun_sctr_pension"],
        julMonto: json["jul_monto"],
        julEssalud: json["jul_essalud"],
        julSctrSalud: json["jul_sctr_salud"],
        julVidaley: json["jul_vidaley"],
        julSctrPensionGrati: json["jul_sctr_pension_grati"],
        julBoni: json["jul_boni"],
        julGrati: json["jul_grati"],
        agoMonto: json["ago_monto"],
        agoEssalud: json["ago_essalud"],
        agoSctrSalud: json["ago_sctr_salud"],
        agoVidaley: json["ago_vidaley"],
        agoSctrPension: json["ago_sctr_pension"],
        setMonto: json["set_monto"],
        setEssalud: json["set_essalud"],
        setSctrSalud: json["set_sctr_salud"],
        setVidaley: json["set_vidaley"],
        setSctrPension: json["set_sctr_pension"],
        octMonto: json["oct_monto"],
        octEssalud: json["oct_essalud"],
        octSctrSalud: json["oct_sctr_salud"],
        octVidaley: json["oct_vidaley"],
        octSctrPension: json["oct_sctr_pension"],
        novMonto: json["nov_monto"],
        novEssalud: json["nov_essalud"],
        novSctrSalud: json["nov_sctr_salud"],
        novVidaley: json["nov_vidaley"],
        novSctrPension: json["nov_sctr_pension"],
        novCts: json["nov_cts"],
        dicMonto: json["dic_monto"],
        dicEssalud: json["dic_essalud"],
        dicSctrSalud: json["dic_sctr_salud"],
        dicVidaley: json["dic_vidaley"],
        dicSctrPensionGrati: json["dic_sctr_pension_grati"],
        dicBoni: json["dic_boni"],
        dicGrati: json["dic_grati"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "anio": anio,
        "org_area_id": orgAreaId,
        "desc_area": descArea,
        "idpap": idpap,
        "idcap": idcap,
        "pd_id": pdId,
        "plaza": plaza,
        "plaza_old": plazaOld,
        "estado_actual": estadoActual,
        "estado_opp": estadoOpp,
        "estado_pap": estadoPap,
        "estado_air": estadoAir,
        "tipo_ingreso": tipoIngreso,
        "fe_ingreso": feIngreso,
        "tipo_salida": tipoSalida,
        "fe_salida": feSalida,
        "fin_licencia": finLicencia,
        "dni": dni,
        "nombres": nombres,
        "modalidad": modalidad,
        "asig_fam": asigFam,
        "sede": sede,
        "fuente_base": fuenteBase,
        "fe_nac": feNac,
        "cargocap": cargocap,
        "cargo_pap": cargoPap,
        "meta_id": metaId,
        "meta": meta,
        "finalidad": finalidad,
        "producto": producto,
        "nivelO": nivelO,
        "desc_nivel": descNivel,
        "idnivel": idnivel,
        "idescala": idescala,
        "desc_escala": descEscala,
        "tipo_escala": tipoEscala,
        "codigo_plaza": codigoPlaza,
        "detalle": detalle,
        "cap_pvn_id": capPvnId,
        "monto_escala_anterior": montoEscalaAnterior,
        "monto_escala_next": montoEscalaNext,
        "ppto_2021": ppto2021,
        "uniforme": uniforme,
        "vale": vale,
        "eps_aporta": epsAporta,
        "monto_basico": montoBasico,
        "monto_escala": montoEscala,
        "asig_familiar_air": asigFamiliarAir,
        "total_basico": totalBasico,
        'essalud': essalud,
        'epsSalud': epsSalud,
        'sctrSalud': sctrSalud,
        'sctrSaludGrati': sctrSaludGrati,
        'vidaLey': vidaLey,
        'sctrPension': sctrPension,
        'sctrPensionGrati': sctrPensionGrati,
        "ene_monto": eneMonto,
        "ene_essalud": eneEssalud,
        "ene_sctr_salud": eneSctrSalud,
        "ene_vidaley": eneVidaley,
        "ene_sctr_pension": eneSctrPension,
        "ene_escolaridad": eneEscolaridad,
        "feb_monto": febMonto,
        "feb_essalud": febEssalud,
        "feb_sctr_salud": febSctrSalud,
        "feb_vidaley": febVidaley,
        "feb_sctr_pension": febSctrPension,
        "mar_monto": marMonto,
        "mar_essalud": marEssalud,
        "mar_sctr_salud": marSctrSalud,
        "mar_vidaley": marVidaley,
        "mar_sctr_pension": marSctrPension,
        "abr_monto": abrMonto,
        "abr_essalud": abrEssalud,
        "abr_sctr_salud": abrSctrSalud,
        "abr_vidaley": abrVidaley,
        "abr_sctr_pension": abrSctrPension,
        "may_monto": mayMonto,
        "may_essalud": mayEssalud,
        "may_sctr_salud": maySctrSalud,
        "may_vidaley": mayVidaley,
        "may_sctr_pension": maySctrPension,
        "may_cts": mayCts,
        "jun_monto": junMonto,
        "jun_essalud": junEssalud,
        "jun_sctr_salud": junSctrSalud,
        "jun_vidaley": junVidaley,
        "jun_sctr_pension": junSctrPension,
        "jul_monto": julMonto,
        "jul_essalud": julEssalud,
        "jul_sctr_salud": julSctrSalud,
        "julio_vidaley": julVidaley,
        "julio_sctr_pension_grati": julSctrPensionGrati,
        "jul_grati": julGrati,
        "jul_boni": julBoni,
        "ago_monto": agoMonto,
        "ago_essalud": agoEssalud,
        "ago_sctr_salud": agoSctrSalud,
        "ago_vidaley": agoVidaley,
        "ago_sctr_pension": agoSctrPension,
        "set_monto": setMonto,
        "set_essalud": setEssalud,
        "set_sctr_salud": setSctrSalud,
        "set_vidaley": setVidaley,
        "set_sctr_pension": setSctrPension,
        "oct_monto": octMonto,
        "oct_essalud": octEssalud,
        "oct_sctr_salud": octSctrSalud,
        "oct_vidaley": octVidaley,
        "oct_sctr_pension": octSctrPension,
        "nov_monto": novMonto,
        "nov_essalud": novEssalud,
        "nov_sctr_salud": novSctrSalud,
        "nov_vidaley": novVidaley,
        "nov_sctr_pension": novSctrPension,
        "nov_cts": novCts,
        "dic_monto": dicMonto,
        "dic_essalud": dicEssalud,
        "dic_sctr_salud": dicSctrSalud,
        "dic_vidaley": dicVidaley,
        "dic_sctr_pension_grati": dicSctrPensionGrati,
        "dic_grati": dicGrati,
        "dic_boni": dicBoni,
        "21.11.14 - PERSONAL CON CONTRATO A PLAZO INDETERMINADO (REGIMEN LABORAL PRIVADO)":
            0,
        "21.19.13 - BONIFICACION POR ESCOLARIDAD": 0,
        "21.19.21 - COMPENSACION POR TIEMPO DE SERVICIOS (CTS)": 0,
        "21.19.11 - GRATIFICACIONES": 0,
        "21.19.399 - OTRAS OCASIONALES": 0,
        "21.31.15 - CONTRIBUCIONES A ESSALUD": 0,
        "21.31.16 - SCTR SALUD": 0,
        "total_t": 0,
        "vidaley_t": 0,
        "sctrpension_t": 0,
        "21.31.16 - OTRAS CONTRIBUCIONES DEL EMPLEADOR": 0,
        "21.21.11 - UNIFORME PERSONAL ADMINISTRATIVO": 0,
        "21.21.199 - OTRAS RETRIBUCIONES EN ESPECIE": 0,
        "total_g": 0
      };

  @override
  String toString() {
    return 'CapEntity(id:$id, anio: $anio, orgAreaId: $orgAreaId, descArea: $descArea, idpap: $idpap, idcap: $idcap, pdId: $pdId, plaza: $plaza, plazaOld: $plazaOld, estadoActual: $estadoActual, estadoOpp: $estadoOpp, estadoPap: $estadoPap, estadoAir:$estadoAir, tipoIngreso: $tipoIngreso, feIngreso: $feIngreso, tipoSalida: $tipoSalida, feSalida: $feSalida,finLicenai: $finLicencia, dni: $dni, nombres: $nombres, modalidad: $modalidad, asigFam: $asigFam, uniforme: $uniforme, vale: $vale, sede: $sede, fuenteBase: $fuenteBase, feNac: $feNac, cargocap: $cargocap, cargoPap: $cargoPap, metaId: $metaId, meta: $meta, finalidad: $finalidad, producto: $producto, nivelO: $nivelO, descNivel: $descNivel, idnivel: $idnivel, idescala: $idescala, descEscala: $descEscala, tipoEscala: $tipoEscala, codigoPlaza: $codigoPlaza, detalle: $detalle, capPvnId: $capPvnId, montoEscalaNext: $montoEscalaNext, ppto2021: $ppto2021, epsAporta: $epsAporta, montoBasico: $montoBasico, montoEscala: $montoEscala, asigFamiliarAir: $asigFamiliarAir, totalBasico: $totalBasico, essalud: $essalud, epsSalud: $epsSalud, sctrSalud: $sctrSalud, sctrSaludGrati: $sctrSaludGrati, vidaLey: $vidaLey, sctrPension: $sctrPension, sctrPensionGrati: $sctrPensionGrati, eneMonto: $eneMonto, eneEssalud: $eneEssalud, eneSctrSalud: $eneSctrSalud, eneVidaley: $eneVidaley, eneSctrPension: $eneSctrPension, eneEscolaridad: $eneEscolaridad, febMonto: $febMonto, febEssalud: $febEssalud, febSctrSalud: $febSctrSalud, febVidaley: $febVidaley, febSctrPension: $febSctrPension, marMonto: $marMonto, marEssalud: $marEssalud, marSctrSalud: $marSctrSalud, marVidaley: $marVidaley, marSctrPension: $marSctrPension, abrMonto: $abrMonto, abrEssalud: $abrEssalud, abrSctrSalud: $abrSctrSalud, abrVidaley: $abrVidaley, abrSctrPension: $abrSctrPension, mayMonto: $mayMonto, mayEssalud: $mayEssalud, maySctrSalud: $maySctrSalud, mayVidaley: $mayVidaley, maySctrPension: $maySctrPension, mayCts: $mayCts, junMonto: $junMonto, junEssalud: $junEssalud, junSctrSalud: $junSctrSalud, junVidaley: $junVidaley, junSctrPension: $junSctrPension, julMonto: $julMonto, julEssalud: $julEssalud, julSctrSalud: $julSctrSalud, julVidaley: $julVidaley, julSctrPensionGrati: $julSctrPensionGrati, julBoni: $julBoni, julGrati: $julGrati, agoMonto: $agoMonto, agoEssalud: $agoEssalud, agoSctrSalud: $agoSctrSalud, agoVidaley: $agoVidaley, agoSctrPension: $agoSctrPension, setMonto: $setMonto, setEssalud: $setEssalud, setSctrSalud: $setSctrSalud, setVidaley: $setVidaley, setSctrPension: $setSctrPension, octMonto: $octMonto, octEssalud: $octEssalud, octSctrSalud: $octSctrSalud, octVidaley: $octVidaley, octSctrPension: $octSctrPension, novMonto: $novMonto, novEssalud: $novEssalud, novSctrSalud: $novSctrSalud, novVidaley: $novVidaley, novSctrPension: $novSctrPension, novCts: $novCts, dicMonto: $dicMonto, dicEssalud: $dicEssalud, dicSctrSalud: $dicSctrSalud, dicVidaley: $dicVidaley, dicSctrPensionGrati: $dicSctrPensionGrati, dicBoni: $dicBoni, dicGrati: $dicGrati)';
  }
}