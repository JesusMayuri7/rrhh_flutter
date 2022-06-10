import 'package:rrhh_clean/app/modules/base_cas/presenter/base_cas_page/parameters_page/utils/certificado_cas_sheet.dart';
import 'package:rrhh_clean/app/modules/base_cas/presenter/base_cas_page/parameters_page/utils/presupuesto_cas_sheet.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';
import 'package:rrhh_clean/core/uitls/universal_file/save_file_mobile.dart'
    if (dart.library.html) 'package:rrhh_clean/core/uitls/universal_file/save_file_web.dart';

import 'package:rrhh_clean/app/modules/base_cas/domain/usecases/calcular_cas_use_case.dart';

Future<void> generateExcel(ParamsCalcular params) async {
// Create a new Excel Document.
  final Workbook workbook = Workbook();

// Accessing sheet via index.
  final Worksheet sheet = workbook.worksheets[0];
  sheet.name = 'BASE';
  sheet.enableSheetCalculations();

  //Meses
  sheet.getRangeByIndex(1, 21).setText('Mes Inicio');
  sheet.getRangeByIndex(2, 21).setText('Mes Fin');
  sheet.getRangeByIndex(1, 22).setNumber(params.mesInicio + 1);
  sheet.getRangeByIndex(2, 22).setNumber(params.mesFin + 1);

  // Essalud
  sheet.getRangeByIndex(1, 24).setText('UIT');
  sheet.getRangeByIndex(2, 24).setText('% Max. Sueldo');
  sheet.getRangeByIndex(3, 24).setText('% Essalud');
  sheet.getRangeByIndex(1, 25).setNumber(params.uit.toDouble());
  sheet.getRangeByIndex(2, 25).setNumber(params.porcentajeMaximoEssalud / 100);
  sheet.getRangeByIndex(3, 25).setNumber(params.porcentajeEssalud / 100);

  sheet.getRangeByIndex(1, 27).setText('Agui. Sem.');
  sheet.getRangeByIndex(1, 28).setNumber(params.aguinaldoSemestral);

  // Sctr Salud
  sheet.getRangeByIndex(1, 30).setText('Prima SctrSalud');
  sheet.getRangeByIndex(2, 30).setText('Igv Adicional');
  sheet
      .getRangeByIndex(1, 31)
      .setNumber((params.porcentajePrimaSctrSalud / 100));
  sheet.getRangeByIndex(2, 31).setNumber((params.porcentajeIgv / 100) + 1);

  sheet.getRangeByIndex(4, 26).setText('23.28.11');
  sheet.getRangeByIndex(4, 27).setText('23.28.12');
  sheet.getRangeByIndex(4, 28).setText('23.28.14');
  sheet.getRangeByIndex(4, 31).setText('23.26.34');

  // Sctr Pension
  sheet.getRangeByIndex(1, 32).setText('Prima SctrPension');
  sheet.getRangeByIndex(2, 32).setText('Igv Adicional');
  sheet.getRangeByIndex(3, 32).setText('Comision SctrPension');
  sheet
      .getRangeByIndex(1, 33)
      .setNumber((params.porcentajePrimaSctrPension / 100));
  sheet.getRangeByIndex(2, 33).setNumber((params.porcentajeIgv / 100) + 1);
  sheet
      .getRangeByIndex(3, 33)
      .setNumber((params.porcentajeComisionSctrPension / 100) + 1);

  int firstRowHeading = 5;
  final List<Object> heading = List.from(params.lista[0].toMap().keys.toList());
  sheet.importList(heading, firstRowHeading, 1, false);

  for (int index = 0; index < params.lista.length; index++) {
    final List<Object> row =
        List.from(params.lista[index].toMap().values.toList());

    sheet.importList(row, firstRowHeading + index + 1, 1, false);
    //final Range range1 = sheet.getRangeByName('S2:20');
  }

  for (int rowIndex = firstRowHeading + 1;
      rowIndex < sheet.getLastRow();
      rowIndex++) {
    sheet.getRangeByIndex(rowIndex, 22).formula = '=\$V\$1'; // MesInicio
    sheet.getRangeByIndex(rowIndex, 23).formula = '=\$V\$2'; // Mes Fin
    sheet.getRangeByIndex(rowIndex, 25).formula =
        '=IF(X$rowIndex>=(\$Y\$1*\$Y\$2),(\$Y\$1*\$Y\$2)*\$Y\$3,X$rowIndex*\$Y\$3)';
    sheet.getRangeByIndex(rowIndex, 26).formula =
        '=X$rowIndex*IF(V$rowIndex>0,((\$W$rowIndex-\$V$rowIndex)+1),0)';
    sheet.getRangeByIndex(rowIndex, 27).formula =
        '=Y$rowIndex*IF(V$rowIndex>0,((\$W$rowIndex-\$V$rowIndex)+1),0)';
    sheet.getRangeByIndex(rowIndex, 28).formula =
        '=IF(V$rowIndex>0,IF(W$rowIndex>=6,IF(V$rowIndex<5,\$AB\$1,IF(V$rowIndex=5,\$AB\$1-100,IF(V$rowIndex=6,\$AB\$1-200,0))),0)+IF(W$rowIndex>=11,IF(V$rowIndex<10,\$AB\$1,IF(V$rowIndex=10,\$AB\$1-100,IF(W$rowIndex=11,\$AB\$1-200,0))),0),0)';
    sheet.getRangeByIndex(rowIndex, 29).formula =
        '=SUM(Z$rowIndex:AB$rowIndex)';
    sheet.getRangeByIndex(rowIndex, 30).formula =
        '=X$rowIndex*(\$AE\$1)*(\$AE\$2)';
    sheet.getRangeByIndex(rowIndex, 31).formula =
        '=IF(V$rowIndex>0,(AD$rowIndex*IF(V$rowIndex>0,((\$W$rowIndex-\$V$rowIndex)+1),0))+(AB$rowIndex*\$AE\$1*\$AE\$2),0)';
    sheet.getRangeByIndex(rowIndex, 32).formula =
        '=ROUND(X$rowIndex*(\$AG\$1)*(\$AG\$2)*(\$AG\$3),2)';
    sheet.getRangeByIndex(rowIndex, 33).formula =
        '=ROUNDUP(IF(V$rowIndex>0,(AF$rowIndex*IF(V$rowIndex>0,((\$W$rowIndex-\$V$rowIndex)+1),0))+(AB$rowIndex*\$AG\$1*\$AG\$2*\$AG\$3),0),2)';
  }

  // Totales
  final firstRow = firstRowHeading + 1;
  int rowTotal = sheet.getLastRow() - 1;

  sheet.getRangeByIndex(sheet.getLastRow(), 24).formula =
      '=SUM(X$firstRow:X$rowTotal)';
  sheet.getRangeByIndex(sheet.getLastRow(), 25).formula =
      '=SUM(Y$firstRow:Y$rowTotal)';
  sheet.getRangeByIndex(sheet.getLastRow(), 26).formula =
      '=SUM(Z$firstRow:Z$rowTotal)';
  sheet.getRangeByIndex(sheet.getLastRow(), 27).formula =
      '=SUM(AA$firstRow:AA$rowTotal)';
  sheet.getRangeByIndex(sheet.getLastRow(), 28).formula =
      '=SUM(AB$firstRow:AB$rowTotal)';
  sheet.getRangeByIndex(sheet.getLastRow(), 29).formula =
      '=SUM(AC$firstRow:AC$rowTotal)';
  sheet.getRangeByIndex(sheet.getLastRow(), 30).formula =
      '=SUM(AD$firstRow:AD$rowTotal)';
  sheet.getRangeByIndex(sheet.getLastRow(), 31).formula =
      '=SUM(AE$firstRow:AE$rowTotal)';
  sheet.getRangeByIndex(sheet.getLastRow(), 32).formula =
      '=SUM(AF$firstRow:AF$rowTotal)';
  sheet.getRangeByIndex(sheet.getLastRow(), 33).formula =
      '=SUM(AG$firstRow:AG$rowTotal)';

  int lastRow = sheet.getLastRow();
  //sheet.getRangeByName('X$firstRow:AD$lastRow').numberFormat = '#,##0.00';

  sheetPresupuestoExtend(workbook, firstRowHeading, params, sheet);
  sheetCertificado(workbook, firstRowHeading, params, sheet);

  // RESUMEN de Horizontal a Vertical

// Save and dispose workbook.
  final List<int> bytes = workbook.saveAsStream();
  workbook.dispose();
  await FileSaveHelper.saveAndLaunchFile(bytes, 'BaseCasCalculado.xlsx');
}
