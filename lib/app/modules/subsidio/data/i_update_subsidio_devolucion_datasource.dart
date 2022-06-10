import 'package:rrhh_clean/app/modules/subsidio/domain/subsidio_devolucion_entity.dart';
import 'package:rrhh_clean/app/modules/subsidio/domain/update_subsidio_devolucion_usecase.dart';

abstract class IUpdateSubsidioDevolucionDatasource {
  Future<SubsidioDevolucionEntity> updateSubsidioDevolucion(
      ParamsUpdateSubsidio params);
}
