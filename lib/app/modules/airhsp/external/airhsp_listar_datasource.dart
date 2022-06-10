import 'dart:io';
import 'package:rrhh_clean/core/config/http_custom.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../data/datasources/i_listar_datasource.dart';
import '../data/models/airhsp_model.dart';
import '../data/models/conceptos_model.dart';

class ListarDatasourceImpl implements IAirhspDatasource {
  @override
  Future<List<AirHspModel>> listar(ejecutora, tipoPersona) async {
    return _getListadoFromUrl(
        '/airhsp/ConsultaGeneral_Filtro_Xml2', ejecutora, tipoPersona);
  }

  final HttpCustom httpCustom;
  ListarDatasourceImpl({
    required this.httpCustom,
  });

  @override
  Future<List<ConceptoModel>> conceptos(
      ejecutora, tipoPersona, codPlaza) async {
    return _getConceptosFromUrl('/airhsp/Consulta_Remuner_IngresosEmpleado_Xml',
        ejecutora, tipoPersona, codPlaza);
  }

  Future<List<AirHspModel>> _getListadoFromUrl(
      String _url, _ejecutora, _tipoPersona) async {
    var url = Uri.https('dggrp.mef.gob.pe', _url, {'q': '{http}'});

    Map<String, String> param = {
      'idGobierno': "0",
      'idSector': "36",
      'idPliego': "036",
      'idUe': _ejecutora,
      'CantReg': "2000",
      'TipoPersonal': _tipoPersona,
      'TipoBusqueda': "1",
      'DetalleBusqueda': "",
      'ApeMat': "",
      'Nombres': "",
      'accion': "3",
      'subaccion': "0",
      'NombreUser': "jmaruyic",
      'CodUser': "C6E0E5B1EFDA0F5C",
      'filtro': "01",
      'subFiltro': "0",
      'ejercicio': "2022",
      'RangoFinal': "2000",
      'RangoInicial': "1"
    };

    try {
      var response = await httpCustom.post(url,
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
            'Cookie': 'JSESSIONID=864FF361F80EB2CFDDE930F1C43BE2C4',
            'Host': 'dggrp.mef.gob.pe'
          },
          body: param);
      print(response.body);
      return airHspModelFromXML(response.body);
    } on SocketException {
      throw ServerException('Sin conexion');
    } on HttpException {
      throw ServerException("No se encuentra la plaza");
    } on FormatException {
      throw ServerException("Formato incorrecto");
    }
  }

  Future<List<ConceptoModel>> _getConceptosFromUrl(String _url,
      String _ejecutora, String _tipoPersona, String _codPlaza) async {
    var url = Uri.https('dggrp.mef.gob.pe', _url, {'q': '{http}'});
    Map<String, String> param = {
      'tipo': '1',
      'ejercicio': '2022',
      'mes': '01',
      'band': '1',
      'secEjec': _ejecutora,
      'codTipoPer': _tipoPersona,
      'codPlaza': _codPlaza,
      'secuenc': '0',
      'cNumDocum': '00000000',
      'cTipDocum': '2',
      'fechIni': '01/01/2022',
      'tipoConsulta': '1',
      'numPla': '1',
      'expediente': '1',
      'codTipoPla': '1'
    };

    try {
      var response = await httpCustom.post(url,
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
            'Cookie': 'JSESSIONID=864FF361F80EB2CFDDE930F1C43BE2C4',
            "referer": "http://dggrp.mef.gob.pe/airhsp/ini.ejecutar.do",
            'X-Requested-With': 'XMLHttpRequest',
            'User-Agent':
                'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:85.0) Gecko/20100101 Firefox/85.0',
            'Host': 'dggrp.mef.gob.pe',
            'Accept': '*/*',
            'Origin': 'http://dggrp.mef.gob.pe',
            'Connection': 'keep-alive'
          },
          body: param);

      if (response.statusCode == 200)
        return conceptosModelFromXML(response.body);
      else
        throw Error('Failure of Server 😑');
    } on SocketException {
      throw Error('No Internet connection 😑');
    } on HttpException {
      throw Error("Couldn't find the post 😱");
    } on FormatException {
      throw Error("Bad response format 👎");
    }
  }
}
