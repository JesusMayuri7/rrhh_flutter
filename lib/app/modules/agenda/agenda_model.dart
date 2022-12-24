import 'dart:convert';

import 'package:rrhh_clean/app/modules/agenda/agenda_entity.dart';

List<AgendaModel> agendaModelFromJson(String str) {
  List<dynamic> agendaJson = json.decode(str);
  return List<AgendaModel>.from(
      (agendaJson).map((x) => AgendaModel.fromJson(x)));
}

class AgendaModel extends AgendaEntity {
  AgendaModel(
      {required super.idtodo,
      required super.nivel,
      required super.titulo,
      required super.texto,
      required super.fecha,
      required super.tipo,
      required super.ejecutado});

  AgendaModel copyWith({
    int? idtodo,
    String? nivel,
    String? titulo,
    String? texto,
    String? fecha,
    String? tipo,
    bool? ejecutado,
  }) {
    return AgendaModel(
      idtodo: idtodo ?? this.idtodo,
      nivel: nivel ?? this.nivel,
      titulo: titulo ?? this.titulo,
      texto: texto ?? this.texto,
      fecha: fecha ?? this.fecha,
      tipo: tipo ?? this.tipo,
      ejecutado: ejecutado ?? this.ejecutado,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idtodo': idtodo,
      'nivel': nivel,
      'titulo': titulo,
      'texto': texto,
      'fecha': fecha,
      'tipo': tipo,
      'ejecutado': ejecutado,
    };
  }

  factory AgendaModel.fromMap(Map<String, dynamic> map) {
    return AgendaModel(
      idtodo: map['idtodo'] as int,
      nivel: map['nivel'] as String,
      titulo: map['titulo'] as String,
      texto: map['texto'] as String,
      fecha: map['fecha'] as String,
      tipo: map['tipo'] as String,
      ejecutado: map['ejecutado'] as bool,
    );
  }

  factory AgendaModel.fromJson(Map<String, dynamic> json) => AgendaModel(
      idtodo: json['idtodo'] ?? 0,
      ejecutado: (json['ejecutado'] ?? 0) == 1 ? true : false,
      fecha: json['fecha'] ?? '',
      nivel: json['nivel'] ?? '',
      texto: json['texto'] ?? '',
      tipo: json['tipo'] ?? '',
      titulo: json['titulo'] ?? '');
}
