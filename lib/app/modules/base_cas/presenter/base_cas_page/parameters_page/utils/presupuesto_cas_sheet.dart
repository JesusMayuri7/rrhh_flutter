import 'package:collection/collection.dart';
import 'package:rrhh_clean/app/modules/base_cas/domain/entities/presupuesto_cas_entity.dart';
import 'package:rrhh_clean/app/modules/base_cas/domain/usecases/calcular_cas_use_case.dart';
import 'package:rrhh_clean/app/modules/base_cas/presenter/base_cas_page/parameters_page/utils/functions_custom_cas.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';

import 'columns_base_sheet.dart';
import 'columns_presupuesto_sheet.dart';

void sheetPresupuestoExtend(Workbook workbook, int firstRowHeading,
    ParamsCalcular params, Worksheet sheetBase) {
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
    'Presupuesto',
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
    'Saldo'
  ];
  presupuestoSheet.importList(headerPresupuesto, firstRowHeading, 1, false);

  print('antes');
  _fuenteMetaOfBase(sheetBase, params.pim);
  print('despues');

  for (int index = 0; index < params.pim.length; index++) {
    final List<Object> row =
        List.from(params.pim[index].toMap().values.toList());

    presupuestoSheet.importList(row, firstRowHeading + index + 1, 1, false);
  }

  final int _rowSum = presupuestoSheet.getLastRow();
  print(_rowSum);

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

  presupuestoSheet.getRangeByName('F6:U${_rowSum + 1}').numberFormat =
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

    // OCUPADOS
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
        '=\$${ColumnPresupuestoTable.pim.columnLetter}$x-\$${ColumnPresupuestoTable.totalProyeccion.columnLetter}$x';
  }

  // SE TIENE QUE CREAR REGISTROS EN CERO , SINO EXISTE EN PRESUPUESTO, PERO SI EN LA PROYECCION
  // POR EJEMPLO FALTA ANCASH 23.28.12
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
