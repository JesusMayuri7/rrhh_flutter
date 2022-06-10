import 'package:rrhh_clean/core/data/models/response_model.dart';

abstract class IGetHomeDataInitialDatasource {
  Future<List<ResponseModel>> getHomeDataInitial();
}
