import 'package:rrhh_clean/app/modules/base_cap/domain/entities/params_cap_calcular.dart';
import 'package:rrhh_clean/app/modules/base_cap/presenter/cap/parameter_cap/utils/columnBaseCap.dart';
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
  final int firstColData = 8;
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

   //Monto Mensual
    sheet.getRangeByIndex(firstRowHeading + idxParam, ColumnBaseCapInt.montoMensual.columnIndex).formula =
    '''=${ColumnBaseCap.montoBasico.columnLetter}${firstRowHeading + idxParam}+
     ${ColumnBaseCap.incremento.columnLetter}${firstRowHeading + idxParam}''';

   //Monto Escala 2014-2015
    sheet.getRangeByIndex(firstRowHeading + idxParam, ColumnBaseCapInt.montoEscalaAnterior.columnIndex).formula =
    '''=IF(${ColumnBaseCap.porcentajeEscalaAnterior.columnLetter}${firstRowHeading + idxParam} =0,
    ${ColumnBaseCap.montoMensual.columnLetter}${firstRowHeading + idxParam},
    ${ColumnBaseCap.montoMensual.columnLetter}${firstRowHeading + idxParam}+
    (${ColumnBaseCap.montoMensual.columnLetter}${firstRowHeading + idxParam}*
    ${ColumnBaseCap.porcentajeEscalaAnterior.columnLetter}${firstRowHeading + idxParam}%))
     ''';

    //Monto Escala 2018-2019
    sheet.getRangeByIndex(firstRowHeading + idxParam, ColumnBaseCapInt.montoEscala.columnIndex).formula =
    '''=IF(${ColumnBaseCap.porcentajeEscala.columnLetter}${firstRowHeading + idxParam} =0,
    ${ColumnBaseCap.montoEscalaAnterior.columnLetter}${firstRowHeading + idxParam},
    ${ColumnBaseCap.montoEscalaAnterior.columnLetter}${firstRowHeading + idxParam}+
    (${ColumnBaseCap.montoEscalaAnterior.columnLetter}${firstRowHeading + idxParam}*
    ${ColumnBaseCap.porcentajeEscala.columnLetter}${firstRowHeading + idxParam}%))
     '''; 

    //Monto Escala 2020-2021
    sheet.getRangeByIndex(firstRowHeading + idxParam, ColumnBaseCapInt.montoEscalaNext.columnIndex).formula =
    '''=IF(${ColumnBaseCap.porcentajeEscalaNext.columnLetter}${firstRowHeading + idxParam} =0,
    ${ColumnBaseCap.montoEscala.columnLetter}${firstRowHeading + idxParam},
    ${ColumnBaseCap.montoEscala.columnLetter}${firstRowHeading + idxParam}+
    (${ColumnBaseCap.montoEscala.columnLetter}${firstRowHeading + idxParam}*
    ${ColumnBaseCap.porcentajeEscalaNext.columnLetter}${firstRowHeading + idxParam}%))
     '''; 

    sheet.getRangeByIndex(firstRowHeading + idxParam, ColumnBaseCapInt.montoMensual.columnIndex).formula =
    '''=${ColumnBaseCap.montoBasico.columnLetter}${firstRowHeading + idxParam}+
     ${ColumnBaseCap.incremento.columnLetter}${firstRowHeading + idxParam}''';


 //    Total Basico
    sheet.getRangeByIndex(firstRowHeading + idxParam, ColumnBaseCapInt.totalBasico.columnIndex).formula =
        '=${ColumnBaseCap.montoEscalaNext.columnLetter}${firstRowHeading + idxParam}+${ColumnBaseCap.asignacionFamiliar.columnLetter}${firstRowHeading + idxParam}';
 
    // Essalud
    sheet
            .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 1)
            .formula =
        //'=IF(BH${firstRowHeading + idxParam}=1,BL${firstRowHeading + idxParam}*0.0675,BL${firstRowHeading + idxParam}*0.09)';
        '''=IF(${ColumnBaseCap.epsAporta.columnLetter}${firstRowHeading + idxParam}=1,
          ${ColumnBaseCap.totalBasico.columnLetter}${firstRowHeading + idxParam}*0.0675,
          ${ColumnBaseCap.totalBasico.columnLetter}${firstRowHeading + idxParam}*0.09)''';

    // Eps Salud
    sheet
            .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 2)
            .formula =
        '=IF(${ColumnBaseCap.epsAporta.columnLetter}${firstRowHeading + idxParam}=1,${ColumnBaseCap.totalBasico.columnLetter}${firstRowHeading + idxParam}*0.0225,0)';


    // Sctr Salud
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 3)
        .formula = '=ROUND(${ColumnBaseCap.totalBasico.columnLetter}${firstRowHeading + idxParam}*0.005*1.18,2)';

    // Sctr Salud Grati
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 4)
        .formula = '=ROUND(${ColumnBaseCap.totalBasico.columnLetter}${firstRowHeading + idxParam}*0.005*1.18*2,2)';

    // Vida Ley
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 5)
        .formula = '=ROUND(${ColumnBaseCap.totalBasico.columnLetter}${firstRowHeading + idxParam}*0.004*1.18,2)';

    // Sctr Pnesion
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 6)
        .formula = '=ROUND(${ColumnBaseCap.totalBasico.columnLetter}${firstRowHeading + idxParam}*0.0035*1.18*1.03,2)';
    // Sctr Pension Grati
    sheet
            .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 7)
            .formula =
        '=ROUND(${ColumnBaseCap.totalBasico.columnLetter}${firstRowHeading + idxParam}*0.0035*1.18*1.03*2,2)';

    // Ene Monto
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 8)
        .formula = '${ColumnBaseCap.totalBasico.columnLetter}${firstRowHeading + idxParam}';

    // Ene Essalud
    sheet
            .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 9)
            .formula =
        'ROUND(${ColumnBaseCap.essalud.columnLetter}${firstRowHeading + idxParam}+${ColumnBaseCap.epsSalud.columnLetter}${firstRowHeading + idxParam},2)';
    // Ene Sctr Salud
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 10)
        .formula = '${ColumnBaseCap.sctrSalud.columnLetter}${firstRowHeading + idxParam}';
    // Ene Vida ley
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 11)
        .formula = '${ColumnBaseCap.vidaLey.columnLetter}${firstRowHeading + idxParam}';

        // Ene Sctr Pension
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 12)
        .formula = '${ColumnBaseCap.sctrPension.columnLetter}${firstRowHeading + idxParam}';
       
    // Ene Escolaridad
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 13)
        .formula = '${ColumnBaseCap.totalBasico.columnLetter}${firstRowHeading + idxParam}';

    // Feb Monto
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 14)
        .formula = '${ColumnBaseCap.totalBasico.columnLetter}${firstRowHeading + idxParam}';
    // Feb Essalud
    sheet
            .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 15)
            .formula =
        'ROUND(${ColumnBaseCap.essalud.columnLetter}${firstRowHeading + idxParam}+${ColumnBaseCap.epsSalud.columnLetter}${firstRowHeading + idxParam},2)';
    // Feb Sctr Salud
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 16)
        .formula = '${ColumnBaseCap.sctrSalud.columnLetter}${firstRowHeading + idxParam}';
    // Feb Vida ley
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 17)
        .formula = '${ColumnBaseCap.vidaLey.columnLetter}${firstRowHeading + idxParam}';
    // Feb Sctr Pension
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 18)
        .formula = '${ColumnBaseCap.sctrPension.columnLetter}${firstRowHeading + idxParam}';

    // Mar Monto
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 19)
        .formula = '${ColumnBaseCap.totalBasico.columnLetter}${firstRowHeading + idxParam}';

    // Mar Essalud
    sheet
            .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 20)
            .formula =
        'ROUND(${ColumnBaseCap.essalud.columnLetter}${firstRowHeading + idxParam} + ${ColumnBaseCap.epsSalud.columnLetter}${firstRowHeading + idxParam},2)';
    // Mar Sctr Salud
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 21)
        .formula = '${ColumnBaseCap.sctrSalud.columnLetter}${firstRowHeading + idxParam}';
    // Mar Vida ley
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 22)
        .formula = '${ColumnBaseCap.vidaLey.columnLetter}${firstRowHeading + idxParam}';
    // Mar Sctr Pension
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 23)
        .formula = '${ColumnBaseCap.sctrPension.columnLetter}${firstRowHeading + idxParam}';

    // Abr Monto
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 24)
        .formula = '${ColumnBaseCap.totalBasico.columnLetter}${firstRowHeading + idxParam}';
    // Abr Essalud
    sheet
            .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 25)
            .formula =
        'ROUND(${ColumnBaseCap.essalud.columnLetter}${firstRowHeading + idxParam} + ${ColumnBaseCap.epsSalud.columnLetter}${firstRowHeading + idxParam},2)';
    // Abr Sctr Salud
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 26)
        .formula = '${ColumnBaseCap.sctrSalud.columnLetter}${firstRowHeading + idxParam}';
    // Abr Vida ley
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 27)
        .formula = '${ColumnBaseCap.vidaLey.columnLetter}${firstRowHeading + idxParam}';
    // Abr Sctr Pension
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 28)
        .formula = '${ColumnBaseCap.sctrPension.columnLetter}${firstRowHeading + idxParam}';

    // May Monto
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 29)
        .formula = '${ColumnBaseCap.totalBasico.columnLetter}${firstRowHeading + idxParam}';
    // May Essalud
    sheet
            .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 30)
            .formula =
        'ROUND(${ColumnBaseCap.essalud.columnLetter}${firstRowHeading + idxParam} + ${ColumnBaseCap.epsSalud.columnLetter}${firstRowHeading + idxParam},2)';
    // May Sctr Salud
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 31)
        .formula = '${ColumnBaseCap.sctrSalud.columnLetter}${firstRowHeading + idxParam}';
    // May Vida ley
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 32)
        .formula = '${ColumnBaseCap.vidaLey.columnLetter}${firstRowHeading + idxParam}';
    // May Sctr Pension
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 33)
        .formula = '${ColumnBaseCap.sctrPension.columnLetter}${firstRowHeading + idxParam}';

    // May CTS
    sheet
            .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 34)
            .formula =
        'ROUND(((${ColumnBaseCap.totalBasico.columnLetter}${firstRowHeading + idxParam} + (${ColumnBaseCap.totalBasico.columnLetter}${firstRowHeading + idxParam}/6))/360)*180,2)';

    // Jun Monto
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 35)
        .formula = '${ColumnBaseCap.totalBasico.columnLetter}${firstRowHeading + idxParam}';
    // Jun Essalud
    sheet
            .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 36)
            .formula =
        'ROUND(${ColumnBaseCap.essalud.columnLetter}${firstRowHeading + idxParam} + ${ColumnBaseCap.epsSalud.columnLetter}${firstRowHeading + idxParam},2)';
    // Jun Sctr Salud
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 37)
        .formula = '${ColumnBaseCap.sctrSalud.columnLetter}${firstRowHeading + idxParam}';
    // Jun Vida ley
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 38)
        .formula = '${ColumnBaseCap.vidaLey.columnLetter}${firstRowHeading + idxParam}';
    // Jun Sctr Pension
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 39)
        .formula = '${ColumnBaseCap.sctrPension.columnLetter}${firstRowHeading + idxParam}';

    // Jul Monto
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 40)
        .formula = '${ColumnBaseCap.totalBasico.columnLetter}${firstRowHeading + idxParam}';
    // Jul Essalud
    sheet
            .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 41)
            .formula =
        'ROUND(IF(${ColumnBaseCap.epsAporta.columnLetter}${firstRowHeading + idxParam}=1,${ColumnBaseCap.essalud.columnLetter}${firstRowHeading + idxParam} +(${ColumnBaseCap.epsSalud.columnLetter}${firstRowHeading + idxParam}*2),${ColumnBaseCap.essalud.columnLetter}${firstRowHeading + idxParam} + ${ColumnBaseCap.epsSalud.columnLetter}${firstRowHeading + idxParam} ),2)';
    
    // Jul Sctr Salud
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 42)
        .formula = '${ColumnBaseCap.sctrSaludGrati.columnLetter}${firstRowHeading + idxParam}';
    // Jul Vida ley
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 43)
        .formula = '${ColumnBaseCap.vidaLey.columnLetter}${firstRowHeading + idxParam}';    
    // Jul Sctr Pension
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 44)
        .formula = '${ColumnBaseCap.sctrPensionGrati.columnLetter}${firstRowHeading + idxParam}';
    // Jul Grati
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 45)
        .formula = '${ColumnBaseCap.totalBasico.columnLetter}${firstRowHeading + idxParam}';
    // Jul Boni
    sheet
            .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 46)
            .formula =        
        'ROUND(IF(${ColumnBaseCap.epsAporta.columnLetter}${firstRowHeading + idxParam}=1,${ColumnBaseCap.essalud.columnLetter}${firstRowHeading + idxParam},${ColumnBaseCap.essalud.columnLetter}${firstRowHeading + idxParam} + ${ColumnBaseCap.epsSalud.columnLetter}${firstRowHeading + idxParam}),2)';
    // Ago Monto
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 47)
        .formula = '${ColumnBaseCap.totalBasico.columnLetter}${firstRowHeading + idxParam}';
    // Ago Essalud
    sheet
            .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 48)
            .formula =
           'ROUND(${ColumnBaseCap.essalud.columnLetter}${firstRowHeading + idxParam} + ${ColumnBaseCap.epsSalud.columnLetter}${firstRowHeading + idxParam},2)';
    // Ago Sctr Salud
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 49)
        .formula = '${ColumnBaseCap.sctrSalud.columnLetter}${firstRowHeading + idxParam}';
    // Ago Vida ley
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 50)
        .formula = '${ColumnBaseCap.vidaLey.columnLetter}${firstRowHeading + idxParam}';
    // Ago Sctr Pension
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 51)
        .formula = '${ColumnBaseCap.sctrPension.columnLetter}${firstRowHeading + idxParam}';

    // Set Monto
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 52)
        .formula = '${ColumnBaseCap.totalBasico.columnLetter}${firstRowHeading + idxParam}';
    // Set Essalud
    sheet
            .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 53)
            .formula =
           'ROUND(${ColumnBaseCap.essalud.columnLetter}${firstRowHeading + idxParam} + ${ColumnBaseCap.epsSalud.columnLetter}${firstRowHeading + idxParam},2)';
    // Set Sctr Salud
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 54)
        .formula = '${ColumnBaseCap.sctrSalud.columnLetter}${firstRowHeading + idxParam}';
    // Set Vida ley
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 55)
        .formula = '${ColumnBaseCap.vidaLey.columnLetter}${firstRowHeading + idxParam}';
    // Set Sctr Pension
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 56)
        .formula = '${ColumnBaseCap.sctrPension.columnLetter}${firstRowHeading + idxParam}';

    // Oct Monto
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 57)
        .formula = '${ColumnBaseCap.totalBasico.columnLetter}${firstRowHeading + idxParam}';
    // Oct Essalud
    sheet
            .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 58)
            .formula =
        'ROUND(${ColumnBaseCap.essalud.columnLetter}${firstRowHeading + idxParam} + ${ColumnBaseCap.epsSalud.columnLetter}${firstRowHeading + idxParam},2)';
    // Oct Sctr Salud
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 59)
        .formula = '${ColumnBaseCap.sctrSalud.columnLetter}${firstRowHeading + idxParam}';
    // Oct Vida ley
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 60)
        .formula = '${ColumnBaseCap.vidaLey.columnLetter}${firstRowHeading + idxParam}';
    // Oct Sctr Pension
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 61)
        .formula = '${ColumnBaseCap.sctrPension.columnLetter}${firstRowHeading + idxParam}';

    // Nov Monto
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 62)
        .formula = '${ColumnBaseCap.totalBasico.columnLetter}${firstRowHeading + idxParam}';
    // Nov Essalud
    sheet
            .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 63)
            .formula =
        'ROUND(${ColumnBaseCap.essalud.columnLetter}${firstRowHeading + idxParam} + ${ColumnBaseCap.epsSalud.columnLetter}${firstRowHeading + idxParam},2)';
    // Nov Sctr Salud
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 64)
        .formula = '${ColumnBaseCap.sctrSalud.columnLetter}${firstRowHeading + idxParam}';
    // Nov Vida ley
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 65)
        .formula = '${ColumnBaseCap.vidaLey.columnLetter}${firstRowHeading + idxParam}';
    // Nov Sctr Pension
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 66)
        .formula = '${ColumnBaseCap.sctrPension.columnLetter}${firstRowHeading + idxParam}';
    // Nov CTS
    sheet
            .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 67)
            .formula =
        'ROUND(((${ColumnBaseCap.totalBasico.columnLetter}${firstRowHeading + idxParam} + (${ColumnBaseCap.totalBasico.columnLetter}${firstRowHeading + idxParam}/6))/360)*180,2)';
    // Dic Monto
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 68)
        .formula = '${ColumnBaseCap.totalBasico.columnLetter}${firstRowHeading + idxParam}';

    // Dic Essalud
    sheet
            .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 69)
            .formula =
         'ROUND(IF(${ColumnBaseCap.epsAporta.columnLetter}${firstRowHeading + idxParam}=1,${ColumnBaseCap.essalud.columnLetter}${firstRowHeading + idxParam} +(${ColumnBaseCap.epsSalud.columnLetter}${firstRowHeading + idxParam}*2),${ColumnBaseCap.essalud.columnLetter}${firstRowHeading + idxParam} + ${ColumnBaseCap.epsSalud.columnLetter}${firstRowHeading + idxParam} ),2)';

    // Dic Sctr Salud
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 70)
        .formula = '${ColumnBaseCap.sctrSaludGrati.columnLetter}${firstRowHeading + idxParam}';

    // Dic Vida ley
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 71)
        .formula = '${ColumnBaseCap.vidaLey.columnLetter}${firstRowHeading + idxParam}';

    // Dic Sctr Pension
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 72)
        .formula = '${ColumnBaseCap.sctrPensionGrati.columnLetter}${firstRowHeading + idxParam}';

    // Dic Grati
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 73)
        .formula = '${ColumnBaseCap.totalBasico.columnLetter}${firstRowHeading + idxParam}';
    // Dic Boni
    sheet
        .getRangeByIndex(firstRowHeading + idxParam, firstColProcess + 74)
            .formula =
        'ROUND(IF(${ColumnBaseCap.epsAporta.columnLetter}${firstRowHeading + idxParam}=1,${ColumnBaseCap.essalud.columnLetter}${firstRowHeading + idxParam},${ColumnBaseCap.essalud.columnLetter}${firstRowHeading + idxParam} + ${ColumnBaseCap.epsSalud.columnLetter}${firstRowHeading + idxParam}),2)';

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
        '=SUM(\$EI$rowIndex:\$EN$rowIndex)';

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
    sheet.getRangeByIndex(rowIndex, ColumnBaseCapInt.uniforme.columnIndex).formula = '=\$${ColumnBaseCap.uniforme.columnLetter}$rowIndex';

    // Vales - 21.21.11
    sheet.getRangeByIndex(rowIndex, ColumnBaseCapInt.vale.columnIndex).formula = '=\$${ColumnBaseCap.vale.columnLetter}$rowIndex';

    // Total - General
    sheet.getRangeByIndex(rowIndex, ColumnBaseCapInt.totalG.columnIndex).formula =
        '=\$EP$rowIndex+\$ES$rowIndex';
      
  }

  sheet.getRangeByIndex(firstRowHeading, 64, lastRow, 152).numberFormat =
      '#,##0.00';
}
