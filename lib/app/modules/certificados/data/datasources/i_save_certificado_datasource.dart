import 'package:rrhh_clean/core/data/models/response_model.dart';

abstract class ISaveCertificadoDatasource {
  Future<ResponseModel> saveCertificado(
      {required String detalle,
      required String tipo,
      required String certiificado,
      required String anio,
      required double montoCertificado,
      required int modalidadId,
      required List<Map<String, dynamic>> conceptoClasificador});
}
