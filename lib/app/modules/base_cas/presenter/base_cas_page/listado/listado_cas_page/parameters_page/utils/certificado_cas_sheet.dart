import 'package:collection/collection.dart';
import 'package:rrhh_clean/app/modules/base_cas/domain/entities/base_cas_entity.dart';
import 'package:rrhh_clean/app/modules/base_cas/domain/entities/presupuesto_cas_entity.dart';
import 'package:rrhh_clean/app/modules/base_cas/domain/usecases/calcular_cas_use_case.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';

import 'columns_base_sheet.dart';
import 'columns_certificado_sheet.dart';
import 'functions_custom_cas.dart';

void sheetCertificado(Workbook workbook, int firstRowHeading,
    ParamsCalcular params, lastRowBase, List<BaseCasEntity> baseCas) {
  final Worksheet certificadoSheet =
      workbook.worksheets.addWithName('CERTIFICADO');
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
  certificadoSheet.importList(headerPresupuesto, firstRowHeading, 1, false);

  _fuenteMetaOfBase(baseCas, params.certificado);
  fuenteMetaOfCertifcado(baseCas, params.certificado);

  for (int index = 0; index < params.certificado.length; index++) {
    final List<Object> row =
        List.from(params.certificado[index].toMap().values.toList());

    certificadoSheet.importList(row, firstRowHeading + index + 1, 1, false);
  }

  final int _rowSum = certificadoSheet.getLastRow();

  _totalesCertificado(certificadoSheet, _rowSum);

  _proyeccion(6, 22, certificadoSheet, certificadoSheet.getLastRow() - 1,
      baseCas, lastRowBase);

  _totalesCalculo(certificadoSheet, _rowSum);
}

void _totalesCertificado(Worksheet certificadoSheet, int _rowSum) {
  certificadoSheet.getRangeByIndex(_rowSum + 1, 6).formula =
      'SUBTOTAL(9,F6:F$_rowSum)';
  certificadoSheet.getRangeByIndex(_rowSum + 1, 7).formula =
      'SUBTOTAL(9,G6:G$_rowSum)';
  certificadoSheet.getRangeByIndex(_rowSum + 1, 8).formula =
      'SUBTOTAL(9,H6:H$_rowSum)';
  certificadoSheet.getRangeByIndex(_rowSum + 1, 9).formula =
      'SUBTOTAL(9,I6:I$_rowSum)';
  certificadoSheet.getRangeByIndex(_rowSum + 1, 10).formula =
      'SUBTOTAL(9,J6:J$_rowSum)';
  certificadoSheet.getRangeByIndex(_rowSum + 1, 11).formula =
      'SUBTOTAL(9,K6:K$_rowSum)';
  certificadoSheet.getRangeByIndex(_rowSum + 1, 12).formula =
      'SUBTOTAL(9,L6:L$_rowSum)';
  certificadoSheet.getRangeByIndex(_rowSum + 1, 13).formula =
      'SUBTOTAL(9,M6:M$_rowSum)';
  certificadoSheet.getRangeByIndex(_rowSum + 1, 14).formula =
      'SUBTOTAL(9,N6:N$_rowSum)';
  certificadoSheet.getRangeByIndex(_rowSum + 1, 15).formula =
      'SUBTOTAL(9,O6:O$_rowSum)';
  certificadoSheet.getRangeByIndex(_rowSum + 1, 16).formula =
      'SUBTOTAL(9,P6:P$_rowSum)';
  certificadoSheet.getRangeByIndex(_rowSum + 1, 17).formula =
      'SUBTOTAL(9,Q6:Q$_rowSum)';
  certificadoSheet.getRangeByIndex(_rowSum + 1, 18).formula =
      'SUBTOTAL(9,R6:R$_rowSum)';
  certificadoSheet.getRangeByIndex(_rowSum + 1, 19).formula =
      'SUBTOTAL(9,S6:S$_rowSum)';
  certificadoSheet.getRangeByIndex(_rowSum + 1, 20).formula =
      'SUBTOTAL(9,T6:T$_rowSum)';
  certificadoSheet.getRangeByIndex(_rowSum + 1, 21).formula =
      'SUBTOTAL(9,U6:U$_rowSum)';
}

void _totalesCalculo(Worksheet certificadoSheet, int _rowSum) {
  certificadoSheet.getRangeByIndex(_rowSum + 1, 22).formula =
      'SUBTOTAL(9,V6:V$_rowSum)';
  certificadoSheet.getRangeByIndex(_rowSum + 1, 23).formula =
      'SUBTOTAL(9,W6:W$_rowSum)';
  certificadoSheet.getRangeByIndex(_rowSum + 1, 24).formula =
      'SUBTOTAL(9,X6:X$_rowSum)';
  certificadoSheet.getRangeByIndex(_rowSum + 1, 25).formula =
      'SUBTOTAL(9,Y6:Y$_rowSum)';
  certificadoSheet.getRangeByIndex(_rowSum + 1, 26).formula =
      'SUBTOTAL(9,Z6:Z$_rowSum)';
  certificadoSheet.getRangeByIndex(_rowSum + 1, 27).formula =
      'SUBTOTAL(9,AA6:AA$_rowSum)';
  certificadoSheet.getRangeByIndex(_rowSum + 1, 28).formula =
      'SUBTOTAL(9,AB6:AB$_rowSum)';
  certificadoSheet.getRangeByIndex(_rowSum + 1, 29).formula =
      'SUBTOTAL(9,AC6:AC$_rowSum)';
  certificadoSheet.getRangeByIndex(_rowSum + 1, 30).formula =
      'SUBTOTAL(9,AD6:AD$_rowSum)';
  certificadoSheet.getRangeByIndex(_rowSum + 1, 31).formula =
      'SUBTOTAL(9,AE6:AE$_rowSum)';
  certificadoSheet.getRangeByIndex(_rowSum + 1, 32).formula =
      'SUBTOTAL(9,AF6:AF$_rowSum)';
  certificadoSheet.getRangeByIndex(_rowSum + 1, 33).formula =
      'SUBTOTAL(9,AG6:AG$_rowSum)';
  certificadoSheet.getRangeByIndex(_rowSum + 1, 34).formula =
      'SUBTOTAL(9,AH6:AH$_rowSum)';
  certificadoSheet.getRangeByIndex(_rowSum + 1, 35).formula =
      'SUBTOTAL(9,AI6:AI$_rowSum)';
  certificadoSheet.getRangeByIndex(_rowSum + 1, 36).formula =
      'SUBTOTAL(9,AJ6:AJ$_rowSum)';
  certificadoSheet.getRangeByIndex(_rowSum + 1, 37).formula =
      'SUBTOTAL(9,AK6:AK$_rowSum)';
  
  certificadoSheet.getRangeByName('F6:U${_rowSum + 1}').numberFormat =
      '#,##0.00';
  certificadoSheet.getRangeByName('W6:W${_rowSum + 1}').numberFormat =
      '#,##0.00';
  certificadoSheet.getRangeByName('Y6:Y${_rowSum + 1}').numberFormat =
      '#,##0.00';
  certificadoSheet.getRangeByName('AA6:AA${_rowSum + 1}').numberFormat =
      '#,##0.00';
  certificadoSheet.getRangeByName('AC6:AC${_rowSum + 1}').numberFormat =
      '#,##0.00';
  certificadoSheet.getRangeByName('AE6:AE${_rowSum + 1}').numberFormat =
      '#,##0.00';
  certificadoSheet.getRangeByName('AG6:AK${_rowSum + 1}').numberFormat =
      '#,##0.00';
  certificadoSheet.getRangeByName('AI6:AI${_rowSum + 1}').numberFormat =
      '#,##0.00';
  certificadoSheet.getRangeByName('A6:AE${_rowSum + 1}').autoFit();
}

_proyeccion(int _rowInit, int _column, Worksheet page, int _rowEnd, _baseCas,
    int _lastRowBase) {
  for (int x = _rowInit; x <= _rowEnd; x++) {
    page
            .getRangeByName(
                '${ColumnCertificadoTable.tCantidad.columnLetter}$x')
            .formula =
        '''=IF(TRIM(LEFT(\$${ColumnCertificadoTable.clasificador.columnLetter}$x,9))=BASE!\$${ColumnBaseHeader.clasificadorSueldoValue.columnLetter}\$${RowCertificadoHeader.rowCuatro.rowIndex},COUNTIFS(BASE!\$${ColumnBaseTable.fuente.columnLetter}\$$_rowInit:\$${ColumnBaseTable.fuente.columnLetter}\$$_lastRowBase,\$${ColumnCertificadoTable.fuente.columnLetter}$x,BASE!\$${ColumnBaseTable.producto.columnLetter}\$$_rowInit:\$${ColumnBaseTable.producto.columnLetter}\$$_lastRowBase,\$${ColumnCertificadoTable.producto.columnLetter}$x,BASE!\$${ColumnBaseTable.meta.columnLetter}\$$_rowInit:\$${ColumnBaseTable.meta.columnLetter}\$$_lastRowBase,LEFT(\$${ColumnCertificadoTable.meta.columnLetter}$x,4)),0)
        ''';

    page
            .getRangeByName(
                '${ColumnCertificadoTable.tProyeccion.columnLetter}$x')
            .formula =
        '''=IF(TRIM(LEFT(\$${ColumnCertificadoTable.clasificador.columnLetter}$x,9))=BASE!\$${ColumnBaseHeader.clasificadorSueldoValue.columnLetter}\$${RowCertificadoHeader.rowCuatro.rowIndex},SUMIFS(BASE!\$${ColumnBaseTable.montoAnual.columnLetter}\$$_rowInit:\$${ColumnBaseTable.montoAnual.columnLetter}\$$_lastRowBase,BASE!\$${ColumnBaseTable.fuente.columnLetter}\$$_rowInit:\$${ColumnBaseTable.fuente.columnLetter}\$$_lastRowBase,\$${ColumnCertificadoTable.fuente.columnLetter}$x,BASE!\$${ColumnBaseTable.producto.columnLetter}\$$_rowInit:\$${ColumnBaseTable.producto.columnLetter}\$$_lastRowBase,\$${ColumnCertificadoTable.producto.columnLetter}$x,BASE!\$${ColumnBaseTable.meta.columnLetter}\$$_rowInit:\$${ColumnBaseTable.meta.columnLetter}\$$_lastRowBase,LEFT(\$${ColumnCertificadoTable.meta.columnLetter}$x,4)),0)+
        IF(TRIM(LEFT(\$${ColumnCertificadoTable.clasificador.columnLetter}$x,9))=BASE!\$${ColumnBaseHeader.clasificadorEssaludValue.columnLetter}\$${RowCertificadoHeader.rowCuatro.rowIndex},SUMIFS(BASE!\$${ColumnBaseTable.essaludAnual.columnLetter}\$$_rowInit:\$${ColumnBaseTable.essaludAnual.columnLetter}\$$_lastRowBase,BASE!\$${ColumnBaseTable.fuente.columnLetter}\$$_rowInit:\$${ColumnBaseTable.fuente.columnLetter}\$$_lastRowBase,\$${ColumnCertificadoTable.fuente.columnLetter}$x,BASE!\$${ColumnBaseTable.producto.columnLetter}\$$_rowInit:\$${ColumnBaseTable.producto.columnLetter}\$$_lastRowBase,\$${ColumnCertificadoTable.producto.columnLetter}$x,BASE!\$${ColumnBaseTable.meta.columnLetter}\$$_rowInit:\$${ColumnBaseTable.meta.columnLetter}\$$_lastRowBase,LEFT(\$${ColumnCertificadoTable.meta.columnLetter}$x,4)),0)+
        IF(TRIM(LEFT(\$${ColumnCertificadoTable.clasificador.columnLetter}$x,9))=BASE!\$${ColumnBaseHeader.clasificadorAguinaldoValue.columnLetter}\$${RowCertificadoHeader.rowCuatro.rowIndex},SUMIFS(BASE!\$${ColumnBaseTable.aguinaldoAnual.columnLetter}\$$_rowInit:\$${ColumnBaseTable.aguinaldoAnual.columnLetter}\$$_lastRowBase,BASE!\$${ColumnBaseTable.fuente.columnLetter}\$$_rowInit:\$${ColumnBaseTable.fuente.columnLetter}\$$_lastRowBase,\$${ColumnCertificadoTable.fuente.columnLetter}$x,BASE!\$${ColumnBaseTable.producto.columnLetter}\$$_rowInit:\$${ColumnBaseTable.producto.columnLetter}\$$_lastRowBase,\$${ColumnCertificadoTable.producto.columnLetter}$x,BASE!\$${ColumnBaseTable.meta.columnLetter}\$$_rowInit:\$${ColumnBaseTable.meta.columnLetter}\$$_lastRowBase,LEFT(\$${ColumnCertificadoTable.meta.columnLetter}$x,4)),0)+
        IF(TRIM(LEFT(\$${ColumnCertificadoTable.clasificador.columnLetter}$x,9))=BASE!\$${ColumnBaseHeader.clasificadorSctrSaludValue.columnLetter}\$${RowCertificadoHeader.rowCuatro.rowIndex},SUMIFS(BASE!\$${ColumnBaseTable.sctrSaludAnual.columnLetter}\$$_rowInit:\$${ColumnBaseTable.sctrSaludAnual.columnLetter}\$$_lastRowBase,BASE!\$${ColumnBaseTable.fuente.columnLetter}\$$_rowInit:\$${ColumnBaseTable.fuente.columnLetter}\$$_lastRowBase,\$${ColumnCertificadoTable.fuente.columnLetter}$x,BASE!\$${ColumnBaseTable.producto.columnLetter}\$$_rowInit:\$${ColumnBaseTable.producto.columnLetter}\$$_lastRowBase,\$${ColumnCertificadoTable.producto.columnLetter}$x,BASE!\$${ColumnBaseTable.meta.columnLetter}\$$_rowInit:\$${ColumnBaseTable.meta.columnLetter}\$$_lastRowBase,LEFT(\$${ColumnCertificadoTable.meta.columnLetter}$x,4)),0)''';

/*     // OCUPADOS
    // CANTIDAD
    page
        .getRangeByName(
            '${ColumnCertificadoHeader.ocupadoValue.columnLetter}${RowCertificadoHeader.rowCuatro.rowIndex}')
        .setText('OCUPADO');
    page
            .getRangeByName(
                '${ColumnCertificadoTable.oCantidad.columnLetter}$x')
            .formula =
        '''=IF(TRIM(LEFT(\$${ColumnCertificadoTable.clasificador.columnLetter}$x,9))=BASE!\$${ColumnBaseHeader.clasificadorSueldoValue.columnLetter}\$${RowCertificadoHeader.rowCuatro.rowIndex},COUNTIFS(BASE!\$${ColumnBaseTable.fuente.columnLetter}\$$_rowInit:\$${ColumnBaseTable.fuente.columnLetter}\$$_lastRowBase,\$${ColumnCertificadoTable.fuente.columnLetter}$x,BASE!\$${ColumnBaseTable.producto.columnLetter}\$$_rowInit:\$${ColumnBaseTable.producto.columnLetter}\$$_lastRowBase,\$${ColumnCertificadoTable.producto.columnLetter}$x,BASE!\$${ColumnBaseTable.meta.columnLetter}\$$_rowInit:\$${ColumnBaseTable.meta.columnLetter}\$$_lastRowBase,LEFT(\$${ColumnCertificadoTable.meta.columnLetter}$x,4),BASE!\$${ColumnBaseTable.estadoOpp.columnLetter}\$$_rowInit:\$${ColumnBaseTable.estadoOpp.columnLetter}\$$_lastRowBase,\$${ColumnCertificadoHeader.ocupadoValue.columnLetter}\$${RowCertificadoHeader.rowCuatro.rowIndex}),0)
        ''';
    // MONTO OCUPADO
    page
            .getRangeByName(
                '${ColumnCertificadoTable.oProyeccion.columnLetter}$x')
            .formula =
        '''=IF(TRIM(LEFT(\$${ColumnCertificadoTable.clasificador.columnLetter}$x,9))=BASE!\$${ColumnBaseHeader.clasificadorSueldoValue.columnLetter}\$${RowCertificadoHeader.rowCuatro.rowIndex},SUMIFS(BASE!\$${ColumnBaseTable.montoAnual.columnLetter}\$$_rowInit:\$${ColumnBaseTable.montoAnual.columnLetter}\$$_lastRowBase,BASE!\$${ColumnBaseTable.fuente.columnLetter}\$$_rowInit:\$${ColumnBaseTable.fuente.columnLetter}\$$_lastRowBase,\$${ColumnCertificadoTable.fuente.columnLetter}$x,BASE!\$${ColumnBaseTable.producto.columnLetter}\$$_rowInit:\$${ColumnBaseTable.producto.columnLetter}\$$_lastRowBase,\$${ColumnCertificadoTable.producto.columnLetter}$x,BASE!\$${ColumnBaseTable.meta.columnLetter}\$$_rowInit:\$${ColumnBaseTable.meta.columnLetter}\$$_lastRowBase,LEFT(\$${ColumnCertificadoTable.meta.columnLetter}$x,4),BASE!\$N\$$_rowInit:\$N\$$_lastRowBase,${ColumnCertificadoHeader.ocupadoValue.columnLetter}\$${RowCertificadoHeader.rowCuatro.rowIndex}),0)+
        IF(TRIM(LEFT(\$${ColumnCertificadoTable.clasificador.columnLetter}$x,9))=BASE!\$${ColumnBaseHeader.clasificadorEssaludValue.columnLetter}\$${RowCertificadoHeader.rowCuatro.rowIndex},SUMIFS(BASE!\$${ColumnBaseTable.essaludAnual.columnLetter}\$$_rowInit:\$${ColumnBaseTable.essaludAnual.columnLetter}\$$_lastRowBase,BASE!\$${ColumnBaseTable.fuente.columnLetter}\$$_rowInit:\$${ColumnBaseTable.fuente.columnLetter}\$$_lastRowBase,\$${ColumnCertificadoTable.fuente.columnLetter}$x,BASE!\$${ColumnBaseTable.producto.columnLetter}\$$_rowInit:\$${ColumnBaseTable.producto.columnLetter}\$$_lastRowBase,\$${ColumnCertificadoTable.producto.columnLetter}$x,BASE!\$${ColumnBaseTable.meta.columnLetter}\$$_rowInit:\$${ColumnBaseTable.meta.columnLetter}\$$_lastRowBase,LEFT(\$${ColumnCertificadoTable.meta.columnLetter}$x,4),BASE!\$N\$$_rowInit:\$N\$$_lastRowBase,${ColumnCertificadoHeader.ocupadoValue.columnLetter}\$${RowCertificadoHeader.rowCuatro.rowIndex}),0)+
        IF(TRIM(LEFT(\$${ColumnCertificadoTable.clasificador.columnLetter}$x,9))=BASE!\$${ColumnBaseHeader.clasificadorAguinaldoValue.columnLetter}\$${RowCertificadoHeader.rowCuatro.rowIndex},SUMIFS(BASE!\$${ColumnBaseTable.aguinaldoAnual.columnLetter}\$$_rowInit:\$${ColumnBaseTable.aguinaldoAnual.columnLetter}\$$_lastRowBase,BASE!\$${ColumnBaseTable.fuente.columnLetter}\$$_rowInit:\$${ColumnBaseTable.fuente.columnLetter}\$$_lastRowBase,\$${ColumnCertificadoTable.fuente.columnLetter}$x,BASE!\$${ColumnBaseTable.producto.columnLetter}\$$_rowInit:\$${ColumnBaseTable.producto.columnLetter}\$$_lastRowBase,\$${ColumnCertificadoTable.producto.columnLetter}$x,BASE!\$${ColumnBaseTable.meta.columnLetter}\$$_rowInit:\$${ColumnBaseTable.meta.columnLetter}\$$_lastRowBase,LEFT(\$${ColumnCertificadoTable.meta.columnLetter}$x,4),BASE!\$N\$$_rowInit:\$N\$$_lastRowBase,${ColumnCertificadoHeader.ocupadoValue.columnLetter}\$${RowCertificadoHeader.rowCuatro.rowIndex}),0)+
        IF(TRIM(LEFT(\$${ColumnCertificadoTable.clasificador.columnLetter}$x,9))=BASE!\$${ColumnBaseHeader.clasificadorSctrSaludValue.columnLetter}\$${RowCertificadoHeader.rowCuatro.rowIndex},SUMIFS(BASE!\$${ColumnBaseTable.sctrSaludAnual.columnLetter}\$$_rowInit:\$${ColumnBaseTable.sctrSaludAnual.columnLetter}\$$_lastRowBase,BASE!\$${ColumnBaseTable.fuente.columnLetter}\$$_rowInit:\$${ColumnBaseTable.fuente.columnLetter}\$$_lastRowBase,\$${ColumnCertificadoTable.fuente.columnLetter}$x,BASE!\$${ColumnBaseTable.producto.columnLetter}\$$_rowInit:\$${ColumnBaseTable.producto.columnLetter}\$$_lastRowBase,\$${ColumnCertificadoTable.producto.columnLetter}$x,BASE!\$${ColumnBaseTable.meta.columnLetter}\$$_rowInit:\$${ColumnBaseTable.meta.columnLetter}\$$_lastRowBase,LEFT(\$${ColumnCertificadoTable.meta.columnLetter}$x,4),BASE!\$N\$$_rowInit:\$N\$$_lastRowBase,${ColumnCertificadoHeader.ocupadoValue.columnLetter}\$${RowCertificadoHeader.rowCuatro.rowIndex}),0)''';
 */

    // OCUPADO
    // CANTIDAD
    buildColumnCantidad(page, x, _rowInit, _lastRowBase,
        ColumnCertificadoTable.oCantidad.columnLetter, 'OCUPADO');
    // MONTO OCUPADO
    buildColumnMonto(
        page,
        x,
        _rowInit,
        _lastRowBase,
        ColumnCertificadoTable.oProyeccion.columnLetter,
        ColumnCertificadoHeader.ocupadoValue.columnLetter);

    // VACANTE
    // CANTIDAD
    buildColumnCantidad(page, x, _rowInit, _lastRowBase,
        ColumnCertificadoTable.vCantidad.columnLetter, 'VACANTE');
    // MONTO VACANTE
    buildColumnMonto(
        page,
        x,
        _rowInit,
        _lastRowBase,
        ColumnCertificadoTable.vProyeccion.columnLetter,
        ColumnCertificadoHeader.vacanteValue.columnLetter);

    // CONFIANZA
    // CANTIDAD
    buildColumnCantidad(page, x, _rowInit, _lastRowBase,
        ColumnCertificadoTable.cCantidad.columnLetter, 'CONFIANZA');
    // MONTO VACANTE
    buildColumnMonto(
        page,
        x,
        _rowInit,
        _lastRowBase,
        ColumnCertificadoTable.cProyeccion.columnLetter,
        ColumnCertificadoHeader.confianzaValue.columnLetter);

// RESERVADO
    // CANTIDAD
    buildColumnCantidad(page, x, _rowInit, _lastRowBase,
        ColumnCertificadoTable.rCantidad.columnLetter, 'RESERVADO');
    // MONTO VACANTE
    buildColumnMonto(
        page,
        x,
        _rowInit,
        _lastRowBase,
        ColumnCertificadoTable.rProyeccion.columnLetter,
        ColumnCertificadoHeader.reservadoValue.columnLetter);

    // NUEVO
    // CANTIDAD
    buildColumnCantidad(page, x, _rowInit, _lastRowBase,
        ColumnCertificadoTable.nCantidad.columnLetter, 'NUEVO');
    // MONTO VACANTE
    buildColumnMonto(
        page,
        x,
        _rowInit,
        _lastRowBase,
        ColumnCertificadoTable.nProyeccion.columnLetter,
        ColumnCertificadoHeader.nuevoValue.columnLetter);

    buildColumnTotal(page, x);
  }

  // SE TIENE QUE CREAR REGISTROS EN CERO , SINO EXISTE EN PRESUPUESTO, PERO SI EN LA PROYECCION
  // POR EJEMPLO FALTA ANCASH 23.28.12
}

void buildColumnCantidad(Worksheet page, int x, int _rowInit, int _lastRowBase,
    String _columnEstado, String _estadoOpp) {
  page
      .getRangeByName(
          '${_columnEstado}${RowCertificadoHeader.rowCuatro.rowIndex}')
      .setText(_estadoOpp);
  page.getRangeByName('${_columnEstado}$x').formula =
      '''=IF(TRIM(LEFT(\$${ColumnCertificadoTable.clasificador.columnLetter}$x,9))=BASE!\$${ColumnBaseHeader.clasificadorSueldoValue.columnLetter}\$${RowCertificadoHeader.rowCuatro.rowIndex},COUNTIFS(BASE!\$${ColumnBaseTable.fuente.columnLetter}\$$_rowInit:\$${ColumnBaseTable.fuente.columnLetter}\$$_lastRowBase,\$${ColumnCertificadoTable.fuente.columnLetter}$x,BASE!\$${ColumnBaseTable.producto.columnLetter}\$$_rowInit:\$${ColumnBaseTable.producto.columnLetter}\$$_lastRowBase,\$${ColumnCertificadoTable.producto.columnLetter}$x,BASE!\$${ColumnBaseTable.meta.columnLetter}\$$_rowInit:\$${ColumnBaseTable.meta.columnLetter}\$$_lastRowBase,LEFT(\$${ColumnCertificadoTable.meta.columnLetter}$x,4),BASE!\$${ColumnBaseTable.estadoOpp.columnLetter}\$$_rowInit:\$${ColumnBaseTable.estadoOpp.columnLetter}\$$_lastRowBase,\$${_columnEstado}\$${RowCertificadoHeader.rowCuatro.rowIndex}),0)
      ''';
}

void buildColumnMonto(Worksheet page, int x, int _rowInit, int _lastRowBase,
    String _columnMonto, String _columnEstado) {
  page.getRangeByName('${_columnMonto}$x').formula =
      '''=IF(TRIM(LEFT(\$${ColumnCertificadoTable.clasificador.columnLetter}$x,9))=BASE!\$${ColumnBaseHeader.clasificadorSueldoValue.columnLetter}\$${RowCertificadoHeader.rowCuatro.rowIndex},SUMIFS(BASE!\$${ColumnBaseTable.montoAnual.columnLetter}\$$_rowInit:\$${ColumnBaseTable.montoAnual.columnLetter}\$$_lastRowBase,BASE!\$${ColumnBaseTable.fuente.columnLetter}\$$_rowInit:\$${ColumnBaseTable.fuente.columnLetter}\$$_lastRowBase,\$${ColumnCertificadoTable.fuente.columnLetter}$x,BASE!\$${ColumnBaseTable.producto.columnLetter}\$$_rowInit:\$${ColumnBaseTable.producto.columnLetter}\$$_lastRowBase,\$${ColumnCertificadoTable.producto.columnLetter}$x,BASE!\$${ColumnBaseTable.meta.columnLetter}\$$_rowInit:\$${ColumnBaseTable.meta.columnLetter}\$$_lastRowBase,LEFT(\$${ColumnCertificadoTable.meta.columnLetter}$x,4),BASE!\$${ColumnBaseTable.estadoOpp.columnLetter}\$$_rowInit:\$${ColumnBaseTable.estadoOpp.columnLetter}\$$_lastRowBase,${_columnEstado}\$${RowCertificadoHeader.rowCuatro.rowIndex}),0)+
      IF(TRIM(LEFT(\$${ColumnCertificadoTable.clasificador.columnLetter}$x,9))=BASE!\$${ColumnBaseHeader.clasificadorEssaludValue.columnLetter}\$${RowCertificadoHeader.rowCuatro.rowIndex},SUMIFS(BASE!\$${ColumnBaseTable.essaludAnual.columnLetter}\$$_rowInit:\$${ColumnBaseTable.essaludAnual.columnLetter}\$$_lastRowBase,BASE!\$${ColumnBaseTable.fuente.columnLetter}\$$_rowInit:\$${ColumnBaseTable.fuente.columnLetter}\$$_lastRowBase,\$${ColumnCertificadoTable.fuente.columnLetter}$x,BASE!\$${ColumnBaseTable.producto.columnLetter}\$$_rowInit:\$${ColumnBaseTable.producto.columnLetter}\$$_lastRowBase,\$${ColumnCertificadoTable.producto.columnLetter}$x,BASE!\$${ColumnBaseTable.meta.columnLetter}\$$_rowInit:\$${ColumnBaseTable.meta.columnLetter}\$$_lastRowBase,LEFT(\$${ColumnCertificadoTable.meta.columnLetter}$x,4),BASE!\$${ColumnBaseTable.estadoOpp.columnLetter}\$$_rowInit:\$${ColumnBaseTable.estadoOpp.columnLetter}\$$_lastRowBase,${_columnEstado}\$${RowCertificadoHeader.rowCuatro.rowIndex}),0)+
      IF(TRIM(LEFT(\$${ColumnCertificadoTable.clasificador.columnLetter}$x,9))=BASE!\$${ColumnBaseHeader.clasificadorAguinaldoValue.columnLetter}\$${RowCertificadoHeader.rowCuatro.rowIndex},SUMIFS(BASE!\$${ColumnBaseTable.aguinaldoAnual.columnLetter}\$$_rowInit:\$${ColumnBaseTable.aguinaldoAnual.columnLetter}\$$_lastRowBase,BASE!\$${ColumnBaseTable.fuente.columnLetter}\$$_rowInit:\$${ColumnBaseTable.fuente.columnLetter}\$$_lastRowBase,\$${ColumnCertificadoTable.fuente.columnLetter}$x,BASE!\$${ColumnBaseTable.producto.columnLetter}\$$_rowInit:\$${ColumnBaseTable.producto.columnLetter}\$$_lastRowBase,\$${ColumnCertificadoTable.producto.columnLetter}$x,BASE!\$${ColumnBaseTable.meta.columnLetter}\$$_rowInit:\$${ColumnBaseTable.meta.columnLetter}\$$_lastRowBase,LEFT(\$${ColumnCertificadoTable.meta.columnLetter}$x,4),BASE!\$${ColumnBaseTable.estadoOpp.columnLetter}\$$_rowInit:\$${ColumnBaseTable.estadoOpp.columnLetter}\$$_lastRowBase,${_columnEstado}\$${RowCertificadoHeader.rowCuatro.rowIndex}),0)+
      IF(TRIM(LEFT(\$${ColumnCertificadoTable.clasificador.columnLetter}$x,9))=BASE!${ColumnBaseHeader.clasificadorSctrSaludValue.columnLetter}\$${RowCertificadoHeader.rowCuatro.rowIndex},SUMIFS(BASE!\$${ColumnBaseTable.sctrSaludAnual.columnLetter}\$$_rowInit:\$${ColumnBaseTable.sctrSaludAnual.columnLetter}\$$_lastRowBase,BASE!\$${ColumnBaseTable.fuente.columnLetter}\$$_rowInit:\$${ColumnBaseTable.fuente.columnLetter}\$$_lastRowBase,\$${ColumnCertificadoTable.fuente.columnLetter}$x,BASE!\$${ColumnBaseTable.producto.columnLetter}\$$_rowInit:\$${ColumnBaseTable.producto.columnLetter}\$$_lastRowBase,\$${ColumnCertificadoTable.producto.columnLetter}$x,BASE!\$${ColumnBaseTable.meta.columnLetter}\$$_rowInit:\$${ColumnBaseTable.meta.columnLetter}\$$_lastRowBase,LEFT(\$${ColumnCertificadoTable.meta.columnLetter}$x,4),BASE!\$${ColumnBaseTable.estadoOpp.columnLetter}\$$_rowInit:\$${ColumnBaseTable.estadoOpp.columnLetter}\$$_lastRowBase,${_columnEstado}\$${RowCertificadoHeader.rowCuatro.rowIndex}),0)''';
}

void buildColumnTotal(Worksheet page, int x) {
  //CANTIDAD
  page
          .getRangeByName('${ColumnCertificadoTable.cantidad.columnLetter}$x')
          .formula = '''=\$${ColumnCertificadoTable.oCantidad.columnLetter}$x
          +\$${ColumnCertificadoTable.vCantidad.columnLetter}$x
          +\$${ColumnCertificadoTable.cCantidad.columnLetter}$x
          +\$${ColumnCertificadoTable.rCantidad.columnLetter}$x
          +\$${ColumnCertificadoTable.nCantidad.columnLetter}$x
           ''';
  // PROYECCION
  page
          .getRangeByName('${ColumnCertificadoTable.proyeccion.columnLetter}$x')
          .formula = '''=\$${ColumnCertificadoTable.oProyeccion.columnLetter}$x
        +\$${ColumnCertificadoTable.vProyeccion.columnLetter}$x
        +\$${ColumnCertificadoTable.cProyeccion.columnLetter}$x
        +\$${ColumnCertificadoTable.rProyeccion.columnLetter}$x
        +\$${ColumnCertificadoTable.nProyeccion.columnLetter}$x
        ''';
  // TOTAL EJECUCION
  page
          .getRangeByName(
              '${ColumnCertificadoTable.totalProyeccion.columnLetter}$x')
          .formula =
      '=\$${ColumnCertificadoTable.devengado.columnLetter}$x+\$${ColumnCertificadoTable.proyeccion.columnLetter}$x';
  // SALDO
  page
          .getRangeByName('${ColumnCertificadoTable.saldo.columnLetter}$x')
          .formula =
      '=\$${ColumnCertificadoTable.certificado.columnLetter}$x-\$${ColumnCertificadoTable.totalProyeccion.columnLetter}$x';
}

_fuenteMetaOfBase(
    // Presupuesto y Certificado tienen la misma estructura de datos, se usa PresupuestoCasEntity  ... revisar nombres en lo posterior
    List<BaseCasEntity> _baseCas,
    List<PresupuestoCasEntity> _params) {
  // RO
  List<PresupuestoCasEntity> certificadoOrderByFuenteRO = _params
      .where((e) => e.fuente == 'RO')
      .where((element) => element.meta.isNotEmpty)
      .toList();

  certificadoOrderByFuenteRO.sort((a, b) => a.meta.compareTo(b.meta));

  var certificadoOrderByFuenteMetaRO = groupBy(
      certificadoOrderByFuenteRO, (PresupuestoCasEntity item) => item.meta);

  // RDR
  List<PresupuestoCasEntity> certificadoOrderByFuenteRDR = _params
      .where((e) => e.fuente == 'RDR')
      .where((element) => element.meta.isNotEmpty)
      .toList();

  certificadoOrderByFuenteRDR.sort((a, b) => a.meta.compareTo(b.meta));

  var certificadoOrderByFuenteMetaRDR = groupBy(
      certificadoOrderByFuenteRDR, (PresupuestoCasEntity item) => item.meta);

  certificadoOrderByFuenteMetaRO.entries.forEach((e) {
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

      final foundEspecifica34 =
          e.value.where((element) => element.clasificador.contains('23.26.34'));
      if (foundEspecifica34.isEmpty) {
        addClasificadorInPresupuesto(
            _params, e.value[0], '23.26.34 - SEGUROS PERSONALES');
      }
    }
  });

  certificadoOrderByFuenteMetaRDR.entries.forEach((e) {
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

      final foundEspecifica34 =
          e.value.where((element) => element.clasificador.contains('23.26.34'));
      if (foundEspecifica34.isEmpty) {
        addClasificadorInPresupuesto(
            _params, e.value[0], '23.26.34 - SEGUROS PERSONALES');
      }
    }
  });
}

// Funcion que revisa que todas las metas de la base esten el Certificado
fuenteMetaOfCertifcado(
    // Presupuesto y Certificado tienen la misma estructura de datos, se usa PresupuestoCasEntity  ... revisar nombres en lo posterior
    List<BaseCasEntity> _baseCas,
    List<PresupuestoCasEntity> _params) {
  for (int x = 0; x < _baseCas.length - 1; x++) {
    var nose = _params.firstWhereOrNull((element) {
      return element.fuente == _baseCas[x].fuenteBase &&
          element.meta.contains(_baseCas[x].meta);
    });
    if (nose == null) {
      addClasificadorInCertificado(_params, _baseCas[x],
          '23.28.11 - CONTRATO ADMINISTRATIVO DE SERVICIOS');
      addClasificadorInCertificado(_params, _baseCas[x],
          '23.28.12 - CONTRIBUCIONES A ESSALUD DE C.A.S.');
      addClasificadorInCertificado(
          _params, _baseCas[x], '23.28.14 - AGUINALDOS DE C.A.S.');
      addClasificadorInCertificado(
          _params, _baseCas[x], '23.26.34 - SEGUROS PERSONALES');
    }
  }
}
