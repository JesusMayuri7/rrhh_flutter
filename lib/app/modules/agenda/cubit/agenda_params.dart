// ignore_for_file: public_member_api_docs, sort_constructors_first
class AgendaParams {
  int idtodo;
  String nivel;
  String titulo;
  String texto;
  String fecha;
  String tipo;
  bool ejecutado;
  AgendaParams({
    this.idtodo = 0,
    this.nivel = 'ALTA',
    required this.titulo,
    required this.texto,
    required this.fecha,
    this.tipo = 'DATO',
    this.ejecutado = false,
  });

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

  factory AgendaParams.fromMap(Map<String, dynamic> map) {
    return AgendaParams(
      idtodo: map['idtodo'] as int,
      nivel: map['nivel'] as String,
      titulo: map['titulo'] as String,
      texto: map['texto'] as String,
      fecha: map['fecha'] as String,
      tipo: map['tipo'] as String,
      ejecutado: map['ejecutado'] as bool,
    );
  }

  @override
  String toString() {
    return 'AgendaParams(idtodo: $idtodo, nivel: $nivel, titulo: $titulo, texto: $texto, fecha: $fecha, tipo: $tipo, ejecutado: $ejecutado)';
  }
}
