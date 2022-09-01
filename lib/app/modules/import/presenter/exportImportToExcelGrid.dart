import 'package:syncfusion_flutter_xlsio/xlsio.dart';
import 'package:rrhh_clean/core/uitls/universal_file/save_file_mobile.dart'
    if (dart.library.html) 'package:rrhh_clean/core/uitls/universal_file/save_file_web.dart';

Future<void> exportImporttoExcel(
    List<String> head, List<List<Object>> params) async {
  print(params[0]);

  final Workbook workbook = Workbook();

// Accessing sheet via index.
  final Worksheet sheet = workbook.worksheets[0];
  sheet.name = 'Reporte';
  sheet.enableSheetCalculations();

  final int firstRowHeading = 2;

  // Cabeceras Data
  final int firstColData = 1;
  //final List<Object> row = List.from(params[0].toMap().keys.toList());
  //final List<Object> row = List.from(params[0].keys.toList());
  sheet.importList(head, firstRowHeading - 1, firstColData, false);

  // Data
  int rowNext = 2;
  for (int index = 0; index < params.length; index++) {
    sheet.importList(params[index], rowNext + index, firstColData, false);
  }

// Save and dispose workbook.
  final List<int> bytes = workbook.saveAsStream();
  workbook.dispose();
  await FileSaveHelper.saveAndLaunchFile(bytes, 'Import.xlsx');
}
