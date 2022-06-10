import '../models/confianza_model.dart';
import '../../../../../core/data/models/response_model.dart';

abstract class IPostConfianzaDataSource {
  Future<ResponseModel> postConfianza(ConfianzaModel confianzaModel);
}
