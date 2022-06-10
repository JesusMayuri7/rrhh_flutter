import 'package:rrhh_clean/app/modules/base_cap/domain/entities/params_cap_calcular.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';

import 'constants.dart';

baseCapSheet(Worksheet sheet, ParamsCapCalcular params) {
// Accessing sheet via index.

  sheet.enableSheetCalculations();
  sheet.name = 'BASE';

  final int firstRowHeading = 3;

  // Data Parameter
  for (int index = 0; index < params.listParameter.length; index++) {
    final List<Object> row =
        List.from(params.listParameter[index].toMap().values.toList());
    sheet.importList(row, firstRowHeading + index + 1, 1, false);
  }

  // Clasificador
  sheet.importList(clasificador, firstRowHeading - 1, 72, false);

  // Cabeceras Data
  final int firstColData = 16;
  final List<Object> row = List.from(params.listCap[0].toMap().keys.toList());
  sheet.importList(row, firstRowHeading, firstColData, false);

  // Data
  for (int index = 0; index < params.listCap.length; index++) {
    sheet.importList(params.listCap[index].toMap().values.toList(),
        firstRowHeading + index + 1, firstColData, false);
  }

  //Calculo Total Basico
  int firstColProcess = 64;
  final int lastRow = params.listCap.length + firstRowHeading;
  for (int idxParam = 0; idxParam <= params.listCap.length; idxParam++) {
    // Total Basico
    sheet.getRangeByIndex(firstRowHeading + idxParam, firstColProcess).formula =
        '=BJ${firstRowHeading + idxParam}+BK${firstRowHeading + idxParam}';
    // Essalud
    sheet
            .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 1)
            .formula =
        '=IF(BH${firstRowHeading + idxParam}=1,BL${firstRowHeading + idxParam}*0.0675,BL${firstRowHeading + idxParam}*0.09)';
    // Eps Salud
    sheet
            .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 2)
            .formula =
        '=IF(BH${firstRowHeading + idxParam}=1,BL${firstRowHeading + idxParam}*0.0225,0)';
    // Sctr Salud
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 3)
        .formula = '=ROUND(BL${firstRowHeading + idxParam}*0.005*1.18,2)';
    // Sctr Salud Grati
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 4)
        .formula = '=ROUND(BL${firstRowHeading + idxParam}*0.005*1.18*2,2)';
    // Vida Ley
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 5)
        .formula = '=ROUND(BL${firstRowHeading + idxParam}*0.004*1.18,2)';
    // Sctr Pnesion
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 6)
        .formula = '=ROUND(BL${firstRowHeading + idxParam}*0.004*1.18*1.03,2)';
    // Sctr Pension Grati
    sheet
            .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 7)
            .formula =
        '=ROUND(BL${firstRowHeading + idxParam}*0.004*1.18*1.03*2,2)';

    // Ene Monto
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 8)
        .formula = 'BL${firstRowHeading + idxParam}';
    // Ene Essalud
    sheet
            .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 9)
            .formula =
        'BM${firstRowHeading + idxParam}+BN${firstRowHeading + idxParam}';
    // Ene Sctr Salud
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 10)
        .formula = 'BO${firstRowHeading + idxParam}';
    // Ene Vida ley
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 11)
        .formula = 'BQ${firstRowHeading + idxParam}';
    // Ene Sctr Pension
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 12)
        .formula = 'BR${firstRowHeading + idxParam}';
    // Ene Escolaridad
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 13)
        .formula = 'BL${firstRowHeading + idxParam}';

    // Feb Monto
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 14)
        .formula = 'BL${firstRowHeading + idxParam}';
    // Feb Essalud
    sheet
            .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 15)
            .formula =
        'BM${firstRowHeading + idxParam}+BN${firstRowHeading + idxParam}';
    // Feb Sctr Salud
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 16)
        .formula = 'BO${firstRowHeading + idxParam}';
    // Feb Vida ley
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 17)
        .formula = 'BQ${firstRowHeading + idxParam}';
    // Feb Sctr Pension
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 18)
        .formula = 'BR${firstRowHeading + idxParam}';

    // Mar Monto
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 19)
        .formula = 'BL${firstRowHeading + idxParam}';
    // Mar Essalud
    sheet
            .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 20)
            .formula =
        'BM${firstRowHeading + idxParam} + BN${firstRowHeading + idxParam}';
    // Mar Sctr Salud
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 21)
        .formula = 'BO${firstRowHeading + idxParam}';
    // Mar Vida ley
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 22)
        .formula = 'BQ${firstRowHeading + idxParam}';
    // Mar Sctr Pension
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 23)
        .formula = 'BR${firstRowHeading + idxParam}';

    // Abr Monto
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 24)
        .formula = 'BL${firstRowHeading + idxParam}';
    // Abr Essalud
    sheet
            .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 25)
            .formula =
        'BM${firstRowHeading + idxParam} + BN${firstRowHeading + idxParam}';
    // Abr Sctr Salud
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 26)
        .formula = 'BO${firstRowHeading + idxParam}';
    // Abr Vida ley
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 27)
        .formula = 'BQ${firstRowHeading + idxParam}';
    // Abr Sctr Pension
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 28)
        .formula = 'BR${firstRowHeading + idxParam}';

    // May Monto
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 29)
        .formula = 'BL${firstRowHeading + idxParam}';
    // May Essalud
    sheet
            .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 30)
            .formula =
        'BM${firstRowHeading + idxParam} + BN${firstRowHeading + idxParam}';
    // May Sctr Salud
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 31)
        .formula = 'BO${firstRowHeading + idxParam}';
    // May Vida ley
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 32)
        .formula = 'BQ${firstRowHeading + idxParam}';
    // May Sctr Pension
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 33)
        .formula = 'BR${firstRowHeading + idxParam}';
    // May CTS
    sheet
            .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 34)
            .formula =
        '(BL${firstRowHeading + idxParam} + (BL${firstRowHeading + idxParam}/6))/2';

    // Jun Monto
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 35)
        .formula = 'BL${firstRowHeading + idxParam}';
    // Jun Essalud
    sheet
            .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 36)
            .formula =
        'BM${firstRowHeading + idxParam} + BN${firstRowHeading + idxParam}';
    // Jun Sctr Salud
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 37)
        .formula = 'BO${firstRowHeading + idxParam}';
    // Jun Vida ley
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 38)
        .formula = 'BQ${firstRowHeading + idxParam}';
    // Jun Sctr Pension
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 39)
        .formula = 'BR${firstRowHeading + idxParam}';

    // Jul Monto
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 40)
        .formula = 'BL${firstRowHeading + idxParam}';
    // Jul Essalud
    sheet
            .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 41)
            .formula =
        'BM${firstRowHeading + idxParam} + (BN${firstRowHeading + idxParam} * 2)';
    // Jul Sctr Salud
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 42)
        .formula = 'BP${firstRowHeading + idxParam}';
    // Jul Vida ley
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 43)
        .formula = 'BQ${firstRowHeading + idxParam}';
    // Jul Sctr Pension
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 44)
        .formula = 'BS${firstRowHeading + idxParam}';
    // Jul Grati
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 45)
        .formula = 'BL${firstRowHeading + idxParam}';
    // Jul Boni
    sheet
            .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 46)
            .formula =
        '(BL${firstRowHeading + idxParam}*0.09)-BN${firstRowHeading + idxParam}';

    // Ago Monto
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 47)
        .formula = 'BL${firstRowHeading + idxParam}';
    // Ago Essalud
    sheet
            .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 48)
            .formula =
        'BM${firstRowHeading + idxParam}+BN${firstRowHeading + idxParam}';
    // Ago Sctr Salud
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 49)
        .formula = 'BO${firstRowHeading + idxParam}';
    // Ago Vida ley
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 50)
        .formula = 'BQ${firstRowHeading + idxParam}';
    // Ago Sctr Pension
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 51)
        .formula = 'BR${firstRowHeading + idxParam}';

    // Set Monto
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 52)
        .formula = 'BL${firstRowHeading + idxParam}';
    // Set Essalud
    sheet
            .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 53)
            .formula =
        'BM${firstRowHeading + idxParam}+BN${firstRowHeading + idxParam}';
    // Set Sctr Salud
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 54)
        .formula = 'BO${firstRowHeading + idxParam}';
    // Set Vida ley
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 55)
        .formula = 'BQ${firstRowHeading + idxParam}';
    // Set Sctr Pension
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 56)
        .formula = 'BR${firstRowHeading + idxParam}';

    // Oct Monto
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 57)
        .formula = 'BL${firstRowHeading + idxParam}';
    // Oct Essalud
    sheet
            .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 58)
            .formula =
        'BM${firstRowHeading + idxParam} + BN${firstRowHeading + idxParam}';
    // Oct Sctr Salud
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 59)
        .formula = 'BO${firstRowHeading + idxParam}';
    // Oct Vida ley
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 60)
        .formula = 'BQ${firstRowHeading + idxParam}';
    // Oct Sctr Pension
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 61)
        .formula = 'BR${firstRowHeading + idxParam}';

    // Nov Monto
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 62)
        .formula = 'BL${firstRowHeading + idxParam}';
    // Nov Essalud
    sheet
            .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 63)
            .formula =
        'BM${firstRowHeading + idxParam} + BN${firstRowHeading + idxParam}';
    // Nov Sctr Salud
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 64)
        .formula = 'BO${firstRowHeading + idxParam}';
    // Nov Vida ley
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 65)
        .formula = 'BQ${firstRowHeading + idxParam}';
    // Nov Sctr Pension
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 66)
        .formula = 'BR${firstRowHeading + idxParam}';
    // Nov CTS
    sheet
            .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 67)
            .formula =
        '(BL${firstRowHeading + idxParam} + (BL${firstRowHeading + idxParam}/6))/2';

    // Dic Monto
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 68)
        .formula = 'BL${firstRowHeading + idxParam}';
    // Dic Essalud
    sheet
            .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 69)
            .formula =
        'BM${firstRowHeading + idxParam} + (BN${firstRowHeading + idxParam} * 2)';
    // Dic Sctr Salud
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 70)
        .formula = 'BP${firstRowHeading + idxParam}';
    // Dic Vida ley
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 71)
        .formula = 'BQ${firstRowHeading + idxParam}';
    // Dic Sctr Pension
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 72)
        .formula = 'BS${firstRowHeading + idxParam}';
    // Dic Grati
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 73)
        .formula = 'BL${firstRowHeading + idxParam}';
    // Dic Boni
    sheet
            .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 74)
            .formula =
        '(BL${firstRowHeading + idxParam}*0.09) - (BN${firstRowHeading + idxParam})';

    final int rowClasificador = firstRowHeading - 1;
    final int rowIndex = firstRowHeading + idxParam;

    // Monto Total - 21.11.14
    sheet.getRangeByIndex(rowIndex, 139).formula =
        '=SUMIFS(\$BT$rowIndex:\$EH$rowIndex,\$BT\$$rowClasificador:\$EH\$$rowClasificador,\$EI\$$rowClasificador:\$EI\$$rowClasificador)';
    // Escolaridad - 21.19.13
    sheet.getRangeByIndex(rowIndex, 140).formula =
        '=SUMIFS(\$BT$rowIndex:\$EH$rowIndex,\$BT\$$rowClasificador:\$EH\$$rowClasificador,\$EJ\$$rowClasificador:\$EJ\$$rowClasificador)';
    // CTS - 21.19.21
    sheet.getRangeByIndex(rowIndex, 141).formula =
        '=SUMIFS(\$BT$rowIndex:\$EH$rowIndex,\$BT\$$rowClasificador:\$EH\$$rowClasificador,\$EK\$$rowClasificador:\$EK\$$rowClasificador)';
    // Gratificacion - 21.19.11
    sheet.getRangeByIndex(rowIndex, 142).formula =
        '=SUMIFS(\$BT$rowIndex:\$EH$rowIndex,\$BT\$$rowClasificador:\$EH\$$rowClasificador,\$EL\$$rowClasificador:\$EL\$$rowClasificador)';
    // Bonificacion - 21.19.399
    sheet.getRangeByIndex(rowIndex, 143).formula =
        '=SUMIFS(\$BT$rowIndex:\$EH$rowIndex,\$BT\$$rowClasificador:\$EH\$$rowClasificador,\$EM\$$rowClasificador:\$EM\$$rowClasificador)';
    // Essalud - 21.31.15
    sheet.getRangeByIndex(rowIndex, 144).formula =
        '=SUMIFS(\$BT$rowIndex:\$EH$rowIndex,\$BT\$$rowClasificador:\$EH\$$rowClasificador,\$EN\$$rowClasificador:\$EN\$$rowClasificador)';
    // Sctr Salud - 21.31.16
    sheet.getRangeByIndex(rowIndex, 145).formula =
        '=SUMIFS(\$BT$rowIndex:\$EH$rowIndex,\$BT\$$rowClasificador:\$EH\$$rowClasificador,\$EO\$$rowClasificador:\$EO\$$rowClasificador)';

    // Total
    sheet.getRangeByIndex(rowIndex, 146).formula =
        '=SUM(\$EI$rowIndex:\$EO$rowIndex)';

    // Vida Ley - 21.31.16
    sheet.getRangeByIndex(rowIndex, 147).formula =
        '=SUMIFS(\$BT$rowIndex:\$EH$rowIndex,\$BT\$$rowClasificador:\$EH\$$rowClasificador,\$EQ\$$rowClasificador)';

    // Sctr Pension - 21.31.16
    sheet.getRangeByIndex(rowIndex, 148).formula =
        '=SUMIFS(\$BT$rowIndex:\$EH$rowIndex,\$BT\$$rowClasificador:\$EH\$$rowClasificador,\$ER\$$rowClasificador)';

    // Total - 21.31.16
    sheet.getRangeByIndex(rowIndex, 149).formula =
        '=\$EO$rowIndex+\$EQ$rowIndex+\$ER$rowIndex';

    // Uniformes - 21.31.16
    sheet.getRangeByIndex(rowIndex, 150).formula = '=\$BF$rowIndex';

    // Vales - 21.21.11
    sheet.getRangeByIndex(rowIndex, 151).formula = '=\$BG$rowIndex';

    // Total - General
    sheet.getRangeByIndex(rowIndex, 152).formula =
        '=\$EP$rowIndex+\$ES$rowIndex+\$ET$rowIndex+\$EU$rowIndex';
  }

  sheet.getRangeByIndex(firstRowHeading, 64, lastRow, 152).numberFormat =
      '#,##0.00';
}
