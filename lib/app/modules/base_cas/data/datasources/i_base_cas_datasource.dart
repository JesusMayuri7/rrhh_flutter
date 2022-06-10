import '../model/base_cas_model.dart';

abstract class IBaseCasDatasource {
  Future<List<BaseCasModel>> listar(String anio);
}
