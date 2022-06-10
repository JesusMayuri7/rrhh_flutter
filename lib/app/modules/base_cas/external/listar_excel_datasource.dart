import 'dart:convert' as convert;

import 'package:rrhh_clean/core/data/datasource/i_client_custom.dart';

import 'package:rrhh_clean/core/errors/exceptions.dart';

import '../data/datasources/i_base_excel_datasource.dart';
import '../data/model/cas_excel_model.dart';
import '../../../../core/errors/exceptions.dart';

class BaseExcelDatasourceImpl implements IBaseExcelDatasource {
  var url = Uri.https(
      'script.google.com',
      'macros/s/AKfycbwQrmkZZ_rQP7c7uGVjFmL0O7VoAAj51-BBBEhmSONJyS2akpQ/dev',
      {'q': '{http}'});

  //static const String URL = "https://script.google.com/macros/s/AKfycbwQrmkZZ_rQP7c7uGVjFmL0O7VoAAj51-BBBEhmSONJyS2akpQ/dev";

  final IClientCustom httpCustom;
  BaseExcelDatasourceImpl({
    required this.httpCustom,
  });

  @override
  Future<List<CasExcelModel>> listar() async {
    try {
      var response = await httpCustom.request(
          'GET', url.toString(), {}, (i) => (convert.jsonDecode(i)));
      return excelCasModelFromJson(response);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
