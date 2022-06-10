import '../../../base_cas/domain/entities/base_cas_entity.dart';

class CalcularCasEntity {
  CalcularCasEntity({
    required this.listaBaseCas,
    required this.totalAcumulado,
  });
  List<BaseCasEntity> listaBaseCas;
  double totalAcumulado;
}
