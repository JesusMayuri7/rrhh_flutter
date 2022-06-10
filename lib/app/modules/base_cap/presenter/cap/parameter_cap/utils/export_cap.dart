import 'package:rrhh_clean/app/modules/base_cap/presenter/cap/parameter_cap/utils/base_cap_sheet.dart';

import '../../../../domain/entities/params_cap_calcular.dart';
import 'certifcado_cap_sheet.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';
import 'package:rrhh_clean/core/uitls/universal_file/save_file_mobile.dart'
    if (dart.library.html) 'package:rrhh_clean/core/uitls/universal_file/save_file_web.dart';

import 'presupuesto_cap_sheet.dart';

Future<void> generateExcel(ParamsCapCalcular params) async {
  print('compute calcular');
// Create a new Excel Document.
  final Workbook workbook = Workbook();

  // SHEET BASE
  final Worksheet sheetBase = workbook.worksheets[0];
  baseCapSheet(sheetBase, params);

  // SHEET CERTIFICADO
  int firstRowCeertificadoSheet = 5;
  certificadoCapSheet(
      workbook, firstRowCeertificadoSheet, params, sheetBase.getLastRow());
  presupuestoCapSheet(workbook, firstRowCeertificadoSheet, params, sheetBase);

// Save and dispose workbook.
  final List<int> bytes = workbook.saveAsStream();
  workbook.dispose();
  await FileSaveHelper.saveAndLaunchFile(bytes, 'BaseCapCalculado.xlsx');
}
