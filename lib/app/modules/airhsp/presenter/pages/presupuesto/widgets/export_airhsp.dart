import 'package:rrhh_clean/app/modules/airhsp/domain/entities/airhsp_presupuesto_entity.dart';
import 'package:rrhh_clean/app/modules/airhsp/presenter/pages/presupuesto/widgets/columns_excel.dart';

import 'package:syncfusion_flutter_xlsio/xlsio.dart';
import 'package:rrhh_clean/core/uitls/universal_file/save_file_mobile.dart'
    if (dart.library.html) 'package:rrhh_clean/core/uitls/universal_file/save_file_web.dart';

import 'column_airhsp_base.dart';

Future<void> exportAirhspToExcel(List<AirhspPresupuestoEntity> params) async {
// Create a new Excel Document.
  final Workbook workbook = Workbook();

// Accessing sheet via index.
  final Worksheet sheet = workbook.worksheets[0];
  sheet.name = 'Reporte';
  sheet.enableSheetCalculations();

  final int firstRowHeading = 1;
  final int firstColHeading = 1;
  

  // Cabeceras Data
  final int firstRowData = firstRowHeading+1;
  final List<Object> row = List.from(params[0].toMap().keys.toList());
  sheet.importList(row, firstRowHeading,firstColHeading, false);

  // Data   
  for (int index = 0; index < params.length; index++) {
    sheet.importList(params[index].toMap().values.toList(), firstRowData + index,
        firstColHeading, false);
  } 

  calcularAirhspBaseSheet(sheet,params,firstRowData,firstColHeading,0,0);

// Save and dispose workbook.
  final List<int> bytes = workbook.saveAsStream();
  workbook.dispose();
  await FileSaveHelper.saveAndLaunchFile(bytes, 'AirhspPresupuesto.xlsx');
}

void calcularAirhspBaseSheet(Worksheet _sheet, List<AirhspPresupuestoEntity> _params, int _firstRowData,int _firstColHeading, int _fmesInicio, int _fmesFin) {
    final int colremPriRO =  ColumnAirhspBase.remPrinRO.colIndex + _firstColHeading;
    final int colremPriRDR =  ColumnAirhspBase.remPrinRDR.colIndex + _firstColHeading;
    final int colBasicoMensual =  ColumnAirhspBase.basicoMensual.colIndex + _firstColHeading;
    final int colEssaludMensual =  ColumnAirhspBase.essaludMensual.colIndex + _firstColHeading;  
    final int colBonificacionFamiliar =  ColumnAirhspBase.bonificacionFamiliar.colIndex + _firstColHeading;  
    final int colIncremento =  ColumnAirhspBase.incremento.colIndex + _firstColHeading;  
    final int colBasicoAnual =  ColumnAirhspBase.basicoAnual.colIndex + _firstColHeading;  
    final int colEssaludAnual =  ColumnAirhspBase.essaludAnual.colIndex + _firstColHeading;  
    final int colEscolaridad =  ColumnAirhspBase.escolaridad.colIndex + _firstColHeading;  
    final int colGratificacion =  ColumnAirhspBase.gratificacion.colIndex + _firstColHeading;  
    final int colBonificacionExtraordinaria =  ColumnAirhspBase.bonificacionExtraordinaria.colIndex + _firstColHeading;  
    final int colCtsAnual =  ColumnAirhspBase.ctsAnual.colIndex + _firstColHeading;  
    final int colTotalAnual =  ColumnAirhspBase.totalAnual.colIndex + _firstColHeading;  
  
  for (int index = 0; index < _params.length; index++) {
    final rowIndex = index + _firstRowData;

     //Column Basico Mensual
    _sheet.getRangeByIndex(rowIndex, colBasicoMensual).formula = '=${columnsExcel[colremPriRO]}$rowIndex + ${columnsExcel[colremPriRDR]}$rowIndex + ${columnsExcel[colBonificacionFamiliar]}$rowIndex + ${columnsExcel[colIncremento]}$rowIndex';

        //Column Essalud Mensual
    _sheet.getRangeByIndex(rowIndex, colEssaludMensual).formula = '=ROUND(${columnsExcel[colBasicoMensual]}$rowIndex*0.09,2)';
    
    //Column Basico Anual
    _sheet.getRangeByIndex(rowIndex, colBasicoAnual).formula = 
    '=(${columnsExcel[colBasicoMensual]}$rowIndex )*12';

    //Column Essalud Anual
    _sheet.getRangeByIndex(rowIndex, colEssaludAnual).formula = 
     '=${columnsExcel[colEssaludMensual]}$rowIndex*12';

    //Column Escolaridad
    _sheet.getRangeByIndex(rowIndex, colEscolaridad).formula = 
    '=${columnsExcel[colBasicoMensual]}$rowIndex';

    //Column Gratificacion
    _sheet.getRangeByIndex(rowIndex, colGratificacion).formula = 
    '=${columnsExcel[colBasicoMensual]}$rowIndex*2';

    //Column Bonificacion Extraordinaria
    _sheet.getRangeByIndex(rowIndex, colBonificacionExtraordinaria).formula = 
    '=ROUND(((${columnsExcel[colGratificacion]}$rowIndex*0.09)/2),2) + ROUND(((${columnsExcel[colGratificacion]}$rowIndex*0.09)/2),2) ';

    //Column CTS    
    _sheet.getRangeByIndex(rowIndex, colCtsAnual).formula = 
    '''=ROUND((((${columnsExcel[colBasicoMensual]}$rowIndex)+(${columnsExcel[colBasicoMensual]}$rowIndex/6) )/360)*180,2)+
    ROUND((((${columnsExcel[colBasicoMensual]}$rowIndex)+(${columnsExcel[colBasicoMensual]}$rowIndex/6) )/360)*180,2)''';

    //Column Total Anual  
    _sheet.getRangeByIndex(rowIndex, colTotalAnual).formula = 
    '=(${columnsExcel[colBasicoAnual]}$rowIndex + ${columnsExcel[colEssaludAnual]}$rowIndex + ${columnsExcel[colEscolaridad]}$rowIndex + ${columnsExcel[colGratificacion]}$rowIndex + ${columnsExcel[colBonificacionExtraordinaria]}$rowIndex + ${columnsExcel[colCtsAnual]}$rowIndex)';
  }
}
