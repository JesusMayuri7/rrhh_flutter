class PracticanteEntity {
  PracticanteEntity({
    required this.anio,
    required this.regimen,
    required this.cargoSctrPension,
    required this.plaza,
    required this.estadoActual,
    required this.tramite,
    required this.nroTramite,
    required this.dependencia,
    required this.fechaAlta,
    required this.fechaBaja,
    required this.remuneraciones,
    required this.id,
    required this.codigoPlaza,
    required this.orgUnidadId,
    required this.descUnidad,
    required this.orgAreaId,
    required this.descArea,
    required this.descOrgano,
    required this.sede,
    required this.meta,
    required this.finalidad,
    required this.metaId,
    required this.cargo,
    required this.cargo2,
    required this.tipo2,
    required this.montoBase,
    required this.nombres,
    required this.fuenteId,
    required this.detalle,
    required this.presupuesto,
    required this.fuenteAir,
    required this.fuenteBase,
    required this.metaAir,
    required this.metaSiga,
    required this.dni,
    required this.dniAir,
    required this.ingresoAir,
    required this.nuDociden,
    required this.idContrato,
    required this.feContrato,
    required this.feIngreso,
    required this.nuContrato,
    required this.feCese,
    required this.unidadSiga,
    required this.estado,
    required this.estadoPap,
    required this.estadoOpp,
    required this.estados,
    required this.estadoAir,
    required this.montoAir,
    required this.montoSiga,
    required this.lugar,
    required this.nombresAir,
    required this.nombresSiga,
    required this.fechaFinVigenciaCas,
    required this.updatedAt,
    required this.convoca,
    required this.convocatoria,
    required this.inscripcion,
    required this.cierre,
    required this.tipo,
    required this.subvencion,
    required this.dsJerarquia,
    required this.sctrPension,
    required this.fuenteSiga,
    required this.dniSiga,
  });

  final int anio;
  final String regimen;
  final String cargoSctrPension;
  final String plaza;
  final String estadoActual;
  final String tramite;
  final String nroTramite;
  final String dependencia;
  final String fechaAlta;
  final String fechaBaja;
  final String remuneraciones;
  final int id;
  final String codigoPlaza;
  final int orgUnidadId;
  final String descUnidad;
  final int orgAreaId;
  final String descArea;
  final String descOrgano;
  final String sede;
  final String meta;
  final String finalidad;
  final int metaId;
  final String cargo;
  final String cargo2;
  final String tipo2;
  final num montoBase;
  final String nombres;
  final int fuenteId;
  final String detalle;
  final String presupuesto;
  final String fuenteAir;
  final String fuenteBase;
  final String metaAir;
  final String metaSiga;
  final String dni;
  final String dniAir;
  final String ingresoAir;
  final String nuDociden;
  final String idContrato;
  final String feContrato;
  final String feIngreso;
  final String nuContrato;
  final String feCese;
  final String unidadSiga;
  final String estado;
  final String estadoPap;
  final String estadoOpp;
  final String estados;
  final String estadoAir;
  final double montoAir;
  final double montoSiga;
  final String lugar;
  final String nombresAir;
  final String nombresSiga;
  final String fechaFinVigenciaCas;
  final String updatedAt;
  final String convoca;
  final String convocatoria;
  final String inscripcion;
  final String cierre;
  final String tipo;
  final double subvencion;
  final String dsJerarquia;
  final double sctrPension;
  final String fuenteSiga;
  final String dniSiga;

  @override
  String toString() {
    return 'PracticanteEntity(anio: $anio, regimen: $regimen, cargoSctrPension: $cargoSctrPension, plaza: $plaza, estadoActual: $estadoActual, tramite: $tramite, nroTramite: $nroTramite, dependencia: $dependencia, fechaAlta: $fechaAlta, fechaBaja: $fechaBaja, remuneraciones: $remuneraciones, id: $id, codigoPlaza: $codigoPlaza, orgUnidadId: $orgUnidadId, descUnidad: $descUnidad, orgAreaId: $orgAreaId, descArea: $descArea, descOrgano: $descOrgano, sede: $sede, meta: $meta, finalidad: $finalidad, metaId: $metaId, cargo: $cargo, cargo2: $cargo2, tipo2: $tipo2, montoBase: $montoBase, nombres: $nombres, fuenteId: $fuenteId, detalle: $detalle, presupuesto: $presupuesto, fuenteAir: $fuenteAir, fuenteBase: $fuenteBase, metaAir: $metaAir, metaSiga: $metaSiga, dni: $dni, dniAir: $dniAir, ingresoAir: $ingresoAir, nuDociden: $nuDociden, idContrato: $idContrato, feContrato: $feContrato, feIngreso: $feIngreso, nuContrato: $nuContrato, feCese: $feCese, unidadSiga: $unidadSiga, estado: $estado, estadoPap: $estadoPap, estadoOpp: $estadoOpp, estados: $estados, estadoAir: $estadoAir, montoAir: $montoAir, montoSiga: $montoSiga, lugar: $lugar, nombresAir: $nombresAir, nombresSiga: $nombresSiga, fechaFinVigenciaCas: $fechaFinVigenciaCas, updatedAt: $updatedAt, convoca: $convoca, convocatoria: $convocatoria, inscripcion: $inscripcion, cierre: $cierre, tipo: $tipo, subvencion: $subvencion, dsJerarquia: $dsJerarquia, sctrPension: $sctrPension, fuenteSiga: $fuenteSiga, dniSiga: $dniSiga)';
  }

  Map<String, dynamic> toMap() {
    return {
      'anio': anio,
      'regimen': regimen,
      'cargoSctrPension': cargoSctrPension,
      'plaza': plaza,
      'estadoActual': estadoActual,
      'tramite': tramite,
      'nroTramite': nroTramite,
      'dependencia': dependencia,
      'fechaAlta': fechaAlta,
      'fechaBaja': fechaBaja,
      'remuneraciones': remuneraciones,
      'id': id,
      'codigoPlaza': codigoPlaza,
      'orgUnidadId': orgUnidadId,
      'descUnidad': descUnidad,
      'orgAreaId': orgAreaId,
      'descArea': descArea,
      'descOrgano': descOrgano,
      'sede': sede,
      'meta': meta,
      'finalidad': finalidad,
      'metaId': metaId,
      'cargo': cargo,
      'cargo2': cargo2,
      'tipo2': tipo2,
      'montoBase': montoBase,
      'nombres': nombres,
      'fuenteId': fuenteId,
      'detalle': detalle,
      'presupuesto': presupuesto,
      'fuenteAir': fuenteAir,
      'fuenteBase': fuenteBase,
      'metaAir': metaAir,
      'metaSiga': metaSiga,
      'dni': dni,
      'dniAir': dniAir,
      'ingresoAir': ingresoAir,
      'nuDociden': nuDociden,
      'idContrato': idContrato,
      'feContrato': feContrato,
      'feIngreso': feIngreso,
      'nuContrato': nuContrato,
      'feCese': feCese,
      'unidadSiga': unidadSiga,
      'estado': estado,
      'estadoPap': estadoPap,
      'estadoOpp': estadoOpp,
      'estados': estados,
      'estadoAir': estadoAir,
      'montoAir': montoAir,
      'montoSiga': montoSiga,
      'lugar': lugar,
      'nombresAir': nombresAir,
      'nombresSiga': nombresSiga,
      'fechaFinVigenciaCas': fechaFinVigenciaCas,
      'updatedAt': updatedAt,
      'convoca': convoca,
      'convocatoria': convocatoria,
      'inscripcion': inscripcion,
      'cierre': cierre,
      'tipo': tipo,
      'subvencion': subvencion,
      'dsJerarquia': dsJerarquia,
      'sctrPension': sctrPension,
      'fuenteSiga': fuenteSiga,
      'dniSiga': dniSiga,
    };
  }

  factory PracticanteEntity.fromMap(Map<String, dynamic> map) {
    return PracticanteEntity(
      anio: map['anio'],
      regimen: map['regimen'],
      cargoSctrPension: map['cargoSctrPension'],
      plaza: map['plaza'],
      estadoActual: map['estadoActual'],
      tramite: map['tramite'],
      nroTramite: map['nroTramite'],
      dependencia: map['dependencia'],
      fechaAlta: map['fechaAlta'],
      fechaBaja: map['fechaBaja'],
      remuneraciones: map['remuneraciones'],
      id: map['id'],
      codigoPlaza: map['codigoPlaza'],
      orgUnidadId: map['orgUnidadId'],
      descUnidad: map['descUnidad'],
      orgAreaId: map['orgAreaId'],
      descArea: map['descArea'],
      descOrgano: map['descOrgano'],
      sede: map['sede'],
      meta: map['meta'],
      finalidad: map['finalidad'],
      metaId: map['metaId'],
      cargo: map['cargo'],
      cargo2: map['cargo2'],
      tipo2: map['tipo2'],
      montoBase: map['montoBase'],
      nombres: map['nombres'],
      fuenteId: map['fuenteId'],
      detalle: map['detalle'],
      presupuesto: map['presupuesto'],
      fuenteAir: map['fuenteAir'],
      fuenteBase: map['fuenteBase'],
      metaAir: map['metaAir'],
      metaSiga: map['metaSiga'],
      dni: map['dni'],
      dniAir: map['dniAir'],
      ingresoAir: map['ingresoAir'],
      nuDociden: map['nuDociden'],
      idContrato: map['idContrato'],
      feContrato: map['feContrato'],
      feIngreso: map['feIngreso'],
      nuContrato: map['nuContrato'],
      feCese: map['feCese'],
      unidadSiga: map['unidadSiga'],
      estado: map['estado'],
      estadoPap: map['estadoPap'],
      estadoOpp: map['estadoOpp'],
      estados: map['estados'],
      estadoAir: map['estadoAir'],
      montoAir: map['montoAir'],
      montoSiga: map['montoSiga'],
      lugar: map['lugar'],
      nombresAir: map['nombresAir'],
      nombresSiga: map['nombresSiga'],
      fechaFinVigenciaCas: map['fechaFinVigenciaCas'],
      updatedAt: map['updatedAt'],
      convoca: map['convoca'],
      convocatoria: map['convocatoria'],
      inscripcion: map['inscripcion'],
      cierre: map['cierre'],
      tipo: map['tipo'],
      subvencion: map['subvencion'],
      dsJerarquia: map['dsJerarquia'],
      sctrPension: map['sctrPension'],
      fuenteSiga: map['fuenteSiga'],
      dniSiga: map['dniSiga'],
    );
  }

  PracticanteEntity copyWith({
    int? anio,
    String? regimen,
    String? cargoSctrPension,
    String? plaza,
    String? estadoActual,
    String? tramite,
    String? nroTramite,
    String? dependencia,
    String? fechaAlta,
    String? fechaBaja,
    String? remuneraciones,
    int? id,
    String? codigoPlaza,
    int? orgUnidadId,
    String? descUnidad,
    int? orgAreaId,
    String? descArea,
    String? descOrgano,
    String? sede,
    String? meta,
    String? finalidad,
    int? metaId,
    String? cargo,
    String? cargo2,
    String? tipo2,
    num? montoBase,
    String? nombres,
    int? fuenteId,
    String? detalle,
    String? presupuesto,
    String? fuenteAir,
    String? fuenteBase,
    String? metaAir,
    String? metaSiga,
    String? dni,
    String? dniAir,
    String? ingresoAir,
    String? nuDociden,
    String? idContrato,
    String? feContrato,
    String? feIngreso,
    String? nuContrato,
    String? feCese,
    String? unidadSiga,
    String? estado,
    String? estadoPap,
    String? estadoOpp,
    String? estados,
    String? estadoAir,
    double? montoAir,
    double? montoSiga,
    String? lugar,
    String? nombresAir,
    String? nombresSiga,
    String? fechaFinVigenciaCas,
    String? updatedAt,
    String? convoca,
    String? convocatoria,
    String? inscripcion,
    String? cierre,
    String? tipo,
    double? subvencion,
    String? dsJerarquia,
    double? sctrPension,
    String? fuenteSiga,
    String? dniSiga,
  }) {
    return PracticanteEntity(
      anio: anio ?? this.anio,
      regimen: regimen ?? this.regimen,
      cargoSctrPension: cargoSctrPension ?? this.cargoSctrPension,
      plaza: plaza ?? this.plaza,
      estadoActual: estadoActual ?? this.estadoActual,
      tramite: tramite ?? this.tramite,
      nroTramite: nroTramite ?? this.nroTramite,
      dependencia: dependencia ?? this.dependencia,
      fechaAlta: fechaAlta ?? this.fechaAlta,
      fechaBaja: fechaBaja ?? this.fechaBaja,
      remuneraciones: remuneraciones ?? this.remuneraciones,
      id: id ?? this.id,
      codigoPlaza: codigoPlaza ?? this.codigoPlaza,
      orgUnidadId: orgUnidadId ?? this.orgUnidadId,
      descUnidad: descUnidad ?? this.descUnidad,
      orgAreaId: orgAreaId ?? this.orgAreaId,
      descArea: descArea ?? this.descArea,
      descOrgano: descOrgano ?? this.descOrgano,
      sede: sede ?? this.sede,
      meta: meta ?? this.meta,
      finalidad: finalidad ?? this.finalidad,
      metaId: metaId ?? this.metaId,
      cargo: cargo ?? this.cargo,
      cargo2: cargo2 ?? this.cargo2,
      tipo2: tipo2 ?? this.tipo2,
      montoBase: montoBase ?? this.montoBase,
      nombres: nombres ?? this.nombres,
      fuenteId: fuenteId ?? this.fuenteId,
      detalle: detalle ?? this.detalle,
      presupuesto: presupuesto ?? this.presupuesto,
      fuenteAir: fuenteAir ?? this.fuenteAir,
      fuenteBase: fuenteBase ?? this.fuenteBase,
      metaAir: metaAir ?? this.metaAir,
      metaSiga: metaSiga ?? this.metaSiga,
      dni: dni ?? this.dni,
      dniAir: dniAir ?? this.dniAir,
      ingresoAir: ingresoAir ?? this.ingresoAir,
      nuDociden: nuDociden ?? this.nuDociden,
      idContrato: idContrato ?? this.idContrato,
      feContrato: feContrato ?? this.feContrato,
      feIngreso: feIngreso ?? this.feIngreso,
      nuContrato: nuContrato ?? this.nuContrato,
      feCese: feCese ?? this.feCese,
      unidadSiga: unidadSiga ?? this.unidadSiga,
      estado: estado ?? this.estado,
      estadoPap: estadoPap ?? this.estadoPap,
      estadoOpp: estadoOpp ?? this.estadoOpp,
      estados: estados ?? this.estados,
      estadoAir: estadoAir ?? this.estadoAir,
      montoAir: montoAir ?? this.montoAir,
      montoSiga: montoSiga ?? this.montoSiga,
      lugar: lugar ?? this.lugar,
      nombresAir: nombresAir ?? this.nombresAir,
      nombresSiga: nombresSiga ?? this.nombresSiga,
      fechaFinVigenciaCas: fechaFinVigenciaCas ?? this.fechaFinVigenciaCas,
      updatedAt: updatedAt ?? this.updatedAt,
      convoca: convoca ?? this.convoca,
      convocatoria: convocatoria ?? this.convocatoria,
      inscripcion: inscripcion ?? this.inscripcion,
      cierre: cierre ?? this.cierre,
      tipo: tipo ?? this.tipo,
      subvencion: subvencion ?? this.subvencion,
      dsJerarquia: dsJerarquia ?? this.dsJerarquia,
      sctrPension: sctrPension ?? this.sctrPension,
      fuenteSiga: fuenteSiga ?? this.fuenteSiga,
      dniSiga: dniSiga ?? this.dniSiga,
    );
  }
}
