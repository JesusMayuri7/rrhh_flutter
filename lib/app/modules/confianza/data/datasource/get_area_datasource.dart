import '../../../../../core/data/models/response_model.dart';

abstract class IListAreaDataSource {
  Future<ResponseModel> getListAreas();
}
