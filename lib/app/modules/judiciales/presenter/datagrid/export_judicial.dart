import 'package:rrhh_clean/app/modules/judiciales/domain/judicial_detail_entity.dart';
import 'package:rrhh_clean/app/modules/judiciales/domain/judicial_entity.dart';

import 'package:syncfusion_flutter_xlsio/xlsio.dart';
import 'package:rrhh_clean/core/uitls/universal_file/save_file_mobile.dart'
    if (dart.library.html) 'package:rrhh_clean/core/uitls/universal_file/save_file_web.dart';

Future<void> exporJudicialToExcel(List<JudicialEntity> params) async {
// Create a new Excel Document.
  final Workbook workbook = Workbook();

// Accessing sheet via index.
  final Worksheet sheet = workbook.worksheets[0];
  sheet.name = 'Reporte';
  sheet.enableSheetCalculations();

  final int firstRowHeading = 3;
  int colDetalle = 29;

  // Cabeceras Data
  final int firstColData = 3;
  final List<Object> row = List.from(params[0].toMap().keys.toList());
  sheet.importList(row, firstRowHeading - 1, firstColData, false);
  sheet
      .getRangeByIndex(firstRowHeading - 1, colDetalle)
      .setText('Detalle');
  sheet
      .getRangeByIndex(firstRowHeading - 1, colDetalle + 1)
      .setText('Exp. PVN');
  sheet
      .getRangeByIndex(firstRowHeading - 1, colDetalle + 2)
      .setText('Fec. PVN');
  sheet
      .getRangeByIndex(firstRowHeading - 1, colDetalle + 3)
      .setText('N° Documento');

  // Data
  int rowNext = 3;
  for (int index = 0; index < params.length; index++) {
    List<JudicialDetailEntity> judicialDetailEntity =
        List.from(params[index].judicialDetailEntity);

    for (int item = 0; item < judicialDetailEntity.length; item++)
      sheet.importList(params[index].toMap().values.toList(), rowNext + item,
          firstColData, false);

    for (int item = 0; item < judicialDetailEntity.length; item++) {
      //sheet.importList(dataRepeat, rowNext, firstColData, false);
      sheet
          .getRangeByIndex(rowNext + item, colDetalle + 0)
          .setText(judicialDetailEntity[item].detalle);
      sheet
          .getRangeByIndex(rowNext + item, colDetalle + 1)
          .setText(judicialDetailEntity[item].expedientePvn);
      sheet
          .getRangeByIndex(rowNext + item, colDetalle + 2)
          .setText(judicialDetailEntity[item].fechaExpedientePvn);
      sheet
          .getRangeByIndex(rowNext + item, colDetalle + 3)
          .setText(judicialDetailEntity[item].nroDocumento);

      //sheet.importList.judicialDetailEntity[item].toMap().values.toList(), rowNext + item, 17, false);
    }
    rowNext = (rowNext + judicialDetailEntity.length);
  }

// Save and dispose workbook.
  final List<int> bytes = workbook.saveAsStream();
  workbook.dispose();
  await FileSaveHelper.saveAndLaunchFile(bytes, 'Judiciales.xlsx');
}
