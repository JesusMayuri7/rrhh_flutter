import 'package:rrhh_clean/app/modules/liquidacion/domain/entities/liquidacion_detalle._entity.dart';
import 'package:rrhh_clean/app/modules/liquidacion/domain/entities/liquidacion_entity.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';
import 'package:rrhh_clean/core/uitls/universal_file/save_file_mobile.dart'
    if (dart.library.html) 'package:rrhh_clean/core/uitls/universal_file/save_file_web.dart';

Future<void> exportLiquidaciontoExcel(List<LiquidacionEntity> params) async {
// Create a new Excel Document.
  final Workbook workbook = Workbook();

// Accessing sheet via index.
  final Worksheet sheet = workbook.worksheets[0];
  sheet.name = 'Reporte';
  sheet.enableSheetCalculations();

  final int firstRowHeading = 3;
  int colDetalle = 23;

  // Cabeceras Data
  final int firstColData = 3;
  final List<Object> row = List.from(params[0].toMap().keys.toList());
  sheet.importList(row, firstRowHeading - 1, firstColData, false);
  sheet
      .getRangeByIndex(firstRowHeading - 1, colDetalle)
      .setText('Clasificador');
  sheet
      .getRangeByIndex(firstRowHeading - 1, colDetalle + 1)
      .setText('Certificado');
  sheet
      .getRangeByIndex(firstRowHeading - 1, colDetalle + 2)
      .setText('Liquidacion');
  sheet
      .getRangeByIndex(firstRowHeading - 1, colDetalle + 3)
      .setText('Devengado');
  sheet
      .getRangeByIndex(firstRowHeading - 1, colDetalle + 4)
      .setText('Devolucion');

  // Data
  int rowNext = 3;
  for (int index = 0; index < params.length; index++) {
    List<LiquidacionDetalleEntity> liquidacionDetalle =
        List.from(params[index].liquidacionDetalle);

    for (int item = 0; item < liquidacionDetalle.length; item++)
      sheet.importList(params[index].toMap().values.toList(), rowNext + item,
          firstColData, false);

    for (int item = 0; item < liquidacionDetalle.length; item++) {
      //sheet.importList(dataRepeat, rowNext, firstColData, false);
      sheet
          .getRangeByIndex(rowNext + item, colDetalle + 0)
          .setText(liquidacionDetalle[item].clasificador);
      sheet
          .getRangeByIndex(rowNext + item, colDetalle + 1)
          .setNumber(liquidacionDetalle[item].montoCertificado);
      sheet
          .getRangeByIndex(rowNext + item, colDetalle + 2)
          .setNumber(liquidacionDetalle[item].montoLiquidacion);
      sheet
          .getRangeByIndex(rowNext + item, colDetalle + 3)
          .setNumber(liquidacionDetalle[item].montoDevengado);
      sheet
          .getRangeByIndex(rowNext + item, colDetalle + 4)
          .setNumber(liquidacionDetalle[item].montoDevolucion);
      //sheet.importList(liquidacionDetalle[item].toMap().values.toList(), rowNext + item, 17, false);
    }
    rowNext = (rowNext + liquidacionDetalle.length);
  }

// Save and dispose workbook.
  final List<int> bytes = workbook.saveAsStream();
  workbook.dispose();
  await FileSaveHelper.saveAndLaunchFile(bytes, 'Liquidaciones.xlsx');
}
