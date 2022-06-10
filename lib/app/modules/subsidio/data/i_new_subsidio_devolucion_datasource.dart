import 'package:rrhh_clean/app/modules/subsidio/data/subsidio_devolucion_model.dart';
import 'package:rrhh_clean/app/modules/subsidio/domain/new_subsidio_devolucion_usecase.dart';

abstract class INewSubsidioDevolucionDatasource {
  Future<SubsidioDevolucionModel> newSubsidioDevolucion(
      ParamsNewSubsidio params);
}
