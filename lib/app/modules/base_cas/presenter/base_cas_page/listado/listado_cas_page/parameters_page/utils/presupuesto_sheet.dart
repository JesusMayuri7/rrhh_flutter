import 'package:rrhh_clean/app/modules/base_cas/domain/usecases/calcular_cas_use_case.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';

void sheetPresupuesto(
    Workbook workbook, int firstRowHeading, ParamsCalcular params) {
  final Worksheet presupuestoSheet =
      workbook.worksheets.addWithName('PRESUPUESTO');
  List<Object> headerPresupuesto = [
    'Año',
    'Fuente',
    'Producto',
    'Clasificador',
    'PIA',
    'PIM',
    'Certificado',
    'Devengado',
    'Enero',
    'Febrero',
    'Marzo',
    'Abril',
    'Mayo',
    'Junio',
    'Julio',
    'Agosto',
    'Setiembre',
    'Octubre',
    'Noviembre',
    'Diciembre'
  ];
  presupuestoSheet.importList(headerPresupuesto, firstRowHeading, 1, false);

  for (int index = 0; index < params.pim.length; index++) {
    final List<Object> row =
        List.from(params.pim[index].toMap().values.toList());

    presupuestoSheet.importList(row, firstRowHeading + index + 1, 1, false);
  }
  final int _rowSum = presupuestoSheet.getLastRow();

  presupuestoSheet.getRangeByIndex(_rowSum + 1, 5).formula =
      'SUM(E6:E$_rowSum)';
  presupuestoSheet.getRangeByIndex(_rowSum + 1, 6).formula =
      'SUM(F6:F$_rowSum)';
  presupuestoSheet.getRangeByIndex(_rowSum + 1, 7).formula =
      'SUM(G6:G$_rowSum)';
  presupuestoSheet.getRangeByIndex(_rowSum + 1, 8).formula =
      'SUM(H6:H$_rowSum)';
  presupuestoSheet.getRangeByIndex(_rowSum + 1, 9).formula =
      'SUM(I6:I$_rowSum)';
  presupuestoSheet.getRangeByIndex(_rowSum + 1, 10).formula =
      'SUM(J6:J$_rowSum)';
  presupuestoSheet.getRangeByIndex(_rowSum + 1, 11).formula =
      'SUM(K6:K$_rowSum)';
  presupuestoSheet.getRangeByIndex(_rowSum + 1, 12).formula =
      'SUM(L6:L$_rowSum)';
  presupuestoSheet.getRangeByIndex(_rowSum + 1, 13).formula =
      'SUM(M6:M$_rowSum)';
  presupuestoSheet.getRangeByIndex(_rowSum + 1, 14).formula =
      'SUM(N6:N$_rowSum)';
  presupuestoSheet.getRangeByIndex(_rowSum + 1, 15).formula =
      'SUM(O6:O$_rowSum)';
  presupuestoSheet.getRangeByIndex(_rowSum + 1, 16).formula =
      'SUM(P6:P$_rowSum)';
  presupuestoSheet.getRangeByIndex(_rowSum + 1, 17).formula =
      'SUM(Q6:Q$_rowSum)';
  presupuestoSheet.getRangeByIndex(_rowSum + 1, 18).formula =
      'SUM(R6:R$_rowSum)';
  presupuestoSheet.getRangeByIndex(_rowSum + 1, 19).formula =
      'SUM(S6:S$_rowSum)';
  presupuestoSheet.getRangeByIndex(_rowSum + 1, 20).formula =
      'SUM(T6:T$_rowSum)';

  presupuestoSheet.getRangeByName('E6:T${_rowSum + 1}').numberFormat =
      '#,##0.00';
  presupuestoSheet.getRangeByName('A6:T${_rowSum + 1}').autoFit();
}
