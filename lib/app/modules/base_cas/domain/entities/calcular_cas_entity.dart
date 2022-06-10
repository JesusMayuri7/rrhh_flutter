import 'package:equatable/equatable.dart';
import 'base_cas_entity.dart';

class CalcularCasEntity extends Equatable {
  final List<BaseCasEntity> listaBaseCas;
/*  final double totalMonto;
  final double totalEssalud;
  final double totalMontoAnual;
  final double totalEssaludAnual;
  final double totalAguinaldoAnual;
  final double totalAnual;
  final double totalSctrAnual;*/

  CalcularCasEntity({
    required this.listaBaseCas,
    /* required this.totalMonto,
      required this.totalEssalud,
      required this.totalMontoAnual,
      required this.totalEssaludAnual,
      required this.totalAguinaldoAnual,
      required this.totalAnual,
      required this.totalSctrAnual */
  });

  @override
  List<Object?> get props => [
        listaBaseCas,
        /*totalMonto,
        totalEssalud,
        totalEssaludAnual,
        totalAguinaldoAnual,
        totalAnual,
        totalSctrAnual*/
      ];
}
