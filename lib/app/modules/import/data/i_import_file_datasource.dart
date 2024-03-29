import 'package:rrhh_clean/app/modules/import/presenter/domain/import_file_use_case.dart';
import 'package:rrhh_clean/core/config/i_client_custom.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';

abstract class IImportFileDatasource {
  Future<ResponseModel> importFile(ParamsInportFile params);
}

class ImportFileDatasourceImpl implements IImportFileDatasource {
  var url =
      Uri.http('rrhh.pvn.gob.pe', '/api/documentos/import', {'q': '{http}'});

  final IClientCustom httpCustom;
  ImportFileDatasourceImpl({
    required this.httpCustom,
  });

  @override
  Future<ResponseModel> importFile(ParamsInportFile params) async {
    var response = await httpCustom.load(url.toString(), params, 'POST');

    ResponseModel responseModel = responseFromJson(response.toString());

    return ResponseModel(
        status: responseModel.status,
        message: responseModel.message,
        data: responseModel.data);
  }

  ver(String str) {}
}
