// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class AirhspPresupuestoEntity extends Equatable {
  final String plaza;
  final String descGrupoOcupacional;
  final String dni;
  final String nombres;
  final String cargo;
  final String nivel;
  final String establecimiento;
  final String dependencia;
  final String estado;
  final String fuente;
  final num remPrinRO;
  final num remPrinRDR;
  final num essalud;  
  final num bonificacionFamiliar;
  final num incremento;
  final num basicoAnual;
  final num essaludAnual;
  final num escolaridad;
  final num gratificacionJulio;
  final num gratificacionDiciembre;
  final num bonificacionExtraordinariaJulio;
  final num bonificacionExtraordinariaDiciembre;
  final num ctsMayo;
  final num ctsNoviembre;
  final num gratificacion;
  final num bonificacionExtraordinaria;
  final num cts;
  final num total;
  final num basicoMensual;

  AirhspPresupuestoEntity({
    required this.plaza,
    required this.descGrupoOcupacional,
    required this.dni,
    required this.nombres,
    required this.cargo,
    required this.nivel,
    required this.establecimiento,
    required this.dependencia,
    required this.estado,
    required this.fuente,
    required this.remPrinRO,
    required this.remPrinRDR,
    required this.essalud,
    required this.bonificacionFamiliar,
    required this.incremento,
    this.basicoAnual = 0,
    this.essaludAnual = 0,
    required this.escolaridad,
    required this.gratificacionJulio,
    required this.gratificacionDiciembre,
    required this.bonificacionExtraordinariaJulio,
    required this.bonificacionExtraordinariaDiciembre,
    required this.ctsMayo,
    required this.ctsNoviembre,
    this.gratificacion = 0,
    this.bonificacionExtraordinaria = 0,
    this.cts = 0,
    this.total = 0,
    this.basicoMensual = 0
  });

  AirhspPresupuestoEntity totales({
    String? plaza,
    String? descGrupoOcupacional,
    String? dni,
    String? nombres,
    String? cargo,
    String? nivel,
    String? establecimiento,
    String? dependencia,
    String? estado,
    String? fuente,
    num? remPrinRO,
    num? remPrinRDR,
    num? essalud,
    num? bonificacionFamiliar,
    num? incremento,
    num? basicoAnual,
    num? essaludAnual,
    num? escolaridad,
    num? gratificacionJulio,
    num? gratificacionDiciembre,
    num? bonificacionExtraordinariaJulio,
    num? bonificacionExtraordinariaDiciembre,
    num? ctsMayo,
    num? ctsNoviembre,
    num? gratificacion,
    num? cts,
    num? bonificacionExtraordinaria,
    num? total,
    num? basicoMensual
  }) {
    return AirhspPresupuestoEntity(
      plaza: plaza ?? this.plaza,
      descGrupoOcupacional: descGrupoOcupacional ?? this.descGrupoOcupacional,
      dni: dni ?? this.dni,
      nombres: nombres ?? this.nombres,
      cargo: cargo ?? this.cargo,
      nivel: nivel ?? this.nivel,
      establecimiento: establecimiento ?? this.establecimiento,
      dependencia: dependencia ?? this.dependencia,
      estado: estado ?? this.estado,
      fuente: fuente ?? this.fuente,
      remPrinRO: remPrinRO ?? this.remPrinRO,
      remPrinRDR: remPrinRDR ?? this.remPrinRDR,
      essalud: essalud ?? this.essalud,
      bonificacionFamiliar: bonificacionFamiliar ?? this.bonificacionFamiliar,
      incremento: incremento ?? this.incremento,
      basicoMensual: (this.remPrinRO + this.remPrinRDR + this.bonificacionFamiliar + this.incremento),
      basicoAnual: ((this.remPrinRO + this.remPrinRDR + this.incremento + this.bonificacionFamiliar) * 12),
      essaludAnual: (this.essalud* 12),
      escolaridad: escolaridad ?? this.escolaridad,
      gratificacionJulio: gratificacionJulio ?? this.gratificacionJulio,
      gratificacionDiciembre: gratificacionDiciembre ?? this.gratificacionDiciembre,      
      bonificacionExtraordinariaJulio: bonificacionExtraordinariaJulio ?? this.bonificacionExtraordinariaJulio,
      bonificacionExtraordinariaDiciembre: bonificacionExtraordinariaDiciembre ?? this.bonificacionExtraordinariaDiciembre,
      ctsMayo: ctsMayo ?? this.ctsMayo,
      ctsNoviembre: ctsNoviembre ?? this.ctsNoviembre,
      gratificacion: (this.gratificacionJulio + this.gratificacionDiciembre),
      cts: (this.ctsMayo + this.ctsNoviembre),
      bonificacionExtraordinaria: (this.bonificacionExtraordinariaJulio+this.bonificacionExtraordinariaDiciembre),    
      total : ((this.remPrinRO + this.remPrinRDR + this.incremento + this.bonificacionFamiliar + this.essalud) * 12)+
      (this.escolaridad + this.gratificacionJulio + this.gratificacionDiciembre + this.bonificacionExtraordinariaJulio + 
      this.bonificacionExtraordinariaDiciembre + this.ctsMayo + this.ctsNoviembre)       
    );
  }

  @override
  String toString() {
    return 'AirhspPresupuestoEntity(plaza: $plaza, dni: $dni, nombres: $nombres, cargo: $cargo, nivel: $nivel, establecimiento: $establecimiento, dependencia: $dependencia, estado: $estado, remPrinRO: $remPrinRO, remPrinRDR: $remPrinRDR, essalud: $essalud, bonificacionFamiliar: $bonificacionFamiliar, incremento: $incremento, escolaridad: $escolaridad, gratificacionJulio: $gratificacionJulio, gratificacionDiciembre: $gratificacionDiciembre, bonificacionExtraordinariaJulio: $bonificacionExtraordinariaJulio, bonificacionExtraordinariaDiciembre: $bonificacionExtraordinariaDiciembre, ctsMayo: $ctsMayo, ctsNoviembre: $ctsNoviembre, gratificacion: $gratificacion, bonificaiconExtraordinaria: $bonificacionExtraordinaria, cts: $cts, total: $total)';
  }
  
  @override  
  List<Object> get props {
    return [
      plaza,
      descGrupoOcupacional,
      dni,
      nombres,
      cargo,
      nivel,
      establecimiento,
      dependencia,
      estado,
      fuente,
      remPrinRO,
      remPrinRDR,
      basicoMensual,
      essalud,
      bonificacionFamiliar,
      incremento,
      essaludAnual,
      basicoAnual,
      escolaridad,
      gratificacionJulio,
      gratificacionDiciembre,
      bonificacionExtraordinariaJulio,
      bonificacionExtraordinariaDiciembre,
      ctsMayo,
      ctsNoviembre,
      gratificacion,
      bonificacionExtraordinaria,
      cts,
      total,
    ];
  }

    AirhspPresupuestoEntity calcular({
    String? plaza,
    String? descGrupoOcupacional,
    String? dni,
    String? nombres,
    String? cargo,
    String? nivel,
    String? establecimiento,
    String? dependencia,
    String? estado,
    String? fuente,
    num? remPrinRO,
    num? remPrinRDR,    
    num? essalud,
    num? bonificacionFamiliar,
    num? incremento,
    num? escolaridad,
    num? gratificacionJulio,
    num? gratificacionDiciembre,
    num? bonificacionExtraordinariaJulio,
    num? bonificacionExtraordinariaDiciembre,
    num? ctsMayo,
    num? ctsNoviembre,
    num? gratificacion,
    num? cts,
    num? bonificacionExtraordinaria,
    num? total,
    num? essaludAnual,
    num? basicoAnual
  }) {
    num basico = (this.remPrinRO + this.remPrinRDR + this.incremento + this.bonificacionFamiliar);
    num _cts = ((basico + (basico/6))/360)*180;
    return AirhspPresupuestoEntity(
      plaza: plaza ?? this.plaza,
      descGrupoOcupacional: descGrupoOcupacional ?? this.descGrupoOcupacional,
      dni: dni ?? this.dni,
      nombres: nombres ?? this.nombres,
      cargo: cargo ?? this.cargo,
      nivel: nivel ?? this.nivel,
      establecimiento: establecimiento ?? this.establecimiento,
      dependencia: dependencia ?? this.dependencia,
      estado: estado ?? this.estado,
      fuente: fuente ?? this.fuente,
      remPrinRO: remPrinRO ?? this.remPrinRO,
      remPrinRDR: remPrinRDR ?? this.remPrinRDR,
      essalud: (basico *0.09),
      bonificacionFamiliar: bonificacionFamiliar ?? this.bonificacionFamiliar,
      incremento: incremento ?? this.incremento,
      basicoMensual: this.remPrinRO + this.remPrinRDR + this.bonificacionFamiliar + this.incremento,
      basicoAnual: ( basico * 12 ) ,
      essaludAnual: (   num.parse((basico *0.09).toStringAsFixed(2)) * 12),
      escolaridad: basico,
      gratificacionJulio: basico,
      gratificacionDiciembre: basico,      
      gratificacion: basico *2,
      bonificacionExtraordinariaJulio:  num.parse((basico *0.09).toStringAsFixed(2)),
      bonificacionExtraordinariaDiciembre:  num.parse((basico *0.09).toStringAsFixed(2)),
      bonificacionExtraordinaria: num.parse((basico *0.09).toStringAsFixed(2)) + num.parse((basico *0.09).toStringAsFixed(2)),
      ctsMayo: num.parse(_cts.toStringAsFixed(2)),
      ctsNoviembre: num.parse(_cts.toStringAsFixed(2)), // arreglar decimal
      cts: num.parse(_cts.toStringAsFixed(2)) + num.parse(_cts.toStringAsFixed(2)),
      total:  (basico*12) + (num.parse((basico *0.09).toStringAsFixed(2)) * 12) + ( basico + (basico*2) + 
      (num.parse((basico *0.09).toStringAsFixed(2)) + num.parse((basico *0.09).toStringAsFixed(2))) 
      +  num.parse(_cts.toStringAsFixed(2)) + num.parse(_cts.toStringAsFixed(2)))      
    );
  }
  

   Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'plaza': plaza,
      'dni': dni,
      'nombres': nombres,
      'descGrupoOcupacional': descGrupoOcupacional,
      'cargo': cargo,
      'nivel': nivel,
      'establecimiento': establecimiento,
      'dependencia': dependencia,
      'estado': estado,
      'fuente': fuente,
      'remPrinRO': remPrinRO,
      'remPrinRDR': remPrinRDR,
      'bonificacionFamiliar': bonificacionFamiliar,
      'incremento': incremento,
      'basicoMensual': basicoMensual,
      'essalud': essalud,
      'basicoAnual': basicoAnual,
      'essaludAnual': essaludAnual,
      'escolaridad': escolaridad,      
      'gratificacion': gratificacion,
      'bonificacionExtraordinaria': bonificacionExtraordinaria,
      'cts': cts,
      'total': total,
    };
  }

  
}
