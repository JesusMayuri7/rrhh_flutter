import '../model/cas_excel_model.dart';

abstract class IBaseExcelDatasource {
  Future<List<CasExcelModel>> listar();
}
