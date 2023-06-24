import 'package:collection/collection.dart';
import 'package:rrhh_clean/app/modules/base_cas/domain/entities/base_cas_entity.dart';
import 'package:rrhh_clean/app/modules/base_cas/domain/entities/presupuesto_cas_entity.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';

import '../column_prac_base_header.dart';
import '../column_prac_base_table.dart';
import '../export_prac_use_case.dart';
import '../practicante_entity.dart';
import 'columns_certificado_prac_sheet.dart';
import 'functions_custom_prac.dart';

void sheetPracCertificado(Workbook workbook, int firstRowHeading,
    ParamsPracCalcular params, int lastRowBase, List<PracticanteEntity> baseCas) {
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

  //_fuenteMetaOfBase(baseCas, params.certificado);
  //fuenteMetaOfCertifcado(baseCas, params.certificado);


  for (int index = 0; index < params.certificado.length; index++) {
    final List<Object> row =
        List.from(params.certificado[index].toMap().values.toList());

    certificadoSheet.importList(row, firstRowHeading + index + 1, 1, false);
  }

  final int _rowSum = certificadoSheet.getLastRow();

  //_totalesCertificado(certificadoSheet, _rowSum);

  //_proyeccion(6, 22, certificadoSheet, certificadoSheet.getLastRow() - 1, baseCas, lastRowBase);

  //_totalesCalculo(certificadoSheet, _rowSum);
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
                '${ColumnCertificadoPracTable.tCantidad.columnLetter}$x')
            .formula =
        '''=IF(TRIM(LEFT(\$${ColumnCertificadoPracTable.clasificador.columnLetter}$x,9))=BASE!\$${ParameterPracBaseHeader.clasificadorSubvencion.columnLetter}\$${RowCertificadoPracHeader.rowCuatro.rowIndex},COUNTIFS(BASE!\$${ColumnPracBaseTable.fuente.columnLetter}\$$_rowInit:\$${ColumnPracBaseTable.fuente.columnLetter}\$$_lastRowBase,\$${ColumnCertificadoPracTable.fuente.columnLetter}$x,BASE!\$${ColumnPracBaseTable.producto.columnLetter}\$$_rowInit:\$${ColumnPracBaseTable.producto.columnLetter}\$$_lastRowBase,\$${ColumnCertificadoPracTable.producto.columnLetter}$x,BASE!\$${ColumnPracBaseTable.meta.columnLetter}\$$_rowInit:\$${ColumnPracBaseTable.meta.columnLetter}\$$_lastRowBase,LEFT(\$${ColumnCertificadoPracTable.meta.columnLetter}$x,4)),0)
        ''';

    page
            .getRangeByName(
                '${ColumnCertificadoPracTable.tProyeccion.columnLetter}$x')
            .formula =
        '''=IF(TRIM(LEFT(\$${ColumnCertificadoPracTable.clasificador.columnLetter}$x,9))=BASE!\$${ParameterPracBaseHeader.clasificadorSubvencion.columnLetter}\$${RowCertificadoPracHeader.rowCuatro.rowIndex},SUMIFS(BASE!\$${ColumnPracBaseTable.subvencionAnual.columnLetter}\$$_rowInit:\$${ColumnPracBaseTable.subvencionAnual.columnLetter}\$$_lastRowBase,BASE!\$${ColumnPracBaseTable.fuente.columnLetter}\$$_rowInit:\$${ColumnPracBaseTable.fuente.columnLetter}\$$_lastRowBase,\$${ColumnCertificadoPracTable.fuente.columnLetter}$x,BASE!\$${ColumnPracBaseTable.producto.columnLetter}\$$_rowInit:\$${ColumnPracBaseTable.producto.columnLetter}\$$_lastRowBase,\$${ColumnCertificadoPracTable.producto.columnLetter}$x,BASE!\$${ColumnPracBaseTable.meta.columnLetter}\$$_rowInit:\$${ColumnPracBaseTable.meta.columnLetter}\$$_lastRowBase,LEFT(\$${ColumnCertificadoPracTable.meta.columnLetter}$x,4)),0)+
        IF(TRIM(LEFT(\$${ColumnCertificadoPracTable.clasificador.columnLetter}$x,9))=BASE!\$${ParameterPracBaseHeader.clasificadorMediaSubvencion.columnLetter}\$${RowCertificadoPracHeader.rowCuatro.rowIndex},SUMIFS(BASE!\$${ColumnPracBaseTable.mediaSubvencionAnual.columnLetter}\$$_rowInit:\$${ColumnPracBaseTable.mediaSubvencionAnual.columnLetter}\$$_lastRowBase,BASE!\$${ColumnPracBaseTable.fuente.columnLetter}\$$_rowInit:\$${ColumnPracBaseTable.fuente.columnLetter}\$$_lastRowBase,\$${ColumnCertificadoPracTable.fuente.columnLetter}$x,BASE!\$${ColumnPracBaseTable.producto.columnLetter}\$$_rowInit:\$${ColumnPracBaseTable.producto.columnLetter}\$$_lastRowBase,\$${ColumnCertificadoPracTable.producto.columnLetter}$x,BASE!\$${ColumnPracBaseTable.meta.columnLetter}\$$_rowInit:\$${ColumnPracBaseTable.meta.columnLetter}\$$_lastRowBase,LEFT(\$${ColumnCertificadoPracTable.meta.columnLetter}$x,4)),0)
     ''';

/*     // OCUPADOS
    // CANTIDAD
    page
        .getRangeByName(
            '${ColumnCertificadoPracHeader.ocupadoValue.columnLetter}${RowCertificadoPracHeader.rowCuatro.rowIndex}')
        .setText('OCUPADO');
    page
            .getRangeByName(
                '${ColumnCertificadoPracTable.oCantidad.columnLetter}$x')
            .formula =
        '''=IF(TRIM(LEFT(\$${ColumnCertificadoPracTable.clasificador.columnLetter}$x,9))=BASE!\$${ParameterPracBaseHeader.clasificadorSueldoValue.columnLetter}\$${RowCertificadoPracHeader.rowCuatro.rowIndex},COUNTIFS(BASE!\$${ColumnPracBaseTable.fuente.columnLetter}\$$_rowInit:\$${ColumnPracBaseTable.fuente.columnLetter}\$$_lastRowBase,\$${ColumnCertificadoPracTable.fuente.columnLetter}$x,BASE!\$${ColumnPracBaseTable.producto.columnLetter}\$$_rowInit:\$${ColumnPracBaseTable.producto.columnLetter}\$$_lastRowBase,\$${ColumnCertificadoPracTable.producto.columnLetter}$x,BASE!\$${ColumnPracBaseTable.meta.columnLetter}\$$_rowInit:\$${ColumnPracBaseTable.meta.columnLetter}\$$_lastRowBase,LEFT(\$${ColumnCertificadoPracTable.meta.columnLetter}$x,4),BASE!\$${ColumnPracBaseTable.estadoOpp.columnLetter}\$$_rowInit:\$${ColumnPracBaseTable.estadoOpp.columnLetter}\$$_lastRowBase,\$${ColumnCertificadoPracHeader.ocupadoValue.columnLetter}\$${RowCertificadoPracHeader.rowCuatro.rowIndex}),0)
        ''';
    // MONTO OCUPADO
    page
            .getRangeByName(
                '${ColumnCertificadoPracTable.oProyeccion.columnLetter}$x')
            .formula =
        '''=IF(TRIM(LEFT(\$${ColumnCertificadoPracTable.clasificador.columnLetter}$x,9))=BASE!\$${ParameterPracBaseHeader.clasificadorSueldoValue.columnLetter}\$${RowCertificadoPracHeader.rowCuatro.rowIndex},SUMIFS(BASE!\$${ColumnPracBaseTable.subvencionAnual.columnLetter}\$$_rowInit:\$${ColumnPracBaseTable.subvencionAnual.columnLetter}\$$_lastRowBase,BASE!\$${ColumnPracBaseTable.fuente.columnLetter}\$$_rowInit:\$${ColumnPracBaseTable.fuente.columnLetter}\$$_lastRowBase,\$${ColumnCertificadoPracTable.fuente.columnLetter}$x,BASE!\$${ColumnPracBaseTable.producto.columnLetter}\$$_rowInit:\$${ColumnPracBaseTable.producto.columnLetter}\$$_lastRowBase,\$${ColumnCertificadoPracTable.producto.columnLetter}$x,BASE!\$${ColumnPracBaseTable.meta.columnLetter}\$$_rowInit:\$${ColumnPracBaseTable.meta.columnLetter}\$$_lastRowBase,LEFT(\$${ColumnCertificadoPracTable.meta.columnLetter}$x,4),BASE!\$N\$$_rowInit:\$N\$$_lastRowBase,${ColumnCertificadoPracHeader.ocupadoValue.columnLetter}\$${RowCertificadoPracHeader.rowCuatro.rowIndex}),0)+
        IF(TRIM(LEFT(\$${ColumnCertificadoPracTable.clasificador.columnLetter}$x,9))=BASE!\$${ParameterPracBaseHeader.clasificadorEssaludValue.columnLetter}\$${RowCertificadoPracHeader.rowCuatro.rowIndex},SUMIFS(BASE!\$${ColumnPracBaseTable.essaludAnual.columnLetter}\$$_rowInit:\$${ColumnPracBaseTable.essaludAnual.columnLetter}\$$_lastRowBase,BASE!\$${ColumnPracBaseTable.fuente.columnLetter}\$$_rowInit:\$${ColumnPracBaseTable.fuente.columnLetter}\$$_lastRowBase,\$${ColumnCertificadoPracTable.fuente.columnLetter}$x,BASE!\$${ColumnPracBaseTable.producto.columnLetter}\$$_rowInit:\$${ColumnPracBaseTable.producto.columnLetter}\$$_lastRowBase,\$${ColumnCertificadoPracTable.producto.columnLetter}$x,BASE!\$${ColumnPracBaseTable.meta.columnLetter}\$$_rowInit:\$${ColumnPracBaseTable.meta.columnLetter}\$$_lastRowBase,LEFT(\$${ColumnCertificadoPracTable.meta.columnLetter}$x,4),BASE!\$N\$$_rowInit:\$N\$$_lastRowBase,${ColumnCertificadoPracHeader.ocupadoValue.columnLetter}\$${RowCertificadoPracHeader.rowCuatro.rowIndex}),0)+
        IF(TRIM(LEFT(\$${ColumnCertificadoPracTable.clasificador.columnLetter}$x,9))=BASE!\$${ParameterPracBaseHeader.clasificadorAguinaldoValue.columnLetter}\$${RowCertificadoPracHeader.rowCuatro.rowIndex},SUMIFS(BASE!\$${ColumnPracBaseTable.aguinaldoAnual.columnLetter}\$$_rowInit:\$${ColumnPracBaseTable.aguinaldoAnual.columnLetter}\$$_lastRowBase,BASE!\$${ColumnPracBaseTable.fuente.columnLetter}\$$_rowInit:\$${ColumnPracBaseTable.fuente.columnLetter}\$$_lastRowBase,\$${ColumnCertificadoPracTable.fuente.columnLetter}$x,BASE!\$${ColumnPracBaseTable.producto.columnLetter}\$$_rowInit:\$${ColumnPracBaseTable.producto.columnLetter}\$$_lastRowBase,\$${ColumnCertificadoPracTable.producto.columnLetter}$x,BASE!\$${ColumnPracBaseTable.meta.columnLetter}\$$_rowInit:\$${ColumnPracBaseTable.meta.columnLetter}\$$_lastRowBase,LEFT(\$${ColumnCertificadoPracTable.meta.columnLetter}$x,4),BASE!\$N\$$_rowInit:\$N\$$_lastRowBase,${ColumnCertificadoPracHeader.ocupadoValue.columnLetter}\$${RowCertificadoPracHeader.rowCuatro.rowIndex}),0)+
        IF(TRIM(LEFT(\$${ColumnCertificadoPracTable.clasificador.columnLetter}$x,9))=BASE!\$${ParameterPracBaseHeader.clasificadorSctrSaludValue.columnLetter}\$${RowCertificadoPracHeader.rowCuatro.rowIndex},SUMIFS(BASE!\$${ColumnPracBaseTable.sctrSaludAnual.columnLetter}\$$_rowInit:\$${ColumnPracBaseTable.sctrSaludAnual.columnLetter}\$$_lastRowBase,BASE!\$${ColumnPracBaseTable.fuente.columnLetter}\$$_rowInit:\$${ColumnPracBaseTable.fuente.columnLetter}\$$_lastRowBase,\$${ColumnCertificadoPracTable.fuente.columnLetter}$x,BASE!\$${ColumnPracBaseTable.producto.columnLetter}\$$_rowInit:\$${ColumnPracBaseTable.producto.columnLetter}\$$_lastRowBase,\$${ColumnCertificadoPracTable.producto.columnLetter}$x,BASE!\$${ColumnPracBaseTable.meta.columnLetter}\$$_rowInit:\$${ColumnPracBaseTable.meta.columnLetter}\$$_lastRowBase,LEFT(\$${ColumnCertificadoPracTable.meta.columnLetter}$x,4),BASE!\$N\$$_rowInit:\$N\$$_lastRowBase,${ColumnCertificadoPracHeader.ocupadoValue.columnLetter}\$${RowCertificadoPracHeader.rowCuatro.rowIndex}),0)''';
 */

    // OCUPADO
    // CANTIDAD
    buildColumnCantidad(page, x, _rowInit, _lastRowBase,
        ColumnCertificadoPracTable.oCantidad.columnLetter, 'OCUPADO');
    // MONTO OCUPADO
    buildColumnMonto(
        page,
        x,
        _rowInit,
        _lastRowBase,
        ColumnCertificadoPracTable.oProyeccion.columnLetter,
        ColumnCertificadoPracHeader.ocupadoValue.columnLetter);

    // VACANTE
    // CANTIDAD
    buildColumnCantidad(page, x, _rowInit, _lastRowBase,
        ColumnCertificadoPracTable.vCantidad.columnLetter, 'VACANTE');
    // MONTO VACANTE
    buildColumnMonto(
        page,
        x,
        _rowInit,
        _lastRowBase,
        ColumnCertificadoPracTable.vProyeccion.columnLetter,
        ColumnCertificadoPracHeader.vacanteValue.columnLetter);

    // CONFIANZA
    // CANTIDAD
    buildColumnCantidad(page, x, _rowInit, _lastRowBase,
        ColumnCertificadoPracTable.cCantidad.columnLetter, 'CONFIANZA');
    // MONTO VACANTE
    buildColumnMonto(
        page,
        x,
        _rowInit,
        _lastRowBase,
        ColumnCertificadoPracTable.cProyeccion.columnLetter,
        ColumnCertificadoPracHeader.confianzaValue.columnLetter);

// RESERVADO
    // CANTIDAD
    buildColumnCantidad(page, x, _rowInit, _lastRowBase,
        ColumnCertificadoPracTable.rCantidad.columnLetter, 'RESERVADO');
    // MONTO VACANTE
    buildColumnMonto(
        page,
        x,
        _rowInit,
        _lastRowBase,
        ColumnCertificadoPracTable.rProyeccion.columnLetter,
        ColumnCertificadoPracHeader.reservadoValue.columnLetter);

    // NUEVO
    // CANTIDAD
    buildColumnCantidad(page, x, _rowInit, _lastRowBase,
        ColumnCertificadoPracTable.nCantidad.columnLetter, 'NUEVO');
    // MONTO VACANTE
    buildColumnMonto(
        page,
        x,
        _rowInit,
        _lastRowBase,
        ColumnCertificadoPracTable.nProyeccion.columnLetter,
        ColumnCertificadoPracHeader.nuevoValue.columnLetter);

    buildColumnTotal(page, x);
  }

  // SE TIENE QUE CREAR REGISTROS EN CERO , SINO EXISTE EN PRESUPUESTO, PERO SI EN LA PROYECCION
  // POR EJEMPLO FALTA ANCASH 23.28.12
}

void buildColumnCantidad(Worksheet page, int x, int _rowInit, int _lastRowBase,
    String _columnEstado, String _estadoOpp) {
  page
      .getRangeByName(
          '${_columnEstado}${RowCertificadoPracHeader.rowCuatro.rowIndex}')
      .setText(_estadoOpp);
  page.getRangeByName('${_columnEstado}$x').formula =
      '''=IF(TRIM(LEFT(\$${ColumnCertificadoPracTable.clasificador.columnLetter}$x,9))=BASE!\$${ParameterPracBaseHeader.clasificadorSubvencion.columnLetter}\$${RowCertificadoPracHeader.rowCuatro.rowIndex},COUNTIFS(BASE!\$${ColumnPracBaseTable.fuente.columnLetter}\$$_rowInit:\$${ColumnPracBaseTable.fuente.columnLetter}\$$_lastRowBase,\$${ColumnCertificadoPracTable.fuente.columnLetter}$x,BASE!\$${ColumnPracBaseTable.producto.columnLetter}\$$_rowInit:\$${ColumnPracBaseTable.producto.columnLetter}\$$_lastRowBase,\$${ColumnCertificadoPracTable.producto.columnLetter}$x,BASE!\$${ColumnPracBaseTable.meta.columnLetter}\$$_rowInit:\$${ColumnPracBaseTable.meta.columnLetter}\$$_lastRowBase,LEFT(\$${ColumnCertificadoPracTable.meta.columnLetter}$x,4),BASE!\$${ColumnPracBaseTable.estadoOpp.columnLetter}\$$_rowInit:\$${ColumnPracBaseTable.estadoOpp.columnLetter}\$$_lastRowBase,\$${_columnEstado}\$${RowCertificadoPracHeader.rowCuatro.rowIndex}),0)
      ''';
}

void buildColumnMonto(Worksheet page, int x, int _rowInit, int _lastRowBase,
    String _columnMonto, String _columnEstado) {
  page.getRangeByName('${_columnMonto}$x').formula =
      '''=IF(TRIM(LEFT(\$${ColumnCertificadoPracTable.clasificador.columnLetter}$x,9))=BASE!\$${ParameterPracBaseHeader.clasificadorSubvencion.columnLetter}\$${RowCertificadoPracHeader.rowCuatro.rowIndex},SUMIFS(BASE!\$${ColumnPracBaseTable.subvencionAnual.columnLetter}\$$_rowInit:\$${ColumnPracBaseTable.subvencionAnual.columnLetter}\$$_lastRowBase,BASE!\$${ColumnPracBaseTable.fuente.columnLetter}\$$_rowInit:\$${ColumnPracBaseTable.fuente.columnLetter}\$$_lastRowBase,\$${ColumnCertificadoPracTable.fuente.columnLetter}$x,BASE!\$${ColumnPracBaseTable.producto.columnLetter}\$$_rowInit:\$${ColumnPracBaseTable.producto.columnLetter}\$$_lastRowBase,\$${ColumnCertificadoPracTable.producto.columnLetter}$x,BASE!\$${ColumnPracBaseTable.meta.columnLetter}\$$_rowInit:\$${ColumnPracBaseTable.meta.columnLetter}\$$_lastRowBase,LEFT(\$${ColumnCertificadoPracTable.meta.columnLetter}$x,4),BASE!\$${ColumnPracBaseTable.estadoOpp.columnLetter}\$$_rowInit:\$${ColumnPracBaseTable.estadoOpp.columnLetter}\$$_lastRowBase,${_columnEstado}\$${RowCertificadoPracHeader.rowCuatro.rowIndex}),0)+
      IF(TRIM(LEFT(\$${ColumnCertificadoPracTable.clasificador.columnLetter}$x,9))=BASE!\$${ParameterPracBaseHeader.clasificadorMediaSubvencion.columnLetter}\$${RowCertificadoPracHeader.rowCuatro.rowIndex},SUMIFS(BASE!\$${ColumnPracBaseTable.mediaSubvencionAnual.columnLetter}\$$_rowInit:\$${ColumnPracBaseTable.mediaSubvencionAnual.columnLetter}\$$_lastRowBase,BASE!\$${ColumnPracBaseTable.fuente.columnLetter}\$$_rowInit:\$${ColumnPracBaseTable.fuente.columnLetter}\$$_lastRowBase,\$${ColumnCertificadoPracTable.fuente.columnLetter}$x,BASE!\$${ColumnPracBaseTable.producto.columnLetter}\$$_rowInit:\$${ColumnPracBaseTable.producto.columnLetter}\$$_lastRowBase,\$${ColumnCertificadoPracTable.producto.columnLetter}$x,BASE!\$${ColumnPracBaseTable.meta.columnLetter}\$$_rowInit:\$${ColumnPracBaseTable.meta.columnLetter}\$$_lastRowBase,LEFT(\$${ColumnCertificadoPracTable.meta.columnLetter}$x,4),BASE!\$${ColumnPracBaseTable.estadoOpp.columnLetter}\$$_rowInit:\$${ColumnPracBaseTable.estadoOpp.columnLetter}\$$_lastRowBase,${_columnEstado}\$${RowCertificadoPracHeader.rowCuatro.rowIndex}),0)
  ''';
}

void buildColumnTotal(Worksheet page, int x) {
  //CANTIDAD
  page
          .getRangeByName('${ColumnCertificadoPracTable.cantidad.columnLetter}$x')
          .formula = '''=\$${ColumnCertificadoPracTable.oCantidad.columnLetter}$x
          +\$${ColumnCertificadoPracTable.vCantidad.columnLetter}$x
          +\$${ColumnCertificadoPracTable.cCantidad.columnLetter}$x
          +\$${ColumnCertificadoPracTable.rCantidad.columnLetter}$x
          +\$${ColumnCertificadoPracTable.nCantidad.columnLetter}$x
           ''';
  // PROYECCION
  page
          .getRangeByName('${ColumnCertificadoPracTable.proyeccion.columnLetter}$x')
          .formula = '''=\$${ColumnCertificadoPracTable.oProyeccion.columnLetter}$x
        +\$${ColumnCertificadoPracTable.vProyeccion.columnLetter}$x
        +\$${ColumnCertificadoPracTable.cProyeccion.columnLetter}$x
        +\$${ColumnCertificadoPracTable.rProyeccion.columnLetter}$x
        +\$${ColumnCertificadoPracTable.nProyeccion.columnLetter}$x
        ''';
  // TOTAL EJECUCION
  page
          .getRangeByName(
              '${ColumnCertificadoPracTable.totalProyeccion.columnLetter}$x')
          .formula =
      '=\$${ColumnCertificadoPracTable.devengado.columnLetter}$x+\$${ColumnCertificadoPracTable.proyeccion.columnLetter}$x';
  // SALDO
  page
          .getRangeByName('${ColumnCertificadoPracTable.saldo.columnLetter}$x')
          .formula =
      '=\$${ColumnCertificadoPracTable.certificado.columnLetter}$x-\$${ColumnCertificadoPracTable.totalProyeccion.columnLetter}$x';
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
        addClasificadorInPresupuestoPrac(_params, e.value[0],
            '23.28.11 - CONTRATO ADMINISTRATIVO DE SERVICIOS');
      }

      final foundEspecifica12 =
          e.value.where((element) => element.clasificador.contains('23.28.12'));
      if (foundEspecifica12.isEmpty) {
        addClasificadorInPresupuestoPrac(_params, e.value[0],
            '23.28.12 - CONTRIBUCIONES A ESSALUD DE C.A.S.');
      }

      final foundEspecifica14 =
          e.value.where((element) => element.clasificador.contains('23.28.14'));
      if (foundEspecifica14.isEmpty) {
        addClasificadorInPresupuestoPrac(
            _params, e.value[0], '23.28.14 - AGUINALDOS DE C.A.S.');
      }

      final foundEspecifica34 =
          e.value.where((element) => element.clasificador.contains('23.26.34'));
      if (foundEspecifica34.isEmpty) {
        addClasificadorInPresupuestoPrac(
            _params, e.value[0], '23.26.34 - SEGUROS PERSONALES');
      }
    }
  });

  certificadoOrderByFuenteMetaRDR.entries.forEach((e) {
    if (e.value.isNotEmpty) {
      var foundEspecifica11 =
          e.value.where((element) => element.clasificador.contains('23.28.11'));
      if (foundEspecifica11.isEmpty) {
        addClasificadorInPresupuestoPrac(_params, e.value[0],
            '23.28.11 - CONTRATO ADMINISTRATIVO DE SERVICIOS');
      }

      final foundEspecifica12 =
          e.value.where((element) => element.clasificador.contains('23.28.12'));
      if (foundEspecifica12.isEmpty) {
        addClasificadorInPresupuestoPrac(_params, e.value[0],
            '23.28.12 - CONTRIBUCIONES A ESSALUD DE C.A.S.');
      }

      final foundEspecifica14 =
          e.value.where((element) => element.clasificador.contains('23.28.14'));
      if (foundEspecifica14.isEmpty) {
        addClasificadorInPresupuestoPrac(
            _params, e.value[0], '23.28.14 - AGUINALDOS DE C.A.S.');
      }

      final foundEspecifica34 =
          e.value.where((element) => element.clasificador.contains('23.26.34'));
      if (foundEspecifica34.isEmpty) {
        addClasificadorInPresupuestoPrac(
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
      addClasificadorInCertificadoPrac(_params, _baseCas[x],
          '23.28.11 - CONTRATO ADMINISTRATIVO DE SERVICIOS');
      addClasificadorInCertificadoPrac(_params, _baseCas[x],
          '23.28.12 - CONTRIBUCIONES A ESSALUD DE C.A.S.');
      addClasificadorInCertificadoPrac(
          _params, _baseCas[x], '23.28.14 - AGUINALDOS DE C.A.S.');
      addClasificadorInCertificadoPrac(
          _params, _baseCas[x], '23.26.34 - SEGUROS PERSONALES');
    }
  }
}
