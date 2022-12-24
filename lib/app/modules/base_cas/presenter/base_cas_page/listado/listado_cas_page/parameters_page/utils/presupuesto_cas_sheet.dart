import 'package:collection/collection.dart';
import 'package:rrhh_clean/app/modules/base_cas/domain/entities/base_cas_entity.dart';
import 'package:rrhh_clean/app/modules/base_cas/domain/entities/presupuesto_cas_entity.dart';
import 'package:rrhh_clean/app/modules/base_cas/domain/usecases/calcular_cas_use_case.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';

import 'columns_base_sheet.dart';
import 'columns_presupuesto_sheet.dart';
import 'functions_custom_cas.dart';

void sheetPresupuestoExtend(Workbook workbook, int firstRowHeading,
    ParamsCalcular params, Worksheet sheetBase, List<BaseCasEntity> baseCas) {
  final Worksheet presupuestoSheet =
      workbook.worksheets.addWithName('PRESUPUESTO');
  List<Object> headerPresupuesto = [
    'Año',
    'Fuente',
    'Producto',
    'Meta',
    'Clasificador',
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
    'CCantidad',
    'CProyeccion',
    'RCantidad',
    'RProyeccion',
    'NCantidad',
    'NProyeccion',
    'Cantidad',
    'Proyeccion',
    'TotalProyeccion',
    'Saldo'
  ];
  presupuestoSheet.importList(headerPresupuesto, firstRowHeading, 1, false);

  _fuenteMetaOfBase(sheetBase, params.pim);
  fuenteMetaOfPresupuesto(baseCas, params.pim);

  for (int index = 0; index < params.pim.length; index++) {
    final List<Object> row =
        List.from(params.pim[index].toMap().values.toList());

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

  _proyeccion(6, 22, presupuestoSheet, presupuestoSheet.getLastRow() - 1,
      sheetBase.getLastRow() - 1);

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
  presupuestoSheet.getRangeByIndex(_rowSum + 1, 32).formula =
      'SUBTOTAL(9,AF6:AF$_rowSum)';
  presupuestoSheet.getRangeByIndex(_rowSum + 1, 33).formula =
      'SUBTOTAL(9,AG6:AG$_rowSum)';
  presupuestoSheet.getRangeByIndex(_rowSum + 1, 34).formula =
      'SUBTOTAL(9,AH6:AH$_rowSum)';
  presupuestoSheet.getRangeByIndex(_rowSum + 1, 35).formula =
      'SUBTOTAL(9,AI6:AI$_rowSum)';
  presupuestoSheet.getRangeByIndex(_rowSum + 1, 36).formula =
      'SUBTOTAL(9,AJ6:AJ$_rowSum)';
  presupuestoSheet.getRangeByIndex(_rowSum + 1, 37).formula =
      'SUBTOTAL(9,AK6:AK$_rowSum)';

  presupuestoSheet.getRangeByName('F6:U${_rowSum + 32}').numberFormat =
      '#,##0.00';

  presupuestoSheet.getRangeByName('W6:W${_rowSum + 1}').numberFormat =
      '#,##0.00';
  presupuestoSheet.getRangeByName('Y6:Y${_rowSum + 1}').numberFormat =
      '#,##0.00';
  presupuestoSheet.getRangeByName('AA6:AA${_rowSum + 1}').numberFormat =
      '#,##0.00';
  presupuestoSheet.getRangeByName('AC6:AC${_rowSum + 1}').numberFormat =
      '#,##0.00';
  presupuestoSheet.getRangeByName('AE6:AE${_rowSum + 1}').numberFormat =
      '#,##0.00';
  presupuestoSheet.getRangeByName('AG6:AK${_rowSum + 1}').numberFormat =
      '#,##0.00';
  presupuestoSheet.getRangeByName('AI6:AI${_rowSum + 1}').numberFormat =
      '#,##0.00';
  presupuestoSheet.getRangeByName('A6:T${_rowSum + 1}').autoFit();
}

_proyeccion(
    int _rowInit, int _column, Worksheet page, int _rowEnd, int _lastRowBase) {
  for (int x = _rowInit; x <= _rowEnd; x++) {
    page
            .getRangeByName(
                '${ColumnPresupuestoTable.tCantidad.columnLetter}$x')
            .formula =
        '''=IF(TRIM(LEFT(\$${ColumnPresupuestoTable.clasificador.columnLetter}$x,9))=BASE!\$${ColumnBaseHeader.clasificadorSueldoValue.columnLetter}\$${RowPresupuestoHeader.rowCuatro.rowIndex},COUNTIFS(BASE!\$${ColumnBaseTable.fuente.columnLetter}\$$_rowInit:\$${ColumnBaseTable.fuente.columnLetter}\$$_lastRowBase,\$${ColumnPresupuestoTable.fuente.columnLetter}$x,BASE!\$${ColumnBaseTable.producto.columnLetter}\$$_rowInit:\$${ColumnBaseTable.producto.columnLetter}\$$_lastRowBase,\$${ColumnPresupuestoTable.producto.columnLetter}$x,BASE!\$${ColumnBaseTable.meta.columnLetter}\$$_rowInit:\$${ColumnBaseTable.meta.columnLetter}\$$_lastRowBase,LEFT(\$${ColumnPresupuestoTable.meta.columnLetter}$x,4)),0)
        ''';

    page
            .getRangeByName(
                '${ColumnPresupuestoTable.tProyeccion.columnLetter}$x')
            .formula =
        '''=IF(TRIM(LEFT(\$${ColumnPresupuestoTable.clasificador.columnLetter}$x,9))=BASE!\$${ColumnBaseHeader.clasificadorSueldoValue.columnLetter}\$${RowPresupuestoHeader.rowCuatro.rowIndex},SUMIFS(BASE!\$${ColumnBaseTable.montoAnual.columnLetter}\$$_rowInit:\$${ColumnBaseTable.montoAnual.columnLetter}\$$_lastRowBase,BASE!\$${ColumnBaseTable.fuente.columnLetter}\$$_rowInit:\$${ColumnBaseTable.fuente.columnLetter}\$$_lastRowBase,\$${ColumnPresupuestoTable.fuente.columnLetter}$x,BASE!\$${ColumnBaseTable.producto.columnLetter}\$$_rowInit:\$${ColumnBaseTable.producto.columnLetter}\$$_lastRowBase,\$${ColumnPresupuestoTable.producto.columnLetter}$x,BASE!\$${ColumnBaseTable.meta.columnLetter}\$$_rowInit:\$${ColumnBaseTable.meta.columnLetter}\$$_lastRowBase,LEFT(\$${ColumnPresupuestoTable.meta.columnLetter}$x,4)),0)+
        IF(TRIM(LEFT(\$${ColumnPresupuestoTable.clasificador.columnLetter}$x,9))=BASE!\$${ColumnBaseHeader.clasificadorEssaludValue.columnLetter}\$${RowPresupuestoHeader.rowCuatro.rowIndex},SUMIFS(BASE!\$${ColumnBaseTable.essaludAnual.columnLetter}\$$_rowInit:\$${ColumnBaseTable.essaludAnual.columnLetter}\$$_lastRowBase,BASE!\$${ColumnBaseTable.fuente.columnLetter}\$$_rowInit:\$${ColumnBaseTable.fuente.columnLetter}\$$_lastRowBase,\$${ColumnPresupuestoTable.fuente.columnLetter}$x,BASE!\$${ColumnBaseTable.producto.columnLetter}\$$_rowInit:\$${ColumnBaseTable.producto.columnLetter}\$$_lastRowBase,\$${ColumnPresupuestoTable.producto.columnLetter}$x,BASE!\$${ColumnBaseTable.meta.columnLetter}\$$_rowInit:\$${ColumnBaseTable.meta.columnLetter}\$$_lastRowBase,LEFT(\$${ColumnPresupuestoTable.meta.columnLetter}$x,4)),0)+
        IF(TRIM(LEFT(\$${ColumnPresupuestoTable.clasificador.columnLetter}$x,9))=BASE!\$${ColumnBaseHeader.clasificadorAguinaldoValue.columnLetter}\$${RowPresupuestoHeader.rowCuatro.rowIndex},SUMIFS(BASE!\$${ColumnBaseTable.aguinaldoAnual.columnLetter}\$$_rowInit:\$${ColumnBaseTable.aguinaldoAnual.columnLetter}\$$_lastRowBase,BASE!\$${ColumnBaseTable.fuente.columnLetter}\$$_rowInit:\$${ColumnBaseTable.fuente.columnLetter}\$$_lastRowBase,\$${ColumnPresupuestoTable.fuente.columnLetter}$x,BASE!\$${ColumnBaseTable.producto.columnLetter}\$$_rowInit:\$${ColumnBaseTable.producto.columnLetter}\$$_lastRowBase,\$${ColumnPresupuestoTable.producto.columnLetter}$x,BASE!\$${ColumnBaseTable.meta.columnLetter}\$$_rowInit:\$${ColumnBaseTable.meta.columnLetter}\$$_lastRowBase,LEFT(\$${ColumnPresupuestoTable.meta.columnLetter}$x,4)),0)+
        IF(TRIM(LEFT(\$${ColumnPresupuestoTable.clasificador.columnLetter}$x,9))=BASE!\$${ColumnBaseHeader.clasificadorSctrSaludValue.columnLetter}\$${RowPresupuestoHeader.rowCuatro.rowIndex},SUMIFS(BASE!\$${ColumnBaseTable.sctrSaludAnual.columnLetter}\$$_rowInit:\$${ColumnBaseTable.sctrSaludAnual.columnLetter}\$$_lastRowBase,BASE!\$${ColumnBaseTable.fuente.columnLetter}\$$_rowInit:\$${ColumnBaseTable.fuente.columnLetter}\$$_lastRowBase,\$${ColumnPresupuestoTable.fuente.columnLetter}$x,BASE!\$${ColumnBaseTable.producto.columnLetter}\$$_rowInit:\$${ColumnBaseTable.producto.columnLetter}\$$_lastRowBase,\$${ColumnPresupuestoTable.producto.columnLetter}$x,BASE!\$${ColumnBaseTable.meta.columnLetter}\$$_rowInit:\$${ColumnBaseTable.meta.columnLetter}\$$_lastRowBase,LEFT(\$${ColumnPresupuestoTable.meta.columnLetter}$x,4)),0)''';

/*     // OCUPADOS
    // CANTIDAD
    print(
        '${ColumnPresupuestoHeader.ocupadoValue.columnLetter}${RowPresupuestoHeader.rowCuatro.rowIndex}$x');
    page
        .getRangeByName(
            '${ColumnPresupuestoHeader.ocupadoValue.columnLetter}${RowPresupuestoHeader.rowCuatro.rowIndex}')
        .setText('OCUPADO');
    page
            .getRangeByName(
                '${ColumnPresupuestoTable.oCantidad.columnLetter}$x')
            .formula =
        '''=IF(TRIM(LEFT(\$${ColumnPresupuestoTable.clasificador.columnLetter}$x,9))=BASE!\$${ColumnBaseHeader.clasificadorSueldoValue.columnLetter}\$${RowPresupuestoHeader.rowCuatro.rowIndex},COUNTIFS(BASE!\$${ColumnBaseTable.fuente.columnLetter}\$$_rowInit:\$${ColumnBaseTable.fuente.columnLetter}\$$_lastRowBase,\$${ColumnPresupuestoTable.fuente.columnLetter}$x,BASE!\$${ColumnBaseTable.producto.columnLetter}\$$_rowInit:\$${ColumnBaseTable.producto.columnLetter}\$$_lastRowBase,\$${ColumnPresupuestoTable.producto.columnLetter}$x,BASE!\$${ColumnBaseTable.meta.columnLetter}\$$_rowInit:\$${ColumnBaseTable.meta.columnLetter}\$$_lastRowBase,LEFT(\$${ColumnPresupuestoTable.meta.columnLetter}$x,4),BASE!\$${ColumnBaseTable.estadoOpp.columnLetter}\$$_rowInit:\$${ColumnBaseTable.estadoOpp.columnLetter}\$$_lastRowBase,\$${ColumnPresupuestoHeader.ocupadoValue.columnLetter}\$${RowPresupuestoHeader.rowCuatro.rowIndex}),0)
        ''';
    // MONTO OCUPADO
    page
            .getRangeByName(
                '${ColumnPresupuestoTable.oProyeccion.columnLetter}$x')
            .formula =
        '''=IF(TRIM(LEFT(\$${ColumnPresupuestoTable.clasificador.columnLetter}$x,9))=BASE!\$${ColumnBaseHeader.clasificadorSueldoValue.columnLetter}\$${RowPresupuestoHeader.rowCuatro.rowIndex},SUMIFS(BASE!\$${ColumnBaseTable.montoAnual.columnLetter}\$$_rowInit:\$${ColumnBaseTable.montoAnual.columnLetter}\$$_lastRowBase,BASE!\$${ColumnBaseTable.fuente.columnLetter}\$$_rowInit:\$${ColumnBaseTable.fuente.columnLetter}\$$_lastRowBase,\$${ColumnPresupuestoTable.fuente.columnLetter}$x,BASE!\$${ColumnBaseTable.producto.columnLetter}\$$_rowInit:\$${ColumnBaseTable.producto.columnLetter}\$$_lastRowBase,\$${ColumnPresupuestoTable.producto.columnLetter}$x,BASE!\$${ColumnBaseTable.meta.columnLetter}\$$_rowInit:\$${ColumnBaseTable.meta.columnLetter}\$$_lastRowBase,LEFT(\$${ColumnPresupuestoTable.meta.columnLetter}$x,4),BASE!\$N\$$_rowInit:\$N\$$_lastRowBase,${ColumnPresupuestoHeader.ocupadoValue.columnLetter}\$${RowPresupuestoHeader.rowCuatro.rowIndex}),0)+
        IF(TRIM(LEFT(\$${ColumnPresupuestoTable.clasificador.columnLetter}$x,9))=BASE!\$${ColumnBaseHeader.clasificadorEssaludValue.columnLetter}\$${RowPresupuestoHeader.rowCuatro.rowIndex},SUMIFS(BASE!\$${ColumnBaseTable.essaludAnual.columnLetter}\$$_rowInit:\$${ColumnBaseTable.essaludAnual.columnLetter}\$$_lastRowBase,BASE!\$${ColumnBaseTable.fuente.columnLetter}\$$_rowInit:\$${ColumnBaseTable.fuente.columnLetter}\$$_lastRowBase,\$${ColumnPresupuestoTable.fuente.columnLetter}$x,BASE!\$${ColumnBaseTable.producto.columnLetter}\$$_rowInit:\$${ColumnBaseTable.producto.columnLetter}\$$_lastRowBase,\$${ColumnPresupuestoTable.producto.columnLetter}$x,BASE!\$${ColumnBaseTable.meta.columnLetter}\$$_rowInit:\$${ColumnBaseTable.meta.columnLetter}\$$_lastRowBase,LEFT(\$${ColumnPresupuestoTable.meta.columnLetter}$x,4),BASE!\$N\$$_rowInit:\$N\$$_lastRowBase,${ColumnPresupuestoHeader.ocupadoValue.columnLetter}\$${RowPresupuestoHeader.rowCuatro.rowIndex}),0)+
        IF(TRIM(LEFT(\$${ColumnPresupuestoTable.clasificador.columnLetter}$x,9))=BASE!\$${ColumnBaseHeader.clasificadorAguinaldoValue.columnLetter}\$${RowPresupuestoHeader.rowCuatro.rowIndex},SUMIFS(BASE!\$${ColumnBaseTable.aguinaldoAnual.columnLetter}\$$_rowInit:\$${ColumnBaseTable.aguinaldoAnual.columnLetter}\$$_lastRowBase,BASE!\$${ColumnBaseTable.fuente.columnLetter}\$$_rowInit:\$${ColumnBaseTable.fuente.columnLetter}\$$_lastRowBase,\$${ColumnPresupuestoTable.fuente.columnLetter}$x,BASE!\$${ColumnBaseTable.producto.columnLetter}\$$_rowInit:\$${ColumnBaseTable.producto.columnLetter}\$$_lastRowBase,\$${ColumnPresupuestoTable.producto.columnLetter}$x,BASE!\$${ColumnBaseTable.meta.columnLetter}\$$_rowInit:\$${ColumnBaseTable.meta.columnLetter}\$$_lastRowBase,LEFT(\$${ColumnPresupuestoTable.meta.columnLetter}$x,4),BASE!\$N\$$_rowInit:\$N\$$_lastRowBase,${ColumnPresupuestoHeader.ocupadoValue.columnLetter}\$${RowPresupuestoHeader.rowCuatro.rowIndex}),0)+
        IF(TRIM(LEFT(\$${ColumnPresupuestoTable.clasificador.columnLetter}$x,9))=BASE!\$${ColumnBaseHeader.clasificadorSctrSaludValue.columnLetter}\$${RowPresupuestoHeader.rowCuatro.rowIndex},SUMIFS(BASE!\$${ColumnBaseTable.sctrSaludAnual.columnLetter}\$$_rowInit:\$${ColumnBaseTable.sctrSaludAnual.columnLetter}\$$_lastRowBase,BASE!\$${ColumnBaseTable.fuente.columnLetter}\$$_rowInit:\$${ColumnBaseTable.fuente.columnLetter}\$$_lastRowBase,\$${ColumnPresupuestoTable.fuente.columnLetter}$x,BASE!\$${ColumnBaseTable.producto.columnLetter}\$$_rowInit:\$${ColumnBaseTable.producto.columnLetter}\$$_lastRowBase,\$${ColumnPresupuestoTable.producto.columnLetter}$x,BASE!\$${ColumnBaseTable.meta.columnLetter}\$$_rowInit:\$${ColumnBaseTable.meta.columnLetter}\$$_lastRowBase,LEFT(\$${ColumnPresupuestoTable.meta.columnLetter}$x,4),BASE!\$N\$$_rowInit:\$N\$$_lastRowBase,${ColumnPresupuestoHeader.ocupadoValue.columnLetter}\$${RowPresupuestoHeader.rowCuatro.rowIndex}),0)''';

    // VACANTE
    // CANTIDAD
    page
        .getRangeByName(
            '${ColumnPresupuestoHeader.vacanteValue.columnLetter}${RowPresupuestoHeader.rowCuatro.rowIndex}')
        .setText('VACANTE');
    page
            .getRangeByName(
                '${ColumnPresupuestoTable.vCantidad.columnLetter}$x')
            .formula =
        '''=IF(TRIM(LEFT(\$${ColumnPresupuestoTable.clasificador.columnLetter}$x,9))=BASE!\$${ColumnBaseHeader.clasificadorSueldoValue.columnLetter}\$${RowPresupuestoHeader.rowCuatro.rowIndex},COUNTIFS(BASE!\$${ColumnBaseTable.fuente.columnLetter}\$$_rowInit:\$${ColumnBaseTable.fuente.columnLetter}\$$_lastRowBase,\$${ColumnPresupuestoTable.fuente.columnLetter}$x,BASE!\$${ColumnBaseTable.producto.columnLetter}\$$_rowInit:\$${ColumnBaseTable.producto.columnLetter}\$$_lastRowBase,\$${ColumnPresupuestoTable.producto.columnLetter}$x,BASE!\$${ColumnBaseTable.meta.columnLetter}\$$_rowInit:\$${ColumnBaseTable.meta.columnLetter}\$$_lastRowBase,LEFT(\$${ColumnPresupuestoTable.meta.columnLetter}$x,4),BASE!\$${ColumnBaseTable.estadoOpp.columnLetter}\$$_rowInit:\$${ColumnBaseTable.estadoOpp.columnLetter}\$$_lastRowBase,\$${ColumnPresupuestoHeader.vacanteValue.columnLetter}\$${RowPresupuestoHeader.rowCuatro.rowIndex}),0)
        ''';
    // MONTO VACANTE
    page
            .getRangeByName(
                '${ColumnPresupuestoTable.vProyeccion.columnLetter}$x')
            .formula =
        '''=IF(TRIM(LEFT(\$${ColumnPresupuestoTable.clasificador.columnLetter}$x,9))=BASE!\$${ColumnBaseHeader.clasificadorSueldoValue.columnLetter}\$${RowPresupuestoHeader.rowCuatro.rowIndex},SUMIFS(BASE!\$${ColumnBaseTable.montoAnual.columnLetter}\$$_rowInit:\$${ColumnBaseTable.montoAnual.columnLetter}\$$_lastRowBase,BASE!\$${ColumnBaseTable.fuente.columnLetter}\$$_rowInit:\$${ColumnBaseTable.fuente.columnLetter}\$$_lastRowBase,\$${ColumnPresupuestoTable.fuente.columnLetter}$x,BASE!\$${ColumnBaseTable.producto.columnLetter}\$$_rowInit:\$${ColumnBaseTable.producto.columnLetter}\$$_lastRowBase,\$${ColumnPresupuestoTable.producto.columnLetter}$x,BASE!\$${ColumnBaseTable.meta.columnLetter}\$$_rowInit:\$${ColumnBaseTable.meta.columnLetter}\$$_lastRowBase,LEFT(\$${ColumnPresupuestoTable.meta.columnLetter}$x,4),BASE!\$N\$$_rowInit:\$N\$$_lastRowBase,${ColumnPresupuestoHeader.vacanteValue.columnLetter}\$${RowPresupuestoHeader.rowCuatro.rowIndex}),0)+
        IF(TRIM(LEFT(\$${ColumnPresupuestoTable.clasificador.columnLetter}$x,9))=BASE!\$${ColumnBaseHeader.clasificadorEssaludValue.columnLetter}\$${RowPresupuestoHeader.rowCuatro.rowIndex},SUMIFS(BASE!\$${ColumnBaseTable.essaludAnual.columnLetter}\$$_rowInit:\$${ColumnBaseTable.essaludAnual.columnLetter}\$$_lastRowBase,BASE!\$${ColumnBaseTable.fuente.columnLetter}\$$_rowInit:\$${ColumnBaseTable.fuente.columnLetter}\$$_lastRowBase,\$${ColumnPresupuestoTable.fuente.columnLetter}$x,BASE!\$${ColumnBaseTable.producto.columnLetter}\$$_rowInit:\$${ColumnBaseTable.producto.columnLetter}\$$_lastRowBase,\$${ColumnPresupuestoTable.producto.columnLetter}$x,BASE!\$${ColumnBaseTable.meta.columnLetter}\$$_rowInit:\$${ColumnBaseTable.meta.columnLetter}\$$_lastRowBase,LEFT(\$${ColumnPresupuestoTable.meta.columnLetter}$x,4),BASE!\$N\$$_rowInit:\$N\$$_lastRowBase,${ColumnPresupuestoHeader.vacanteValue.columnLetter}\$${RowPresupuestoHeader.rowCuatro.rowIndex}),0)+
        IF(TRIM(LEFT(\$${ColumnPresupuestoTable.clasificador.columnLetter}$x,9))=BASE!\$${ColumnBaseHeader.clasificadorAguinaldoValue.columnLetter}\$${RowPresupuestoHeader.rowCuatro.rowIndex},SUMIFS(BASE!\$${ColumnBaseTable.aguinaldoAnual.columnLetter}\$$_rowInit:\$${ColumnBaseTable.aguinaldoAnual.columnLetter}\$$_lastRowBase,BASE!\$${ColumnBaseTable.fuente.columnLetter}\$$_rowInit:\$${ColumnBaseTable.fuente.columnLetter}\$$_lastRowBase,\$${ColumnPresupuestoTable.fuente.columnLetter}$x,BASE!\$${ColumnBaseTable.producto.columnLetter}\$$_rowInit:\$${ColumnBaseTable.producto.columnLetter}\$$_lastRowBase,\$${ColumnPresupuestoTable.producto.columnLetter}$x,BASE!\$${ColumnBaseTable.meta.columnLetter}\$$_rowInit:\$${ColumnBaseTable.meta.columnLetter}\$$_lastRowBase,LEFT(\$${ColumnPresupuestoTable.meta.columnLetter}$x,4),BASE!\$N\$$_rowInit:\$N\$$_lastRowBase,${ColumnPresupuestoHeader.vacanteValue.columnLetter}\$${RowPresupuestoHeader.rowCuatro.rowIndex}),0)+
        IF(TRIM(LEFT(\$${ColumnPresupuestoTable.clasificador.columnLetter}$x,9))=BASE!${ColumnBaseHeader.clasificadorSctrSaludValue.columnLetter}\$${RowPresupuestoHeader.rowCuatro.rowIndex},SUMIFS(BASE!\$${ColumnBaseTable.sctrSaludAnual.columnLetter}\$$_rowInit:\$${ColumnBaseTable.sctrSaludAnual.columnLetter}\$$_lastRowBase,BASE!\$${ColumnBaseTable.fuente.columnLetter}\$$_rowInit:\$${ColumnBaseTable.fuente.columnLetter}\$$_lastRowBase,\$${ColumnPresupuestoTable.fuente.columnLetter}$x,BASE!\$${ColumnBaseTable.producto.columnLetter}\$$_rowInit:\$${ColumnBaseTable.producto.columnLetter}\$$_lastRowBase,\$${ColumnPresupuestoTable.producto.columnLetter}$x,BASE!\$${ColumnBaseTable.meta.columnLetter}\$$_rowInit:\$${ColumnBaseTable.meta.columnLetter}\$$_lastRowBase,LEFT(\$${ColumnPresupuestoTable.meta.columnLetter}$x,4),BASE!\$N\$$_rowInit:\$N\$$_lastRowBase,${ColumnPresupuestoHeader.vacanteValue.columnLetter}\$${RowPresupuestoHeader.rowCuatro.rowIndex}),0)''';

    page
            .getRangeByName('${ColumnPresupuestoTable.cantidad.columnLetter}$x')
            .formula =
        '=\$${ColumnPresupuestoTable.oCantidad.columnLetter}$x+\$${ColumnPresupuestoTable.vCantidad.columnLetter}$x';
    page
            .getRangeByName('${ColumnPresupuestoTable.proyeccion.columnLetter}$x')
            .formula =
        '=\$${ColumnPresupuestoTable.oProyeccion.columnLetter}$x+\$${ColumnPresupuestoTable.vProyeccion.columnLetter}$x';
    page
            .getRangeByName(
                '${ColumnPresupuestoTable.totalProyeccion.columnLetter}$x')
            .formula =
        '=\$${ColumnPresupuestoTable.devengado.columnLetter}$x+\$${ColumnPresupuestoTable.proyeccion.columnLetter}$x';
    page
            .getRangeByName('${ColumnPresupuestoTable.saldo.columnLetter}$x')
            .formula =
        '=\$${ColumnPresupuestoTable.pim.columnLetter}$x-\$${ColumnPresupuestoTable.totalProyeccion.columnLetter}$x'; */

    // OCUPADO
    // CANTIDAD
    buildColumnCantidad(page, x, _rowInit, _lastRowBase,
        ColumnPresupuestoTable.oCantidad.columnLetter, 'OCUPADO');
    // MONTO OCUPADO
    buildColumnMonto(
        page,
        x,
        _rowInit,
        _lastRowBase,
        ColumnPresupuestoTable.oProyeccion.columnLetter,
        ColumnPresupuestoHeader.ocupadoValue.columnLetter);

    // VACANTE
    // CANTIDAD
    buildColumnCantidad(page, x, _rowInit, _lastRowBase,
        ColumnPresupuestoTable.vCantidad.columnLetter, 'VACANTE');
    // MONTO VACANTE
    buildColumnMonto(
        page,
        x,
        _rowInit,
        _lastRowBase,
        ColumnPresupuestoTable.vProyeccion.columnLetter,
        ColumnPresupuestoHeader.vacanteValue.columnLetter);

    // CONFIANZA
    // CANTIDAD
    buildColumnCantidad(page, x, _rowInit, _lastRowBase,
        ColumnPresupuestoTable.cCantidad.columnLetter, 'CONFIANZA');
    // MONTO VACANTE
    buildColumnMonto(
        page,
        x,
        _rowInit,
        _lastRowBase,
        ColumnPresupuestoTable.cProyeccion.columnLetter,
        ColumnPresupuestoHeader.confianzaValue.columnLetter);

// RESERVADO
    // CANTIDAD
    buildColumnCantidad(page, x, _rowInit, _lastRowBase,
        ColumnPresupuestoTable.rCantidad.columnLetter, 'RESERVADO');
    // MONTO VACANTE
    buildColumnMonto(
        page,
        x,
        _rowInit,
        _lastRowBase,
        ColumnPresupuestoTable.rProyeccion.columnLetter,
        ColumnPresupuestoHeader.reservadoValue.columnLetter);

    // NUEVO
    // CANTIDAD
    buildColumnCantidad(page, x, _rowInit, _lastRowBase,
        ColumnPresupuestoTable.nCantidad.columnLetter, 'NUEVO');
    // MONTO VACANTE
    buildColumnMonto(
        page,
        x,
        _rowInit,
        _lastRowBase,
        ColumnPresupuestoTable.nProyeccion.columnLetter,
        ColumnPresupuestoHeader.nuevoValue.columnLetter);

    buildColumnTotal(page, x);
  }

  // SE TIENE QUE CREAR REGISTROS EN CERO , SINO EXISTE EN PRESUPUESTO, PERO SI EN LA PROYECCION
  // POR EJEMPLO FALTA ANCASH 23.28.12
}

void buildColumnCantidad(Worksheet page, int x, int _rowInit, int _lastRowBase,
    String _columnEstado, String _estadoOpp) {
  page
      .getRangeByName(
          '${_columnEstado}${RowPresupuestoHeader.rowCuatro.rowIndex}')
      .setText(_estadoOpp);
  page.getRangeByName('${_columnEstado}$x').formula =
      '''=IF(TRIM(LEFT(\$${ColumnPresupuestoTable.clasificador.columnLetter}$x,9))=BASE!\$${ColumnBaseHeader.clasificadorSueldoValue.columnLetter}\$${RowPresupuestoHeader.rowCuatro.rowIndex},COUNTIFS(BASE!\$${ColumnBaseTable.fuente.columnLetter}\$$_rowInit:\$${ColumnBaseTable.fuente.columnLetter}\$$_lastRowBase,\$${ColumnPresupuestoTable.fuente.columnLetter}$x,BASE!\$${ColumnBaseTable.producto.columnLetter}\$$_rowInit:\$${ColumnBaseTable.producto.columnLetter}\$$_lastRowBase,\$${ColumnPresupuestoTable.producto.columnLetter}$x,BASE!\$${ColumnBaseTable.meta.columnLetter}\$$_rowInit:\$${ColumnBaseTable.meta.columnLetter}\$$_lastRowBase,LEFT(\$${ColumnPresupuestoTable.meta.columnLetter}$x,4),BASE!\$${ColumnBaseTable.estadoOpp.columnLetter}\$$_rowInit:\$${ColumnBaseTable.estadoOpp.columnLetter}\$$_lastRowBase,\$${_columnEstado}\$${RowPresupuestoHeader.rowCuatro.rowIndex}),0)
      ''';
}

void buildColumnMonto(Worksheet page, int x, int _rowInit, int _lastRowBase,
    String _columnMonto, String _columnEstado) {
  page.getRangeByName('${_columnMonto}$x').formula =
      '''=IF(TRIM(LEFT(\$${ColumnPresupuestoTable.clasificador.columnLetter}$x,9))=BASE!\$${ColumnBaseHeader.clasificadorSueldoValue.columnLetter}\$${RowPresupuestoHeader.rowCuatro.rowIndex},SUMIFS(BASE!\$${ColumnBaseTable.montoAnual.columnLetter}\$$_rowInit:\$${ColumnBaseTable.montoAnual.columnLetter}\$$_lastRowBase,BASE!\$${ColumnBaseTable.fuente.columnLetter}\$$_rowInit:\$${ColumnBaseTable.fuente.columnLetter}\$$_lastRowBase,\$${ColumnPresupuestoTable.fuente.columnLetter}$x,BASE!\$${ColumnBaseTable.producto.columnLetter}\$$_rowInit:\$${ColumnBaseTable.producto.columnLetter}\$$_lastRowBase,\$${ColumnPresupuestoTable.producto.columnLetter}$x,BASE!\$${ColumnBaseTable.meta.columnLetter}\$$_rowInit:\$${ColumnBaseTable.meta.columnLetter}\$$_lastRowBase,LEFT(\$${ColumnPresupuestoTable.meta.columnLetter}$x,4),BASE!\$${ColumnBaseTable.estadoOpp.columnLetter}\$$_rowInit:\$${ColumnBaseTable.estadoOpp.columnLetter}\$$_lastRowBase,${_columnEstado}\$${RowPresupuestoHeader.rowCuatro.rowIndex}),0)+
      IF(TRIM(LEFT(\$${ColumnPresupuestoTable.clasificador.columnLetter}$x,9))=BASE!\$${ColumnBaseHeader.clasificadorEssaludValue.columnLetter}\$${RowPresupuestoHeader.rowCuatro.rowIndex},SUMIFS(BASE!\$${ColumnBaseTable.essaludAnual.columnLetter}\$$_rowInit:\$${ColumnBaseTable.essaludAnual.columnLetter}\$$_lastRowBase,BASE!\$${ColumnBaseTable.fuente.columnLetter}\$$_rowInit:\$${ColumnBaseTable.fuente.columnLetter}\$$_lastRowBase,\$${ColumnPresupuestoTable.fuente.columnLetter}$x,BASE!\$${ColumnBaseTable.producto.columnLetter}\$$_rowInit:\$${ColumnBaseTable.producto.columnLetter}\$$_lastRowBase,\$${ColumnPresupuestoTable.producto.columnLetter}$x,BASE!\$${ColumnBaseTable.meta.columnLetter}\$$_rowInit:\$${ColumnBaseTable.meta.columnLetter}\$$_lastRowBase,LEFT(\$${ColumnPresupuestoTable.meta.columnLetter}$x,4),BASE!\$${ColumnBaseTable.estadoOpp.columnLetter}\$$_rowInit:\$${ColumnBaseTable.estadoOpp.columnLetter}\$$_lastRowBase,${_columnEstado}\$${RowPresupuestoHeader.rowCuatro.rowIndex}),0)+
      IF(TRIM(LEFT(\$${ColumnPresupuestoTable.clasificador.columnLetter}$x,9))=BASE!\$${ColumnBaseHeader.clasificadorAguinaldoValue.columnLetter}\$${RowPresupuestoHeader.rowCuatro.rowIndex},SUMIFS(BASE!\$${ColumnBaseTable.aguinaldoAnual.columnLetter}\$$_rowInit:\$${ColumnBaseTable.aguinaldoAnual.columnLetter}\$$_lastRowBase,BASE!\$${ColumnBaseTable.fuente.columnLetter}\$$_rowInit:\$${ColumnBaseTable.fuente.columnLetter}\$$_lastRowBase,\$${ColumnPresupuestoTable.fuente.columnLetter}$x,BASE!\$${ColumnBaseTable.producto.columnLetter}\$$_rowInit:\$${ColumnBaseTable.producto.columnLetter}\$$_lastRowBase,\$${ColumnPresupuestoTable.producto.columnLetter}$x,BASE!\$${ColumnBaseTable.meta.columnLetter}\$$_rowInit:\$${ColumnBaseTable.meta.columnLetter}\$$_lastRowBase,LEFT(\$${ColumnPresupuestoTable.meta.columnLetter}$x,4),BASE!\$${ColumnBaseTable.estadoOpp.columnLetter}\$$_rowInit:\$${ColumnBaseTable.estadoOpp.columnLetter}\$$_lastRowBase,${_columnEstado}\$${RowPresupuestoHeader.rowCuatro.rowIndex}),0)+
      IF(TRIM(LEFT(\$${ColumnPresupuestoTable.clasificador.columnLetter}$x,9))=BASE!${ColumnBaseHeader.clasificadorSctrSaludValue.columnLetter}\$${RowPresupuestoHeader.rowCuatro.rowIndex},SUMIFS(BASE!\$${ColumnBaseTable.sctrSaludAnual.columnLetter}\$$_rowInit:\$${ColumnBaseTable.sctrSaludAnual.columnLetter}\$$_lastRowBase,BASE!\$${ColumnBaseTable.fuente.columnLetter}\$$_rowInit:\$${ColumnBaseTable.fuente.columnLetter}\$$_lastRowBase,\$${ColumnPresupuestoTable.fuente.columnLetter}$x,BASE!\$${ColumnBaseTable.producto.columnLetter}\$$_rowInit:\$${ColumnBaseTable.producto.columnLetter}\$$_lastRowBase,\$${ColumnPresupuestoTable.producto.columnLetter}$x,BASE!\$${ColumnBaseTable.meta.columnLetter}\$$_rowInit:\$${ColumnBaseTable.meta.columnLetter}\$$_lastRowBase,LEFT(\$${ColumnPresupuestoTable.meta.columnLetter}$x,4),BASE!\$${ColumnBaseTable.estadoOpp.columnLetter}\$$_rowInit:\$${ColumnBaseTable.estadoOpp.columnLetter}\$$_lastRowBase,${_columnEstado}\$${RowPresupuestoHeader.rowCuatro.rowIndex}),0)''';
}

void buildColumnTotal(Worksheet page, int x) {
  //CANTIDAD
  page
          .getRangeByName('${ColumnPresupuestoTable.cantidad.columnLetter}$x')
          .formula = '''=\$${ColumnPresupuestoTable.oCantidad.columnLetter}$x
          +\$${ColumnPresupuestoTable.vCantidad.columnLetter}$x
          +\$${ColumnPresupuestoTable.cCantidad.columnLetter}$x
          +\$${ColumnPresupuestoTable.rCantidad.columnLetter}$x
          +\$${ColumnPresupuestoTable.nCantidad.columnLetter}$x
           ''';
  // PROYECCION
  page
          .getRangeByName('${ColumnPresupuestoTable.proyeccion.columnLetter}$x')
          .formula = '''=\$${ColumnPresupuestoTable.oProyeccion.columnLetter}$x
        +\$${ColumnPresupuestoTable.vProyeccion.columnLetter}$x
        +\$${ColumnPresupuestoTable.cProyeccion.columnLetter}$x
        +\$${ColumnPresupuestoTable.rProyeccion.columnLetter}$x
        +\$${ColumnPresupuestoTable.nProyeccion.columnLetter}$x
        ''';
  // TOTAL EJECUCION
  page
          .getRangeByName(
              '${ColumnPresupuestoTable.totalProyeccion.columnLetter}$x')
          .formula =
      '=\$${ColumnPresupuestoTable.devengado.columnLetter}$x+\$${ColumnPresupuestoTable.proyeccion.columnLetter}$x';
  // SALDO
  page
          .getRangeByName('${ColumnPresupuestoTable.saldo.columnLetter}$x')
          .formula =
      '=\$${ColumnPresupuestoTable.pim.columnLetter}$x-\$${ColumnPresupuestoTable.totalProyeccion.columnLetter}$x';
}

_fuenteMetaOfBase(Worksheet _sheetBase, List<PresupuestoCasEntity> _params) {
  // RO
  List<PresupuestoCasEntity> presupuestoOrderByFuenteRO = _params
      .where((e) => e.fuente == 'RO')
      .where((element) => element.meta.isNotEmpty)
      .toList();

  presupuestoOrderByFuenteRO.sort((a, b) => a.meta.compareTo(b.meta));

  var presupuestoOrderByFuenteMetaRO = groupBy(
      presupuestoOrderByFuenteRO, (PresupuestoCasEntity item) => item.meta);

  // RDR
  List<PresupuestoCasEntity> presupuestoOrderByFuenteRDR = _params
      .where((e) => e.fuente == 'RDR')
      .where((element) => element.meta.isNotEmpty)
      .toList();

  presupuestoOrderByFuenteRDR.sort((a, b) => a.meta.compareTo(b.meta));

  var presupuestoOrderByFuenteMetaRDR = groupBy(
      presupuestoOrderByFuenteRDR, (PresupuestoCasEntity item) => item.meta);

  presupuestoOrderByFuenteMetaRO.entries.forEach((e) {
    if (e.value.isNotEmpty) {
      var foundEspecifica11 =
          e.value.where((element) => element.clasificador.contains('23.28.11'));
      if (foundEspecifica11.isEmpty) {
        addClasificadorInPresupuesto(_params, e.value[0],
            '23.28.11 - CONTRATO ADMINISTRATIVO DE SERVICIOS');
      }

      final foundEspecifica12 =
          e.value.where((element) => element.clasificador.contains('23.28.12'));
      if (foundEspecifica12.isEmpty) {
        addClasificadorInPresupuesto(_params, e.value[0],
            '23.28.12 - CONTRIBUCIONES A ESSALUD DE C.A.S.');
      }

      final foundEspecifica14 =
          e.value.where((element) => element.clasificador.contains('23.28.14'));
      if (foundEspecifica14.isEmpty) {
        addClasificadorInPresupuesto(
            _params, e.value[0], '23.28.14 - AGUINALDOS DE C.A.S.');
      }
    }
  });

  presupuestoOrderByFuenteMetaRDR.entries.forEach((e) {
    if (e.value.isNotEmpty) {
      var foundEspecifica11 =
          e.value.where((element) => element.clasificador.contains('23.28.11'));
      if (foundEspecifica11.isEmpty) {
        addClasificadorInPresupuesto(_params, e.value[0],
            '23.28.11 - CONTRATO ADMINISTRATIVO DE SERVICIOS');
      }

      final foundEspecifica12 =
          e.value.where((element) => element.clasificador.contains('23.28.12'));
      if (foundEspecifica12.isEmpty) {
        addClasificadorInPresupuesto(_params, e.value[0],
            '23.28.12 - CONTRIBUCIONES A ESSALUD DE C.A.S.');
      }

      final foundEspecifica14 =
          e.value.where((element) => element.clasificador.contains('23.28.14'));
      if (foundEspecifica14.isEmpty) {
        addClasificadorInPresupuesto(
            _params, e.value[0], '23.28.14 - AGUINALDOS DE C.A.S.');
      }
    }
  });
}

fuenteMetaOfPresupuesto(
    // Presupuesto y Certificado tienen la misma estructura de datos, se usa PresupuestoCasEntity  ... revisar nombres en lo posterior
    List<BaseCasEntity> _baseCas,
    List<PresupuestoCasEntity> _params) {
  for (int x = 0; x < _baseCas.length - 1; x++) {
    var nose = _params.firstWhereOrNull((element) {
      //print('${element.fuente} - ${_baseCas[x].fuenteBase}');
      //print('${element.meta} - ${_baseCas[x].meta}');
      return element.fuente == _baseCas[x].fuenteBase &&
          element.meta.contains(_baseCas[x].meta);
    });
    if (nose == null) {
      addClasificadorInPresupuestoLey(_params, _baseCas[x],
          '23.28.11 - CONTRATO ADMINISTRATIVO DE SERVICIOS');
      addClasificadorInPresupuestoLey(_params, _baseCas[x],
          '23.28.12 - CONTRIBUCIONES A ESSALUD DE C.A.S.');
      addClasificadorInPresupuestoLey(
          _params, _baseCas[x], '23.28.14 - AGUINALDOS DE C.A.S.');
/*       addClasificadorInPresupuestoLey(
          _params, _baseCas[x], '23.26.34 - SEGUROS PERSONALES'); */
    }
  }
}
