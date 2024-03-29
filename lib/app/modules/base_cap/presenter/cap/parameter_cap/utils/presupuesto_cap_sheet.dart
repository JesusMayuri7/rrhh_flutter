import 'package:collection/collection.dart';
import 'package:rrhh_clean/app/modules/base_cap/domain/entities/params_cap_calcular.dart';
import 'package:rrhh_clean/core/domain/entities/presupuesto_entity.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';

import 'columnBaseCap.dart';
import 'functions_custom_cap.dart';

void presupuestoCapSheet(Workbook workbook, int firstRowHeading,
    ParamsCapCalcular params, Worksheet sheetBase) {
  final Worksheet presupuestoSheet =
      workbook.worksheets.addWithName('PRESUPUESTO');

  //HOJA DE CALCULO 
  presupuestoSheet.getRangeByName('Z2').setText('BASE');
  final String nombreHoja = 'Z\$2';

  List<Object> headerPresupuesto = [
    'Año',
    'Fuente',
    'Producto',
    'Meta',
    'Clasificador',
    'Subgenerica',
    'Clasificador Ext',
    'PIA',
    'PIM',
    'Certificado',
    'Devengado',
    'Enero',
    'Febrero',
    'Marzo',
    'Abril',
    'Mayo',
    'Junio',
    'Julio',
    'Agosto',
    'Setiembre',
    'Octubre',
    'Noviembre',
    'Diciembre',
    'TCantidad',
    'TProyeccion',
    'OCantidad',
    'OProyeccion',
    'VCantidad',
    'VProyeccion',
    'Cantidad',
    'Proyeccion',
    'TotalProyeccion',
    'Saldo',
  ];
  presupuestoSheet.importList(headerPresupuesto, firstRowHeading, 1, false);

  _fuenteMetaOfBase(sheetBase, params.pimCap);

  for (int index = 0; index < params.pimCap.length; index++) {
    final List<Object> row =
        List.from(params.pimCap[index].toMap().values.toList());

    presupuestoSheet.importList(row, firstRowHeading + index + 1, 1, false);
  }

  final int _rowSum = presupuestoSheet.getLastRow();

  presupuestoSheet.getRangeByIndex(_rowSum + 1, 6).formula =
      'SUM(F6:F$_rowSum)';
  presupuestoSheet.getRangeByIndex(_rowSum + 1, 7).formula =
      'SUM(G6:G$_rowSum)';
  presupuestoSheet.getRangeByIndex(_rowSum + 1, 8).formula =
      'SUM(H6:H$_rowSum)';
  presupuestoSheet.getRangeByIndex(_rowSum + 1, 9).formula =
      'SUM(I6:I$_rowSum)';
  presupuestoSheet.getRangeByIndex(_rowSum + 1, 10).formula =
      'SUM(J6:J$_rowSum)';
  presupuestoSheet.getRangeByIndex(_rowSum + 1, 11).formula =
      'SUM(K6:K$_rowSum)';
  presupuestoSheet.getRangeByIndex(_rowSum + 1, 12).formula =
      'SUM(L6:L$_rowSum)';
  presupuestoSheet.getRangeByIndex(_rowSum + 1, 13).formula =
      'SUM(M6:M$_rowSum)';
  presupuestoSheet.getRangeByIndex(_rowSum + 1, 14).formula =
      'SUM(N6:N$_rowSum)';
  presupuestoSheet.getRangeByIndex(_rowSum + 1, 15).formula =
      'SUM(O6:O$_rowSum)';
  presupuestoSheet.getRangeByIndex(_rowSum + 1, 16).formula =
      'SUM(P6:P$_rowSum)';
  presupuestoSheet.getRangeByIndex(_rowSum + 1, 17).formula =
      'SUM(Q6:Q$_rowSum)';
  presupuestoSheet.getRangeByIndex(_rowSum + 1, 18).formula =
      'SUM(R6:R$_rowSum)';
  presupuestoSheet.getRangeByIndex(_rowSum + 1, 19).formula =
      'SUM(S6:S$_rowSum)';
  presupuestoSheet.getRangeByIndex(_rowSum + 1, 20).formula =
      'SUM(T6:T$_rowSum)';
  presupuestoSheet.getRangeByIndex(_rowSum + 1, 21).formula =
      'SUM(U6:U$_rowSum)';

  _proyeccion(4, 24, presupuestoSheet, presupuestoSheet.getLastRow() - 1,sheetBase.getLastRow(),nombreHoja);

  presupuestoSheet.getRangeByIndex(_rowSum + 1, 22).formula =
      'SUM(V6:V$_rowSum)';
  presupuestoSheet.getRangeByIndex(_rowSum + 1, 23).formula =
      'SUM(W6:W$_rowSum)';
  presupuestoSheet.getRangeByIndex(_rowSum + 1, 24).formula =
      'SUM(X6:X$_rowSum)';
  presupuestoSheet.getRangeByIndex(_rowSum + 1, 25).formula =
      'SUM(Y6:Y$_rowSum)';
  presupuestoSheet.getRangeByIndex(_rowSum + 1, 26).formula =
      'SUM(Z6:Z$_rowSum)';
  presupuestoSheet.getRangeByIndex(_rowSum + 1, 27).formula =
      'SUM(AA6:AA$_rowSum)';
  presupuestoSheet.getRangeByIndex(_rowSum + 1, 28).formula =
      'SUM(AB6:AB$_rowSum)';
  presupuestoSheet.getRangeByIndex(_rowSum + 1, 29).formula =
      'SUM(AC6:AC$_rowSum)';
  presupuestoSheet.getRangeByIndex(_rowSum + 1, 30).formula =
      'SUM(AD6:AD$_rowSum)';
  presupuestoSheet.getRangeByIndex(_rowSum + 1, 31).formula =
      'SUM(AE6:AE$_rowSum)';

  presupuestoSheet.getRangeByName('F6:U${_rowSum + 1}').numberFormat =
      '#,##0.00';
  presupuestoSheet.getRangeByName('A6:T${_rowSum + 1}').autoFit();
}

String celOcupado = 'Z\$4';
String celVacante = 'AB\$4';
String colOcupadoCantidad = '\$Z';
String colVacanteCantidad = '\$AB';
String colOcupadoMonto = '\$AA';
String colVacanteMonto = '\$AC';
String colCertificado = '\$J';
String colProyeccion = '\$AE';
String colDevengado = '\$K';
String colTotalAnual = '\$AF';
String colBaseEstadoOPP = '${ColumnBaseCap.estadoOpp.columnLetter}';
String colBaseFuente = '\$${ColumnBaseCap.fuente.columnLetter}';
String colBaseProducto = '\$${ColumnBaseCap.producto.columnLetter}';
String colBaseMeta = '\$${ColumnBaseCap.meta.columnLetter}';

String colPim = '\$I';

_proyeccion(int _firstRowBase, int _column, Worksheet page, int _rowEnd,
    int _lastRowBase,String _nombreHoja) {
  int _firstRowCertificado = 6;
  for (int x = _firstRowBase; x < _rowEnd - 1; x++) {
    
    
    page.getRangeByIndex(_firstRowCertificado, _column).formula =                                                  
        '''=IF(TRIM(LEFT(\$E$_firstRowCertificado,9))="="&$_nombreHoja&"!\$EI\$2",COUNTIFS(INDIRECT($_nombreHoja&"!$colBaseFuente\$$_firstRowBase:$colBaseFuente$_lastRowBase"),\$B$_firstRowCertificado,INDIRECT($_nombreHoja&"!$colBaseProducto\$$_firstRowBase:$colBaseProducto$_lastRowBase"),C$_firstRowCertificado,INDIRECT($_nombreHoja&"!$colBaseMeta\$$_firstRowBase:$colBaseMeta$_lastRowBase"),LEFT(D$_firstRowCertificado,4)),0)
        ''';

    page.getRangeByIndex(_firstRowCertificado, _column + 1).formula =
    '''=IF(TRIM(LEFT(\$E$_firstRowCertificado,9))=INDIRECT($_nombreHoja&"!\$EI\$2"),SUMIFS(INDIRECT($_nombreHoja&"!\$EI\$$_firstRowBase:\$EI$_lastRowBase"),INDIRECT($_nombreHoja&"!$colBaseFuente\$$_firstRowBase:$colBaseFuente$_lastRowBase"),\$B$_firstRowCertificado,INDIRECT($_nombreHoja&"!$colBaseProducto\$$_firstRowBase:$colBaseProducto$_lastRowBase"),\$C$_firstRowCertificado,INDIRECT($_nombreHoja&"!$colBaseMeta\$$_firstRowBase:$colBaseMeta$_lastRowBase"),LEFT(\$D$_firstRowCertificado,4)),0)+
        IF(TRIM(LEFT(\$E$_firstRowCertificado,9))=INDIRECT($_nombreHoja&"!\$EJ\$2"),SUMIFS(INDIRECT($_nombreHoja&"!\$EJ\$$_firstRowBase:\$EJ$_lastRowBase"),INDIRECT($_nombreHoja&"!$colBaseFuente\$$_firstRowBase:$colBaseFuente$_lastRowBase"),\$B$_firstRowCertificado,INDIRECT($_nombreHoja&"!$colBaseProducto\$$_firstRowBase:$colBaseProducto$_lastRowBase"),\$C$_firstRowCertificado,INDIRECT($_nombreHoja&"!$colBaseMeta\$$_firstRowBase:$colBaseMeta$_lastRowBase"),LEFT(\$D$_firstRowCertificado,4)),0)+
        IF(TRIM(LEFT(\$E$_firstRowCertificado,9))=INDIRECT($_nombreHoja&"!\$EK\$2"),SUMIFS(INDIRECT($_nombreHoja&"!\$EK\$$_firstRowBase:\$EK$_lastRowBase"),INDIRECT($_nombreHoja&"!$colBaseFuente\$$_firstRowBase:$colBaseFuente$_lastRowBase"),\$B$_firstRowCertificado,INDIRECT($_nombreHoja&"!$colBaseProducto\$$_firstRowBase:$colBaseProducto$_lastRowBase"),\$C$_firstRowCertificado,INDIRECT($_nombreHoja&"!$colBaseMeta\$$_firstRowBase:$colBaseMeta$_lastRowBase"),LEFT(\$D$_firstRowCertificado,4)),0)+
        IF(TRIM(LEFT(\$E$_firstRowCertificado,9))=INDIRECT($_nombreHoja&"!\$EL\$2"),SUMIFS(INDIRECT($_nombreHoja&"!\$EL\$$_firstRowBase:\$EL$_lastRowBase"),INDIRECT($_nombreHoja&"!$colBaseFuente\$$_firstRowBase:$colBaseFuente$_lastRowBase"),\$B$_firstRowCertificado,INDIRECT($_nombreHoja&"!$colBaseProducto\$$_firstRowBase:$colBaseProducto$_lastRowBase"),\$C$_firstRowCertificado,INDIRECT($_nombreHoja&"!$colBaseMeta\$$_firstRowBase:$colBaseMeta$_lastRowBase"),LEFT(\$D$_firstRowCertificado,4)),0)+
        IF(TRIM(LEFT(\$E$_firstRowCertificado,9))=INDIRECT($_nombreHoja&"!\$EM\$2"),SUMIFS(INDIRECT($_nombreHoja&"!\$EM\$$_firstRowBase:\$EM$_lastRowBase"),INDIRECT($_nombreHoja&"!$colBaseFuente\$$_firstRowBase:$colBaseFuente$_lastRowBase"),\$B$_firstRowCertificado,INDIRECT($_nombreHoja&"!$colBaseProducto\$$_firstRowBase:$colBaseProducto$_lastRowBase"),\$C$_firstRowCertificado,INDIRECT($_nombreHoja&"!$colBaseMeta\$$_firstRowBase:$colBaseMeta$_lastRowBase"),LEFT(\$D$_firstRowCertificado,4)),0)+
        IF(TRIM(LEFT(\$E$_firstRowCertificado,9))=INDIRECT($_nombreHoja&"!\$EN\$2"),SUMIFS(INDIRECT($_nombreHoja&"!\$EN\$$_firstRowBase:\$EN$_lastRowBase"),INDIRECT($_nombreHoja&"!$colBaseFuente\$$_firstRowBase:$colBaseFuente$_lastRowBase"),\$B$_firstRowCertificado,INDIRECT($_nombreHoja&"!$colBaseProducto\$$_firstRowBase:$colBaseProducto$_lastRowBase"),\$C$_firstRowCertificado,INDIRECT($_nombreHoja&"!$colBaseMeta\$$_firstRowBase:$colBaseMeta$_lastRowBase"),LEFT(\$D$_firstRowCertificado,4)),0)+
        IF(TRIM(LEFT(\$E$_firstRowCertificado,9))=INDIRECT($_nombreHoja&"!\$ES\$2"),SUMIFS(INDIRECT($_nombreHoja&"!\$ES\$$_firstRowBase:\$ES$_lastRowBase"),INDIRECT($_nombreHoja&"!$colBaseFuente\$$_firstRowBase:$colBaseFuente$_lastRowBase"),\$B$_firstRowCertificado,INDIRECT($_nombreHoja&"!$colBaseProducto\$$_firstRowBase:$colBaseProducto$_lastRowBase"),\$C$_firstRowCertificado,INDIRECT($_nombreHoja&"!$colBaseMeta\$$_firstRowBase:$colBaseMeta$_lastRowBase"),LEFT(\$D$_firstRowCertificado,4)),0)''';

    // OCUPADOS
      // CANTIDAD
    page.getRangeByIndex(4, _column + 2).setText('OCUPADO');
    page.getRangeByIndex(_firstRowCertificado, _column + 2).formula =
        '''=IF(TRIM(LEFT(\$E$_firstRowCertificado,9))=INDIRECT($_nombreHoja&"!\$EI\$2"),COUNTIFS(INDIRECT($_nombreHoja&"!$colBaseFuente\$$_firstRowBase:$colBaseFuente$_lastRowBase"),\$B$_firstRowCertificado,INDIRECT($_nombreHoja&"!$colBaseProducto\$$_firstRowBase:$colBaseProducto$_lastRowBase"),\$C$_firstRowCertificado,INDIRECT($_nombreHoja&"!$colBaseMeta\$$_firstRowBase:$colBaseMeta$_lastRowBase"),LEFT(\$D$_firstRowCertificado,4),INDIRECT($_nombreHoja&"!"&$colBaseEstadoOPP&"\$$_firstRowBase:"&$colBaseEstadoOPP&"$_lastRowBase"),$celOcupado),0)
        ''';
      // MONTO OCUPADO                                                                                                                                                                                                                                                                                                                                                                                                                                           INDIRECTO(Z$2&"!"&AA$2&"4:"&AA$2&"$739")                                                                                                                                                  
    page.getRangeByIndex(_firstRowCertificado, _column + 3).formula =
    '''=IF(TRIM(LEFT(\$E$_firstRowCertificado,9))=INDIRECT($_nombreHoja&"!\$EI\$2"),SUMIFS(INDIRECT($_nombreHoja&"!\$EI\$$_firstRowBase:\$EI$_lastRowBase"),INDIRECT($_nombreHoja&"!$colBaseFuente\$$_firstRowBase:$colBaseFuente$_lastRowBase"),\$B$_firstRowCertificado,INDIRECT($_nombreHoja&"!$colBaseProducto\$$_firstRowBase:$colBaseProducto$_lastRowBase"),\$C$_firstRowCertificado,INDIRECT($_nombreHoja&"!$colBaseMeta\$$_firstRowBase:$colBaseMeta$_lastRowBase"),LEFT(\$D$_firstRowCertificado,4),INDIRECT($_nombreHoja&"!"&$colBaseEstadoOPP&"\$$_firstRowBase:"&$colBaseEstadoOPP&"$_lastRowBase"),$celOcupado),0)+
        IF(TRIM(LEFT(\$E$_firstRowCertificado,9))=INDIRECT($_nombreHoja&"!\$EJ\$2"),SUMIFS(INDIRECT($_nombreHoja&"!\$EJ\$$_firstRowBase:\$EJ$_lastRowBase"),INDIRECT($_nombreHoja&"!$colBaseFuente\$$_firstRowBase:$colBaseFuente$_lastRowBase"),\$B$_firstRowCertificado,INDIRECT($_nombreHoja&"!$colBaseProducto\$$_firstRowBase:$colBaseProducto$_lastRowBase"),\$C$_firstRowCertificado,INDIRECT($_nombreHoja&"!$colBaseMeta\$$_firstRowBase:$colBaseMeta$_lastRowBase"),LEFT(\$D$_firstRowCertificado,4),INDIRECT($_nombreHoja&"!"&$colBaseEstadoOPP&"\$$_firstRowBase:"&$colBaseEstadoOPP&"$_lastRowBase"),$celOcupado),0)+
        IF(TRIM(LEFT(\$E$_firstRowCertificado,9))=INDIRECT($_nombreHoja&"!\$EK\$2"),SUMIFS(INDIRECT($_nombreHoja&"!\$EK\$$_firstRowBase:\$EK$_lastRowBase"),INDIRECT($_nombreHoja&"!$colBaseFuente\$$_firstRowBase:$colBaseFuente$_lastRowBase"),\$B$_firstRowCertificado,INDIRECT($_nombreHoja&"!$colBaseProducto\$$_firstRowBase:$colBaseProducto$_lastRowBase"),\$C$_firstRowCertificado,INDIRECT($_nombreHoja&"!$colBaseMeta\$$_firstRowBase:$colBaseMeta$_lastRowBase"),LEFT(\$D$_firstRowCertificado,4),INDIRECT($_nombreHoja&"!"&$colBaseEstadoOPP&"\$$_firstRowBase:"&$colBaseEstadoOPP&"$_lastRowBase"),$celOcupado),0)+
        IF(TRIM(LEFT(\$E$_firstRowCertificado,9))=INDIRECT($_nombreHoja&"!\$EL\$2"),SUMIFS(INDIRECT($_nombreHoja&"!\$EL\$$_firstRowBase:\$EL$_lastRowBase"),INDIRECT($_nombreHoja&"!$colBaseFuente\$$_firstRowBase:$colBaseFuente$_lastRowBase"),\$B$_firstRowCertificado,INDIRECT($_nombreHoja&"!$colBaseProducto\$$_firstRowBase:$colBaseProducto$_lastRowBase"),\$C$_firstRowCertificado,INDIRECT($_nombreHoja&"!$colBaseMeta\$$_firstRowBase:$colBaseMeta$_lastRowBase"),LEFT(\$D$_firstRowCertificado,4),INDIRECT($_nombreHoja&"!"&$colBaseEstadoOPP&"\$$_firstRowBase:"&$colBaseEstadoOPP&"$_lastRowBase"),$celOcupado),0)+
        IF(TRIM(LEFT(\$E$_firstRowCertificado,9))=INDIRECT($_nombreHoja&"!\$EM\$2"),SUMIFS(INDIRECT($_nombreHoja&"!\$EM\$$_firstRowBase:\$EM$_lastRowBase"),INDIRECT($_nombreHoja&"!$colBaseFuente\$$_firstRowBase:$colBaseFuente$_lastRowBase"),\$B$_firstRowCertificado,INDIRECT($_nombreHoja&"!$colBaseProducto\$$_firstRowBase:$colBaseProducto$_lastRowBase"),\$C$_firstRowCertificado,INDIRECT($_nombreHoja&"!$colBaseMeta\$$_firstRowBase:$colBaseMeta$_lastRowBase"),LEFT(\$D$_firstRowCertificado,4),INDIRECT($_nombreHoja&"!"&$colBaseEstadoOPP&"\$$_firstRowBase:"&$colBaseEstadoOPP&"$_lastRowBase"),$celOcupado),0)+
        IF(TRIM(LEFT(\$E$_firstRowCertificado,9))=INDIRECT($_nombreHoja&"!\$EN\$2"),SUMIFS(INDIRECT($_nombreHoja&"!\$EN\$$_firstRowBase:\$EN$_lastRowBase"),INDIRECT($_nombreHoja&"!$colBaseFuente\$$_firstRowBase:$colBaseFuente$_lastRowBase"),\$B$_firstRowCertificado,INDIRECT($_nombreHoja&"!$colBaseProducto\$$_firstRowBase:$colBaseProducto$_lastRowBase"),\$C$_firstRowCertificado,INDIRECT($_nombreHoja&"!$colBaseMeta\$$_firstRowBase:$colBaseMeta$_lastRowBase"),LEFT(\$D$_firstRowCertificado,4),INDIRECT($_nombreHoja&"!"&$colBaseEstadoOPP&"\$$_firstRowBase:"&$colBaseEstadoOPP&"$_lastRowBase"),$celOcupado),0)+
        IF(TRIM(LEFT(\$E$_firstRowCertificado,9))=INDIRECT($_nombreHoja&"!\$ES\$2"),SUMIFS(INDIRECT($_nombreHoja&"!\$ES\$$_firstRowBase:\$ES$_lastRowBase"),INDIRECT($_nombreHoja&"!$colBaseFuente\$$_firstRowBase:$colBaseFuente$_lastRowBase"),\$B$_firstRowCertificado,INDIRECT($_nombreHoja&"!$colBaseProducto\$$_firstRowBase:$colBaseProducto$_lastRowBase"),\$C$_firstRowCertificado,INDIRECT($_nombreHoja&"!$colBaseMeta\$$_firstRowBase:$colBaseMeta$_lastRowBase"),LEFT(\$D$_firstRowCertificado,4),INDIRECT($_nombreHoja&"!"&$colBaseEstadoOPP&"\$$_firstRowBase:"&$colBaseEstadoOPP&"$_lastRowBase"),$celOcupado),0)''';

    // VACANTE
    // CANTIDAD
    page.getRangeByIndex(4, _column + 4).setText('VACANTE');

    page.getRangeByIndex(_firstRowCertificado, _column + 4).formula =
        '''=IF(TRIM(LEFT(\$E$_firstRowCertificado,9))=INDIRECT($_nombreHoja&"!\$EI\$2"),COUNTIFS(INDIRECT($_nombreHoja&"!$colBaseFuente\$$_firstRowBase:$colBaseFuente$_lastRowBase"),\$B$_firstRowCertificado,INDIRECT($_nombreHoja&"!$colBaseProducto\$$_firstRowBase:$colBaseProducto$_lastRowBase"),\$C$_firstRowCertificado,INDIRECT($_nombreHoja&"!$colBaseMeta\$$_firstRowBase:$colBaseMeta$_lastRowBase"),LEFT(\$D$_firstRowCertificado,4),INDIRECT($_nombreHoja&"!"&$colBaseEstadoOPP&"\$$_firstRowBase:"&$colBaseEstadoOPP&"$_lastRowBase"),$celVacante),0)
        ''';

    page.getRangeByIndex(_firstRowCertificado, _column + 5).formula =
    '''=IF(TRIM(LEFT(\$E$_firstRowCertificado,9))=INDIRECT($_nombreHoja&"!\$EI\$2"),SUMIFS(INDIRECT($_nombreHoja&"!\$EI\$$_firstRowBase:\$EI$_lastRowBase"),INDIRECT($_nombreHoja&"!$colBaseFuente\$$_firstRowBase:$colBaseFuente$_lastRowBase"),\$B$_firstRowCertificado,INDIRECT($_nombreHoja&"!$colBaseProducto\$$_firstRowBase:$colBaseProducto$_lastRowBase"),\$C$_firstRowCertificado,INDIRECT($_nombreHoja&"!$colBaseMeta\$$_firstRowBase:$colBaseMeta$_lastRowBase"),LEFT(\$D$_firstRowCertificado,4),INDIRECT($_nombreHoja&"!"&$colBaseEstadoOPP&"\$$_firstRowBase:"&$colBaseEstadoOPP&"$_lastRowBase"),$celVacante),0)+
        IF(TRIM(LEFT(\$E$_firstRowCertificado,9))=INDIRECT($_nombreHoja&"!\$EJ\$2"),SUMIFS(INDIRECT($_nombreHoja&"!\$EJ\$$_firstRowBase:\$EJ$_lastRowBase"),INDIRECT($_nombreHoja&"!$colBaseFuente\$$_firstRowBase:$colBaseFuente$_lastRowBase"),\$B$_firstRowCertificado,INDIRECT($_nombreHoja&"!$colBaseProducto\$$_firstRowBase:$colBaseProducto$_lastRowBase"),\$C$_firstRowCertificado,INDIRECT($_nombreHoja&"!$colBaseMeta\$$_firstRowBase:$colBaseMeta$_lastRowBase"),LEFT(\$D$_firstRowCertificado,4),INDIRECT($_nombreHoja&"!"&$colBaseEstadoOPP&"\$$_firstRowBase:"&$colBaseEstadoOPP&"$_lastRowBase"),$celVacante),0)+
        IF(TRIM(LEFT(\$E$_firstRowCertificado,9))=INDIRECT($_nombreHoja&"!\$EK\$2"),SUMIFS(INDIRECT($_nombreHoja&"!\$EK\$$_firstRowBase:\$EK$_lastRowBase"),INDIRECT($_nombreHoja&"!$colBaseFuente\$$_firstRowBase:$colBaseFuente$_lastRowBase"),\$B$_firstRowCertificado,INDIRECT($_nombreHoja&"!$colBaseProducto\$$_firstRowBase:$colBaseProducto$_lastRowBase"),\$C$_firstRowCertificado,INDIRECT($_nombreHoja&"!$colBaseMeta\$$_firstRowBase:$colBaseMeta$_lastRowBase"),LEFT(\$D$_firstRowCertificado,4),INDIRECT($_nombreHoja&"!"&$colBaseEstadoOPP&"\$$_firstRowBase:"&$colBaseEstadoOPP&"$_lastRowBase"),$celVacante),0)+
        IF(TRIM(LEFT(\$E$_firstRowCertificado,9))=INDIRECT($_nombreHoja&"!\$EL\$2"),SUMIFS(INDIRECT($_nombreHoja&"!\$EL\$$_firstRowBase:\$EL$_lastRowBase"),INDIRECT($_nombreHoja&"!$colBaseFuente\$$_firstRowBase:$colBaseFuente$_lastRowBase"),\$B$_firstRowCertificado,INDIRECT($_nombreHoja&"!$colBaseProducto\$$_firstRowBase:$colBaseProducto$_lastRowBase"),\$C$_firstRowCertificado,INDIRECT($_nombreHoja&"!$colBaseMeta\$$_firstRowBase:$colBaseMeta$_lastRowBase"),LEFT(\$D$_firstRowCertificado,4),INDIRECT($_nombreHoja&"!"&$colBaseEstadoOPP&"\$$_firstRowBase:"&$colBaseEstadoOPP&"$_lastRowBase"),$celVacante),0)+
        IF(TRIM(LEFT(\$E$_firstRowCertificado,9))=INDIRECT($_nombreHoja&"!\$EM\$2"),SUMIFS(INDIRECT($_nombreHoja&"!\$EM\$$_firstRowBase:\$EM$_lastRowBase"),INDIRECT($_nombreHoja&"!$colBaseFuente\$$_firstRowBase:$colBaseFuente$_lastRowBase"),\$B$_firstRowCertificado,INDIRECT($_nombreHoja&"!$colBaseProducto\$$_firstRowBase:$colBaseProducto$_lastRowBase"),\$C$_firstRowCertificado,INDIRECT($_nombreHoja&"!$colBaseMeta\$$_firstRowBase:$colBaseMeta$_lastRowBase"),LEFT(\$D$_firstRowCertificado,4),INDIRECT($_nombreHoja&"!"&$colBaseEstadoOPP&"\$$_firstRowBase:"&$colBaseEstadoOPP&"$_lastRowBase"),$celVacante),0)+
        IF(TRIM(LEFT(\$E$_firstRowCertificado,9))=INDIRECT($_nombreHoja&"!\$EN\$2"),SUMIFS(INDIRECT($_nombreHoja&"!\$EN\$$_firstRowBase:\$EN$_lastRowBase"),INDIRECT($_nombreHoja&"!$colBaseFuente\$$_firstRowBase:$colBaseFuente$_lastRowBase"),\$B$_firstRowCertificado,INDIRECT($_nombreHoja&"!$colBaseProducto\$$_firstRowBase:$colBaseProducto$_lastRowBase"),\$C$_firstRowCertificado,INDIRECT($_nombreHoja&"!$colBaseMeta\$$_firstRowBase:$colBaseMeta$_lastRowBase"),LEFT(\$D$_firstRowCertificado,4),INDIRECT($_nombreHoja&"!"&$colBaseEstadoOPP&"\$$_firstRowBase:"&$colBaseEstadoOPP&"$_lastRowBase"),$celVacante),0)+
        IF(TRIM(LEFT(\$E$_firstRowCertificado,9))=INDIRECT($_nombreHoja&"!\$ES\$2"),SUMIFS(INDIRECT($_nombreHoja&"!\$ES\$$_firstRowBase:\$ES$_lastRowBase"),INDIRECT($_nombreHoja&"!$colBaseFuente\$$_firstRowBase:$colBaseFuente$_lastRowBase"),\$B$_firstRowCertificado,INDIRECT($_nombreHoja&"!$colBaseProducto\$$_firstRowBase:$colBaseProducto$_lastRowBase"),\$C$_firstRowCertificado,INDIRECT($_nombreHoja&"!$colBaseMeta\$$_firstRowBase:$colBaseMeta$_lastRowBase"),LEFT(\$D$_firstRowCertificado,4),INDIRECT($_nombreHoja&"!"&$colBaseEstadoOPP&"\$$_firstRowBase:"&$colBaseEstadoOPP&"$_lastRowBase"),$celVacante),0)''';

    page.getRangeByIndex(_firstRowCertificado, _column + 6).formula =
        '=$colOcupadoCantidad$_firstRowCertificado+$colVacanteCantidad$_firstRowCertificado';
    page.getRangeByIndex(_firstRowCertificado, _column + 7).formula =
        '=$colOcupadoMonto$_firstRowCertificado+$colVacanteMonto$_firstRowCertificado';
    page.getRangeByIndex(_firstRowCertificado, _column + 8).formula =
        '=$colDevengado$_firstRowCertificado+$colProyeccion$_firstRowCertificado';
    page.getRangeByIndex(_firstRowCertificado, _column + 9).formula =
        '=$colPim$_firstRowCertificado-$colTotalAnual$_firstRowCertificado';

    _firstRowCertificado += 1;
  }

  // SE TIENE QUE CREAR REGISTROS EN CERO , SINO EXISTE EN PRESUPUESTO, PERO SI EN LA PROYECCION
  // POR EJEMPLO FALTA ANCASH 23.28.12
}

_fuenteMetaOfBase(Worksheet _sheetBase, List<PresupuestoEntity> _params) {
  // RO
  List<PresupuestoEntity> presupuestoOrderByFuenteRO = _params
      .where((e) => e.fuente == 'RO')
      .where((element) => element.meta.isNotEmpty)
      .toList();

  presupuestoOrderByFuenteRO.sort((a, b) => a.meta.compareTo(b.meta));

  var presupuestoOrderByFuenteMetaRO = groupBy(
      presupuestoOrderByFuenteRO, (PresupuestoEntity item) => item.meta);

  // RDR
  List<PresupuestoEntity> presupuestoOrderByFuenteRDR = _params
      .where((e) => e.fuente == 'RDR')
      .where((element) => element.meta.isNotEmpty)
      .toList();

  presupuestoOrderByFuenteRDR.sort((a, b) => a.meta.compareTo(b.meta));

  var presupuestoOrderByFuenteMetaRDR = groupBy(
      presupuestoOrderByFuenteRDR, (PresupuestoEntity item) => item.meta);

  presupuestoOrderByFuenteMetaRO.entries.forEach((e) {
    if (e.value.isNotEmpty) {
      var foundEspecificaRO14 =
          e.value.where((element) => element.especifica3.contains('21.11.14'));
      if (foundEspecificaRO14.isEmpty) {
        addClasificadorInPresupuestoCap(2023, _params, e.value[0],
            '21.11.14 - PERSONAL CON CONTRATO A PLAZO INDETERMINADO (REGIMEN LABORAL PRIVADO)');
      }

      final foundEspecificaRO13 =
          e.value.where((element) => element.especifica3.contains('21.19.13'));
      if (foundEspecificaRO13.isEmpty) {
        addClasificadorInPresupuestoCap(2023, _params, e.value[0],
            '21.19.13 - BONIFICACION POR ESCOLARIDAD');
      }

      final foundEspecificaRO21 =
          e.value.where((element) => element.especifica3.contains('21.19.21'));
      if (foundEspecificaRO21.isEmpty) {
        addClasificadorInPresupuestoCap(2023, _params, e.value[0],
            '21.19.21 - COMPENSACION POR TIEMPO DE SERVICIOS (CTS)');
      }

      final foundEspecificaRO11 =
          e.value.where((element) => element.especifica3.contains('21.19.11'));
      if (foundEspecificaRO11.isEmpty) {
        addClasificadorInPresupuestoCap(
            2023, _params, e.value[0], '21.19.11 - GRATIFICACIONES');
      }

      final foundEspecificaRO399 =
          e.value.where((element) => element.especifica3.contains('21.19.399'));
      if (foundEspecificaRO399.isEmpty) {
        addClasificadorInPresupuestoCap(
            2023, _params, e.value[0], '21.19.399 - OTRAS OCASIONALES');
      }

      final foundEspecificaRO15 =
          e.value.where((element) => element.especifica3.contains('21.31.15'));

      if (foundEspecificaRO15.isEmpty) {
        addClasificadorInPresupuestoCap(
            2023, _params, e.value[0], '21.31.15 - CONTRIBUCIONES A ESSALUD');
      }

      final foundEspecificaRO16 =
          e.value.where((element) => element.especifica3.contains('21.31.16'));

      if (foundEspecificaRO16.isEmpty) {
        addClasificadorInPresupuestoCap(2023, _params, e.value[0],
            '21.31.16 - OTRAS CONTRIBUCIONES DEL EMPLEADOR');
      }
    }
  });

  presupuestoOrderByFuenteMetaRDR.entries.forEach((e) {
    if (e.value.isNotEmpty) {
      var foundEspecificaRO14 =
          e.value.where((element) => element.especifica3.contains('21.11.14'));
      if (foundEspecificaRO14.isEmpty) {
        addClasificadorInPresupuestoCap(2023, _params, e.value[0],
            '21.11.14 - PERSONAL CON CONTRATO A PLAZO INDETERMINADO (REGIMEN LABORAL PRIVADO)');
      }

      final foundEspecificaRDR13 =
          e.value.where((element) => element.especifica3.contains('21.19.13'));
      if (foundEspecificaRDR13.isEmpty) {
        addClasificadorInPresupuestoCap(2023, _params, e.value[0],
            '21.19.13 - BONIFICACION POR ESCOLARIDAD');
      }

      final foundEspecificaRDR21 =
          e.value.where((element) => element.especifica3.contains('21.19.21'));
      if (foundEspecificaRDR21.isEmpty) {
        addClasificadorInPresupuestoCap(2023, _params, e.value[0],
            '21.19.21 - COMPENSACION POR TIEMPO DE SERVICIOS (CTS)');
      }

      final foundEspecificaRDR11 =
          e.value.where((element) => element.especifica3.contains('21.19.11'));
      if (foundEspecificaRDR11.isEmpty) {
        addClasificadorInPresupuestoCap(
            2023, _params, e.value[0], '21.19.11 - GRATIFICACIONES');
      }

      final foundEspecificaRDR399 =
          e.value.where((element) => element.especifica3.contains('21.19.399'));
      if (foundEspecificaRDR399.isEmpty) {
        addClasificadorInPresupuestoCap(
            2023, _params, e.value[0], '21.19.399 - OTRAS OCASIONALES');
      }

      final foundEspecificaRDR15 =
          e.value.where((element) => element.especifica3.contains('21.31.15'));

      if (foundEspecificaRDR15.isEmpty) {
        addClasificadorInPresupuestoCap(
            2023, _params, e.value[0], '21.31.15 - CONTRIBUCIONES A ESSALUD');
      }

      final foundEspecificaRDR16 =
          e.value.where((element) => element.especifica3.contains('21.31.16'));

      if (foundEspecificaRDR16.isEmpty) {
        addClasificadorInPresupuestoCap(2023, _params, e.value[0],
            '21.31.16 - OTRAS CONTRIBUCIONES DEL EMPLEADOR');
      }
    }
  });
}
