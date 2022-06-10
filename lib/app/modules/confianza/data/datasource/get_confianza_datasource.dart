import '../../../../../core/data/models/response_model.dart';

abstract class IListConfianzaDataSource {
  Future<ResponseModel> getListConfianza(String anio);
}
