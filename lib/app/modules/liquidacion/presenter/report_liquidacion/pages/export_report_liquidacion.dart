import 'package:rrhh_clean/app/modules/liquidacion/domain/entities/liquidacion_report_entity.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';
import 'package:rrhh_clean/core/uitls/universal_file/save_file_mobile.dart'
    if (dart.library.html) 'package:rrhh_clean/core/uitls/universal_file/save_file_web.dart';

Future<void> exportReportToExcel(List<LiquidacionReportEntity> params) async {
// Create a new Excel Document.
  final Workbook workbook = Workbook();

// Accessing sheet via index.
  final Worksheet sheet = workbook.worksheets[0];
  sheet.name = 'Reporte';
  sheet.enableSheetCalculations();

  final int firstRowHeading = 3;

  // Cabeceras Data
  final int firstColData = 3;
  final List<Object> row = List.from(params[0].toMap().keys.toList());
  sheet.importList(row, firstRowHeading - 1, firstColData, false);

  // Data
  int rowIndex = 3;
  for (int index = 0; index < params.length; index++) {
    sheet.importList(
        params[index].toMap().values.toList(), rowIndex, firstColData, false);
    rowIndex++;
  }

// Save and dispose workbook.
  final List<int> bytes = workbook.saveAsStream();
  workbook.dispose();
  await FileSaveHelper.saveAndLaunchFile(bytes, 'ReporteSiaf.xlsx');
}
