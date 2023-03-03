import 'package:syncfusion_flutter_xlsio/xlsio.dart';

import 'package:rrhh_clean/core/uitls/universal_file/save_file_mobile.dart'
    if (dart.library.html) 'package:rrhh_clean/core/uitls/universal_file/save_file_web.dart';

import 'certificado/certificado_prac_sheet.dart';
import 'column_prac_base_header.dart';
import 'column_prac_base_table.dart';
import 'export_prac_use_case.dart';

Future<void> generateExcelPrac(ParamsPracCalcular params) async {
  // Create a new Excel Document.
  final Workbook workbook = Workbook();

// Accessing sheet via index.
  final Worksheet sheet = workbook.worksheets[0];
  sheet.name = 'BASE';
  sheet.enableSheetCalculations();

  String fmesInicio =
      '=\$${ParameterPracBaseHeader.mesInicioValue.columnLetter}\$${ParameterPracBaseHeader.rowUno.columnLetter}';
  String fmesFin =
      '=\$${ParameterPracBaseHeader.mesFinValue.columnLetter}\$${ParameterPracBaseHeader.rowDos.columnLetter}';

  parameterBasePracSheet(sheet, params);

  int firstRowHeading = 5;

  final List<Object> heading =
      List.from(params.lista[0].toMapHeaderExport().keys.toList());
  sheet.importList(heading, firstRowHeading, 1, false);

  for (int index = 0; index < params.lista.length; index++) {
    final List<Object> row =
        List.from(params.lista[index].toMapTableExport().values.toList());

    sheet.importList(row, firstRowHeading + index + 1, 1, false);
  }
  calcularPracBaseSheet(sheet, firstRowHeading, fmesInicio, fmesFin);
  sheetPracCertificado(workbook,firstRowHeading,params,sheet.getLastRow(),params.lista);

  final List<int> bytes = workbook.saveAsStream();
  workbook.dispose();
  await FileSaveHelper.saveAndLaunchFile(bytes, 'BasePracCalculado.xlsx');
}

void parameterBasePracSheet(Worksheet _sheet, ParamsPracCalcular _params) {
  //Meses
  _sheet
      .getRangeByName(ParameterPracBaseHeader.mesInicioTitle.columnLetter +
          ParameterPracBaseHeader.rowUno.columnLetter)
      .setText('Mes Inicio');
  _sheet
      .getRangeByName(ParameterPracBaseHeader.mesFinTitle.columnLetter +
          ParameterPracBaseHeader.rowDos.columnLetter)
      .setText('Mes Fin');
  _sheet
      .getRangeByName(ParameterPracBaseHeader.mesInicioValue.columnLetter +
          ParameterPracBaseHeader.rowUno.columnLetter)
      .setNumber(_params.mesInicio + 1);
  _sheet
      .getRangeByName(ParameterPracBaseHeader.mesFinValue.columnLetter +
          ParameterPracBaseHeader.rowDos.columnLetter)
      .setNumber(_params.mesFin + 1);

  // Cantidad de medias subvenciones
  //Meses
  _sheet
      .getRangeByName(ParameterPracBaseHeader.ocupadoTitle.columnLetter +
          ParameterPracBaseHeader.rowUno.columnLetter)
      .setText('Ocupado');
  _sheet
      .getRangeByName(ParameterPracBaseHeader.vacanteTitle.columnLetter +
          ParameterPracBaseHeader.rowDos.columnLetter)
      .setText('Vacante');
  _sheet
      .getRangeByName(ParameterPracBaseHeader.ocupadoValue.columnLetter +
          ParameterPracBaseHeader.rowUno.columnLetter)
      .setNumber(0);
  _sheet
      .getRangeByName(ParameterPracBaseHeader.vacanteValue.columnLetter +
          ParameterPracBaseHeader.rowDos.columnLetter)
      .setNumber(0);

       _sheet
      .getRangeByName(ParameterPracBaseHeader.clasificadorSubvencion.columnLetter +
          ParameterPracBaseHeader.rowCuatro.columnLetter)
      .setText('23.27.52');

      _sheet
      .getRangeByName(ParameterPracBaseHeader.clasificadorMediaSubvencion.columnLetter +
          ParameterPracBaseHeader.rowCuatro.columnLetter)
      .setText('23.27.510');

  // Sctr Pension
  /* sheet
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
      .getRangeByName(ColumnBaseHeader.clasificadorEssaludValue.columnLetter +
          '$_rowCuatro')
      .setText('23.28.12');
  sheet
      .getRangeByName(ColumnBaseHeader.clasificadorAguinaldoValue.columnLetter +
          '$_rowCuatro')
      .setText('23.28.14');
  sheet
      .getRangeByName(ColumnBaseHeader.clasificadorSctrSaludValue.columnLetter +
          '$_rowCuatro')
      .setText('23.26.34'); */
}

void calcularPracBaseSheet(Worksheet _sheet, int _firstRowHeading,
    String _fmesInicio, String _fmesFin) {
  for (int rowIndex = _firstRowHeading + 1;
      rowIndex <= _sheet.getLastRow();
      rowIndex++) {
    _sheet
        .getRangeByName(
            ColumnPracBaseTable.mesInicio.columnLetter + '$rowIndex')
        .formula = _fmesInicio; // MesInicio

    _sheet
        .getRangeByName(ColumnPracBaseTable.mesFin.columnLetter + '$rowIndex')
        .formula = _fmesFin;

    _sheet
            .getRangeByName(ColumnPracBaseTable.subvencionMensual.columnLetter +
                '$rowIndex')
            .formula =
        ColumnPracBaseTable.montoBase.columnLetter + '$rowIndex'; // MesFin

    _sheet
            .getRangeByName(
                ColumnPracBaseTable.mediaSubvencionMensual.columnLetter +
                    '$rowIndex')
            .formula =
        ColumnPracBaseTable.subvencionMensual.columnLetter + '$rowIndex/2';

    _sheet
            .getRangeByName(
                ColumnPracBaseTable.subvencionAnual.columnLetter + '$rowIndex')
            .formula =
        '''=${ColumnPracBaseTable.subvencionMensual.columnLetter}$rowIndex*IF(${ColumnPracBaseTable.mesInicio.columnLetter}$rowIndex>0,
        ((${ColumnPracBaseTable.mesFin.columnLetter}$rowIndex-${ColumnPracBaseTable.mesInicio.columnLetter}$rowIndex)+1),0)''';

    _sheet
        .getRangeByName(
            ColumnPracBaseTable.cantidadMediaSubvencion.columnLetter +
                '$rowIndex')
        .setNumber(2);

    _sheet
            .getRangeByName(
                ColumnPracBaseTable.mediaCalculo.columnLetter + '$rowIndex')
            .formula =
        '''=${ColumnPracBaseTable.mediaSubvencionMensual.columnLetter}$rowIndex*${ColumnPracBaseTable.cantidadMediaSubvencion.columnLetter}$rowIndex''';

 _sheet
            .getRangeByName(ColumnPracBaseTable
                    .total.columnLetter +
                '$rowIndex')
            .formula =
        '''=${ColumnPracBaseTable.mediaSubvencionAnual.columnLetter}$rowIndex + ${ColumnPracBaseTable.subvencionAnual.columnLetter}$rowIndex'''; 
 _sheet
            .getRangeByName(ColumnPracBaseTable
                    .mediaSubvencionAnual.columnLetter +
                '$rowIndex')
            .formula =
        '''=${ColumnPracBaseTable.mediaCalculo.columnLetter}$rowIndex + ${ColumnPracBaseTable.pagoMediaSubvencion.columnLetter}$rowIndex'''; 
      }
}
