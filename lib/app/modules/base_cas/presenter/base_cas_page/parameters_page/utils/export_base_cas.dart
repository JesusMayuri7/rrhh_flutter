import 'package:rrhh_clean/app/modules/base_cas/domain/usecases/calcular_cas_use_case.dart';
import 'package:rrhh_clean/app/modules/base_cas/presenter/base_cas_page/parameters_page/utils/columns_base_sheet.dart';
import 'package:rrhh_clean/app/modules/base_cas/presenter/base_cas_page/parameters_page/utils/presupuesto_cas_sheet.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';

import 'package:rrhh_clean/core/uitls/universal_file/save_file_mobile.dart'
    if (dart.library.html) 'package:rrhh_clean/core/uitls/universal_file/save_file_web.dart';

import 'certificado_cas_sheet.dart';

Future<void> generateExcel(ParamsCalcular params) async {
  // Create a new Excel Document.
  final Workbook workbook = Workbook();

// Accessing sheet via index.
  final Worksheet sheet = workbook.worksheets[0];
  sheet.name = 'BASE';
  sheet.enableSheetCalculations();

  int firstRowHeading = 5;

  String _fmesInicio =
      '\$${ColumnBaseHeader.mesInicioValue.columnLetter}\$${RowBaseHeader.uno.rowIndex}';
  String _fmesFin =
      '\$${ColumnBaseHeader.mesFinValue.columnLetter}\$${RowBaseHeader.dos.rowIndex}';

  String _fuit =
      '\$${ColumnBaseHeader.uitValue.columnLetter}\$${RowBaseHeader.uno.rowIndex}';
  String _fmaxSueldo =
      '\$${ColumnBaseHeader.porcentajeMaxSueldoValue.columnLetter}\$${RowBaseHeader.dos.rowIndex}';
  String _fmaxEssalud =
      '\$${ColumnBaseHeader.porcentajeEssaludValue.columnLetter}\$${RowBaseHeader.tres.rowIndex}';
  String _fprimaSctrSalud =
      '\$${ColumnBaseHeader.primaSctrSaludValue.columnLetter}\$${RowBaseHeader.uno.rowIndex}';
  String _figvSctrSalud =
      '\$${ColumnBaseHeader.igvAdicionalSctrSaludValue.columnLetter}\$${RowBaseHeader.dos.rowIndex}';
  String _faguinaldo =
      '\$${ColumnBaseHeader.aguinaldoSemestralValue.columnLetter}\$${RowBaseHeader.uno.rowIndex}';
  String _fprimaSctrPension =
      '\$${ColumnBaseHeader.primaSctrPensionValue.columnLetter}\$${RowBaseHeader.uno.rowIndex}';
  String _figvSctrPension =
      '\$${ColumnBaseHeader.igvAdicionalSctrPensionValue.columnLetter}\$${RowBaseHeader.dos.rowIndex}';
  String _fcomisionSctrPension =
      '\$${ColumnBaseHeader.comisionSctrPensionValue.columnLetter}\$${RowBaseHeader.tres.rowIndex}';

  //Meses
  parameterBaseSheet(
      sheet,
      params,
      RowBaseHeader.uno.rowIndex,
      RowBaseHeader.dos.rowIndex,
      RowBaseHeader.tres.rowIndex,
      RowBaseHeader.cuatro.rowIndex);

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
    sheet
        .getRangeByName(ColumnBaseTable.mesInicio.columnLetter + '$rowIndex')
        .formula = _fmesInicio; // MesInicio
    sheet
        .getRangeByName(ColumnBaseTable.mesFin.columnLetter + '$rowIndex')
        .formula = _fmesFin; // Mes Fin
    sheet
            .getRangeByName(
                ColumnBaseTable.essaludMensual.columnLetter + '$rowIndex')
            .formula =
        '=IF(\$${ColumnBaseTable.montoMensual.columnLetter}$rowIndex>=($_fuit*$_fmaxSueldo),($_fuit*$_fmaxSueldo*$_fmaxEssalud),${ColumnBaseTable.montoMensual.columnLetter}$rowIndex*$_fmaxEssalud)';
    sheet
            .getRangeByName(ColumnBaseTable.montoAnual.columnLetter + '$rowIndex')
            .formula =
        '=\$${ColumnBaseTable.montoMensual.columnLetter}$rowIndex*IF(${ColumnBaseTable.mesInicio.columnLetter}$rowIndex>0,((\$${ColumnBaseTable.mesFin.columnLetter}$rowIndex-\$${ColumnBaseTable.mesInicio.columnLetter}$rowIndex)+1),0)';
    sheet
            .getRangeByName(ColumnBaseTable.essaludAnual.columnLetter + '$rowIndex')
            .formula =
        '=\$${ColumnBaseTable.essaludMensual.columnLetter}$rowIndex*IF(${ColumnBaseTable.mesInicio.columnLetter}$rowIndex>0,((\$${ColumnBaseTable.mesFin.columnLetter}$rowIndex-\$${ColumnBaseTable.mesInicio.columnLetter}$rowIndex)+1),0)';
    sheet
            .getRangeByName(
                ColumnBaseTable.aguinaldoAnual.columnLetter + '$rowIndex')
            .formula =
        '''=IF(\$${ColumnBaseTable.mesInicio.columnLetter}$rowIndex>0,IF(\$${ColumnBaseTable.mesFin.columnLetter}$rowIndex>=6,
            IF(\$${ColumnBaseTable.mesInicio.columnLetter}$rowIndex<5,$_faguinaldo,IF(\$${ColumnBaseTable.mesInicio.columnLetter}$rowIndex=5,$_faguinaldo-100,
            IF(\$${ColumnBaseTable.mesInicio.columnLetter}$rowIndex=6,$_faguinaldo-200,0))),0)+IF(\$${ColumnBaseTable.mesFin.columnLetter}$rowIndex>=11,
            IF(\$${ColumnBaseTable.mesInicio.columnLetter}$rowIndex<10,$_faguinaldo,IF(\$${ColumnBaseTable.mesInicio.columnLetter}$rowIndex=10,$_faguinaldo-100,
            IF(\$${ColumnBaseTable.mesFin.columnLetter}$rowIndex=11,$_faguinaldo-200,0))),0),0)''';
    sheet
            .getRangeByName(ColumnBaseTable.total.columnLetter + '$rowIndex')
            .formula =
        '=SUM(${ColumnBaseTable.montoAnual.columnLetter}$rowIndex:${ColumnBaseTable.aguinaldoAnual.columnLetter}$rowIndex)';
    sheet
        .getRangeByName(
            ColumnBaseTable.sctrSaludMensual.columnLetter + '$rowIndex')
        .formula = '=X$rowIndex*($_fprimaSctrSalud)*($_figvSctrSalud)';
    sheet
            .getRangeByName(
                ColumnBaseTable.sctrSaludAnual.columnLetter + '$rowIndex')
            .formula =
        '=IF(\$${ColumnBaseTable.mesInicio.columnLetter}$rowIndex>0,(\$${ColumnBaseTable.sctrSaludMensual.columnLetter}$rowIndex*IF(\$${ColumnBaseTable.mesInicio.columnLetter}$rowIndex>0,((\$${ColumnBaseTable.mesFin.columnLetter}$rowIndex-\$${ColumnBaseTable.mesInicio.columnLetter}$rowIndex)+1),0))+(${ColumnBaseTable.aguinaldoAnual.columnLetter}$rowIndex*($_fprimaSctrSalud)*($_figvSctrSalud)),0)';
    sheet
            .getRangeByName(
                ColumnBaseTable.sctrPensionMensual.columnLetter + '$rowIndex')
            .formula =
        '=ROUND(\$${ColumnBaseTable.montoMensual.columnLetter}$rowIndex*($_fprimaSctrPension)*($_figvSctrPension)*($_fcomisionSctrPension),2)';
    sheet
            .getRangeByName(
                ColumnBaseTable.sctrPensionAnual.columnLetter + '$rowIndex')
            .formula =
        '=ROUNDUP(IF(\$${ColumnBaseTable.mesInicio.columnLetter}$rowIndex>0,(\$${ColumnBaseTable.sctrPensionMensual.columnLetter}$rowIndex*IF(\$${ColumnBaseTable.mesInicio.columnLetter}$rowIndex>0,((\$${ColumnBaseTable.mesFin.columnLetter}$rowIndex-\$${ColumnBaseTable.mesInicio.columnLetter}$rowIndex)+1),0))+(\$${ColumnBaseTable.aguinaldoAnual.columnLetter}$rowIndex*$_fprimaSctrPension*$_figvSctrPension*$_fcomisionSctrPension),0),2)';
  }

  // Totales
  final firstRow = firstRowHeading + 1;
  int rowTotal = sheet.getLastRow() - 1;

  sheet.getRangeByIndex(sheet.getLastRow(), 24).formula =
      '=SUBTOTAL(9,${ColumnBaseTable.montoMensual.columnLetter}$firstRow:${ColumnBaseTable.montoMensual.columnLetter}$rowTotal)';
  sheet.getRangeByIndex(sheet.getLastRow(), 25).formula =
      '=SUBTOTAL(9,${ColumnBaseTable.essaludMensual.columnLetter}$firstRow:${ColumnBaseTable.essaludMensual.columnLetter}$rowTotal)';
  sheet.getRangeByIndex(sheet.getLastRow(), 26).formula =
      '=SUBTOTAL(9,${ColumnBaseTable.montoAnual.columnLetter}$firstRow:${ColumnBaseTable.montoAnual.columnLetter}$rowTotal)';
  sheet.getRangeByIndex(sheet.getLastRow(), 27).formula =
      '=SUBTOTAL(9,${ColumnBaseTable.essaludAnual.columnLetter}$firstRow:${ColumnBaseTable.essaludAnual.columnLetter}$rowTotal)';
  sheet.getRangeByIndex(sheet.getLastRow(), 28).formula =
      '=SUBTOTAL(9,${ColumnBaseTable.aguinaldoAnual.columnLetter}$firstRow:${ColumnBaseTable.aguinaldoAnual.columnLetter}$rowTotal)';
  sheet.getRangeByIndex(sheet.getLastRow(), 29).formula =
      '=SUBTOTAL(9,${ColumnBaseTable.total.columnLetter}$firstRow:${ColumnBaseTable.total.columnLetter}$rowTotal)';
  sheet.getRangeByIndex(sheet.getLastRow(), 30).formula =
      '=SUBTOTAL(9,${ColumnBaseTable.sctrSaludMensual.columnLetter}$firstRow:${ColumnBaseTable.sctrSaludMensual.columnLetter}$rowTotal)';
  sheet.getRangeByIndex(sheet.getLastRow(), 31).formula =
      '=SUBTOTAL(9,${ColumnBaseTable.sctrSaludAnual.columnLetter}$firstRow:${ColumnBaseTable.sctrSaludAnual.columnLetter}$rowTotal)';
  sheet.getRangeByIndex(sheet.getLastRow(), 32).formula =
      '=SUBTOTAL(9,${ColumnBaseTable.sctrPensionMensual.columnLetter}$firstRow:${ColumnBaseTable.sctrPensionMensual.columnLetter}$rowTotal)';
  sheet.getRangeByIndex(sheet.getLastRow(), 33).formula =
      '=SUBTOTAL(9,${ColumnBaseTable.sctrPensionAnual.columnLetter}$firstRow:${ColumnBaseTable.sctrPensionAnual.columnLetter}$rowTotal)';

  //sheet.getRangeByName('X$firstRow:AD$lastRow').numberFormat = '#,##0.00';

  sheetPresupuestoExtend(workbook, firstRowHeading, params, sheet);
  sheetCertificado(
      workbook, firstRowHeading, params, sheet.getLastRow() - 1, params.lista);

  // RESUMEN de Horizontal a Vertical

// Save and dispose workbook.
  final List<int> bytes = workbook.saveAsStream();
  workbook.dispose();
  await FileSaveHelper.saveAndLaunchFile(bytes, 'BaseCasCalculado.xlsx');
}

void parameterBaseSheet(Worksheet sheet, ParamsCalcular params, int _rowUno,
    _rowDos, _rowTres, _rowCuatro) {
  //Meses
  sheet
      .getRangeByName(ColumnBaseHeader.mesInicioTitle.columnLetter + '$_rowUno')
      .setText('Mes Inicio');
  sheet
      .getRangeByName(ColumnBaseHeader.mesFinTitle.columnLetter + '$_rowDos')
      .setText('Mes Fin');
  sheet
      .getRangeByName(ColumnBaseHeader.mesInicioValue.columnLetter + '$_rowUno')
      .setNumber(params.mesInicio + 1);
  sheet
      .getRangeByName(ColumnBaseHeader.mesFinValue.columnLetter + '$_rowDos')
      .setNumber(params.mesFin + 1);

  // Essalud
  sheet
      .getRangeByName(ColumnBaseHeader.uitTitle.columnLetter + '$_rowUno')
      .setText('UIT');
  sheet
      .getRangeByName(
          ColumnBaseHeader.porcentajeMaxSueldoTitle.columnLetter + '$_rowDos')
      .setText('% Max. Sueldo');
  sheet
      .getRangeByName(
          ColumnBaseHeader.porcentajeEssaludTitle.columnLetter + '$_rowTres')
      .setText('% Essalud');
  sheet
      .getRangeByName(ColumnBaseHeader.uitValue.columnLetter + '$_rowUno')
      .setNumber(params.uit.toDouble());
  sheet
      .getRangeByName(
          ColumnBaseHeader.porcentajeMaxSueldoValue.columnLetter + '$_rowDos')
      .setNumber(params.porcentajeMaximoEssalud / 100);
  sheet
      .getRangeByName(
          ColumnBaseHeader.porcentajeEssaludValue.columnLetter + '$_rowTres')
      .setNumber(params.porcentajeEssalud / 100);

  sheet
      .getRangeByName(
          ColumnBaseHeader.aguinaldoSemestralTitle.columnLetter + '$_rowUno')
      .setText('Agui. Sem.');
  sheet
      .getRangeByName(
          ColumnBaseHeader.aguinaldoSemestralValue.columnLetter + '$_rowUno')
      .setNumber(params.aguinaldoSemestral);

  // Sctr Salud
  sheet
      .getRangeByName(
          ColumnBaseHeader.primaSctrSaludTitle.columnLetter + '$_rowUno')
      .setText('Prima SctrSalud');
  sheet
      .getRangeByName(
          ColumnBaseHeader.igvAdicionalSctrSaludTitle.columnLetter + '$_rowDos')
      .setText('Igv Adicional');
  sheet
      .getRangeByName(
          ColumnBaseHeader.primaSctrSaludValue.columnLetter + '$_rowUno')
      .setNumber((params.porcentajePrimaSctrSalud / 100));
  sheet
      .getRangeByName(
          ColumnBaseHeader.igvAdicionalSctrSaludValue.columnLetter + '$_rowDos')
      .setNumber((params.porcentajeIgv / 100) + 1);

  // Sctr Pension
  sheet
      .getRangeByName(
          ColumnBaseHeader.primaSctrPensionTitle.columnLetter + '$_rowUno')
      .setText('Prima SctrPension');
  sheet
      .getRangeByName(
          ColumnBaseHeader.igvAdicionalSctrPensionTitle.columnLetter +
              '$_rowDos')
      .setText('Igv Adicional');
  sheet
      .getRangeByName(
          ColumnBaseHeader.comisionSctrPensionTitle.columnLetter + '$_rowTres')
      .setText('Comision SctrPension');
  sheet
      .getRangeByName(
          ColumnBaseHeader.primaSctrPensionValue.columnLetter + '$_rowUno')
      .setNumber((params.porcentajePrimaSctrPension / 100));
  sheet
      .getRangeByName(
          ColumnBaseHeader.igvAdicionalSctrPensionValue.columnLetter +
              '$_rowDos')
      .setNumber((params.porcentajeIgv / 100) + 1);
  sheet
      .getRangeByName(
          ColumnBaseHeader.comisionSctrPensionValue.columnLetter + '$_rowTres')
      .setNumber((params.porcentajeComisionSctrPension / 100) + 1);

  // Clasificadores Row #4
  sheet
      .getRangeByName(
          ColumnBaseHeader.clasificadorSueldoValue.columnLetter + '$_rowCuatro')
      .setText('23.28.11');
  sheet
      .getRangeByName(
          ColumnBaseHeader.clasificadorEsaludValue.columnLetter + '$_rowCuatro')
      .setText('23.28.12');
  sheet
      .getRangeByName(ColumnBaseHeader.clasificadorAguinaldoValue.columnLetter +
          '$_rowCuatro')
      .setText('23.28.14');
  sheet
      .getRangeByName(ColumnBaseHeader.clasificadorSctrSaludValue.columnLetter +
          '$_rowCuatro')
      .setText('23.26.34');
}
