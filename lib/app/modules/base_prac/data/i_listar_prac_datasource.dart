import 'package:rrhh_clean/app/modules/base_prac/data/practicante_model.dart';

abstract class IListarPracDataSource {
  Future<List<PracticanteModel>> listarPrac(String anio);
}
