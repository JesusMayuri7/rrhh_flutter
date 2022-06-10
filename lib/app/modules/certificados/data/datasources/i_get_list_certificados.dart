import 'package:rrhh_clean/core/data/models/response_model.dart';

abstract class IGetListCertificadosDatasource {
  Future<ResponseModel> getListCertificados();
}
