import '../models/airhsp_model.dart';
import '../models/conceptos_model.dart';

abstract class IAirhspDatasource {
  Future<List<AirHspModel>> listar(String ejecutora, String tipoPersona);

  Future<List<ConceptoModel>> conceptos(
      String ejecutora, String tipoPersona, String codPlaza);
}
