import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:rrhh_clean/core/domain/entities/fuente_entity.dart';

var fuentes = [
  FuenteEntity(id: 1, dscFuente: "Recursos Ordinarios", abvFuente: "RO"),
  FuenteEntity(
      id: 2, dscFuente: "Recursos Directamente Recaudados", abvFuente: "RDR")
];

var dateLongInputFormatter = new MaskTextInputFormatter(
    mask: '####-##-##', filter: {"#": RegExp(r'[0-9]')});
