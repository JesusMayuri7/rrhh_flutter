import 'package:equatable/equatable.dart';

class AgendaEntity extends Equatable {
  final int idtodo;
  final String nivel;
  final String titulo;
  final String texto;
  final String fecha;
  final String tipo;
  final bool ejecutado;
  AgendaEntity({
    required this.idtodo,
    required this.nivel,
    required this.titulo,
    required this.texto,
    required this.fecha,
    required this.tipo,
    required this.ejecutado,
  });

  @override
  List<Object> get props {
    return [
      idtodo,
      nivel,
      titulo,
      texto,
      fecha,
      tipo,
      ejecutado,
    ];
  }

  @override
  bool get stringify => true;

  AgendaEntity copyWith({
    int? idtodo,
    String? nivel,
    String? titulo,
    String? texto,
    String? fecha,
    String? tipo,
    bool? ejecutado,
  }) {
    return AgendaEntity(
      idtodo: idtodo ?? this.idtodo,
      nivel: nivel ?? this.nivel,
      titulo: titulo ?? this.titulo,
      texto: texto ?? this.texto,
      fecha: fecha ?? this.fecha,
      tipo: tipo ?? this.tipo,
      ejecutado: ejecutado ?? this.ejecutado,
    );
  }
}
