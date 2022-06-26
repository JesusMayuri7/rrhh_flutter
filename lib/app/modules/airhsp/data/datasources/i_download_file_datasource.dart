import 'package:rrhh_clean/core/data/models/response_model.dart';

abstract class IDownloadFileDatasource {
  Future<ResponseModel> downloadFile(String tipoPersona);
}
