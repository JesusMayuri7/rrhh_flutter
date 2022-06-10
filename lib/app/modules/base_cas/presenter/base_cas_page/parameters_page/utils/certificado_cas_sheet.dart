import 'package:collection/collection.dart';
import 'package:rrhh_clean/app/modules/base_cas/domain/entities/presupuesto_cas_entity.dart';
import 'package:rrhh_clean/app/modules/base_cas/domain/usecases/calcular_cas_use_case.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';

void sheetCertificado(Workbook workbook, int firstRowHeading,
    ParamsCalcular params, Worksheet sheetBase) {
  final Worksheet presupuestoSheet =
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
    'Cantidad',
    'Proyeccion',
    'TotalProyeccion',
    'Saldo'
  ];
  presupuestoSheet.importList(headerPresupuesto, firstRowHeading, 1, false);

  print('antes');
  _fuenteMetaOfBase(sheetBase, params.certificado);
  print('despues');

  for (int index = 0; index < params.certificado.length; index++) {
    final List<Object> row =
        List.from(params.certificado[index].toMap().values.toList());

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
    page.getRangeByIndex(x, _column).formula =
        '''=IF(TRIM(LEFT(E$x,9))=BASE!\$Z\$4,COUNTIFS(BASE!\$F\$$_rowInit:\$F\$$_lastRowBase,CERTIFICADO!B$x,BASE!\$C\$$_rowInit:\$C\$$_lastRowBase,C$x,BASE!\$G\$$_rowInit:\$G\$$_lastRowBase,LEFT(CERTIFICADO!D$x,4)),0)
        ''';

    page.getRangeByIndex(x, _column + 1).formula =
        '''=IF(TRIM(LEFT(E$x,9))=BASE!\$Z\$4,SUMIFS(BASE!\$Z\$$_rowInit:\$Z\$$_lastRowBase,BASE!\$F\$$_rowInit:\$F\$$_lastRowBase,CERTIFICADO!B$x,BASE!\$C\$$_rowInit:\$C\$$_lastRowBase,C$x,BASE!\$G\$$_rowInit:\$G\$$_lastRowBase,LEFT(CERTIFICADO!D$x,4)),0)+
        IF(TRIM(LEFT(E$x,9))=BASE!\$AA\$4,SUMIFS(BASE!\$AA\$$_rowInit:\$AA\$$_lastRowBase,BASE!\$F\$$_rowInit:\$F\$$_lastRowBase,CERTIFICADO!B$x,BASE!\$C\$$_rowInit:\$C\$$_lastRowBase,C$x,BASE!\$G\$$_rowInit:\$G\$$_lastRowBase,LEFT(CERTIFICADO!D$x,4)),0)+
        IF(TRIM(LEFT(E$x,9))=BASE!\$AB\$4,SUMIFS(BASE!\$AB\$$_rowInit:\$AB\$$_lastRowBase,BASE!\$F\$$_rowInit:\$F\$$_lastRowBase,CERTIFICADO!B$x,BASE!\$C\$$_rowInit:\$C\$$_lastRowBase,C$x,BASE!\$G\$$_rowInit:\$G\$$_lastRowBase,LEFT(CERTIFICADO!D$x,4)),0)+
        IF(TRIM(LEFT(E$x,9))=BASE!\$AE\$4,SUMIFS(BASE!\$AE\$$_rowInit:\$AE\$$_lastRowBase,BASE!\$F\$$_rowInit:\$F\$$_lastRowBase,CERTIFICADO!B$x,BASE!\$C\$$_rowInit:\$C\$$_lastRowBase,C$x,BASE!\$G\$$_rowInit:\$G\$$_lastRowBase,LEFT(CERTIFICADO!D$x,4)),0)''';

    // OCUPADOS
    // CANTIDAD
    page.getRangeByIndex(4, _column + 2).setText('OCUPADO');
    page.getRangeByIndex(x, _column + 2).formula =
        '''=IF(TRIM(LEFT(E$x,9))=BASE!\$Z\$4,COUNTIFS(BASE!\$F\$$_rowInit:\$F\$$_lastRowBase,CERTIFICADO!B$x,BASE!\$C\$$_rowInit:\$C\$$_lastRowBase,C$x,BASE!\$G\$$_rowInit:\$G\$$_lastRowBase,LEFT(CERTIFICADO!D$x,4),BASE!\$N\$$_rowInit:\$N\$$_lastRowBase,CERTIFICADO!\$X\$4),0)
        ''';
    // MONTO OCUPADO
    page.getRangeByIndex(x, _column + 3).formula =
        '''=IF(TRIM(LEFT(E$x,9))=BASE!\$Z\$4,SUMIFS(BASE!\$Z\$$_rowInit:\$Z\$$_lastRowBase,BASE!\$F\$$_rowInit:\$F\$$_lastRowBase,CERTIFICADO!B$x,BASE!\$C\$$_rowInit:\$C\$$_lastRowBase,C$x,BASE!\$G\$$_rowInit:\$G\$$_lastRowBase,LEFT(CERTIFICADO!D$x,4),BASE!\$N\$$_rowInit:\$N\$$_lastRowBase,CERTIFICADO!\$X\$4),0)+
        IF(TRIM(LEFT(E$x,9))=BASE!\$AA\$4,SUMIFS(BASE!\$AA\$$_rowInit:\$AA\$$_lastRowBase,BASE!\$F\$$_rowInit:\$F\$$_lastRowBase,CERTIFICADO!B$x,BASE!\$C\$$_rowInit:\$C\$$_lastRowBase,C$x,BASE!\$G\$$_rowInit:\$G\$$_lastRowBase,LEFT(CERTIFICADO!D$x,4),BASE!\$N\$$_rowInit:\$N\$$_lastRowBase,CERTIFICADO!\$X\$4),0)+
        IF(TRIM(LEFT(E$x,9))=BASE!\$AB\$4,SUMIFS(BASE!\$AB\$$_rowInit:\$AB\$$_lastRowBase,BASE!\$F\$$_rowInit:\$F\$$_lastRowBase,CERTIFICADO!B$x,BASE!\$C\$$_rowInit:\$C\$$_lastRowBase,C$x,BASE!\$G\$$_rowInit:\$G\$$_lastRowBase,LEFT(CERTIFICADO!D$x,4),BASE!\$N\$$_rowInit:\$N\$$_lastRowBase,CERTIFICADO!\$X\$4),0)+
        IF(TRIM(LEFT(E$x,9))=BASE!\$AE\$4,SUMIFS(BASE!\$AE\$$_rowInit:\$AE\$$_lastRowBase,BASE!\$F\$$_rowInit:\$F\$$_lastRowBase,CERTIFICADO!B$x,BASE!\$C\$$_rowInit:\$C\$$_lastRowBase,C$x,BASE!\$G\$$_rowInit:\$G\$$_lastRowBase,LEFT(CERTIFICADO!D$x,4),BASE!\$N\$$_rowInit:\$N\$$_lastRowBase,CERTIFICADO!\$X\$4),0)''';

    // VACANTE
    // CANTIDAD
    page.getRangeByIndex(4, _column + 4).setText('VACANTE');
    page.getRangeByIndex(x, _column + 4).formula =
        '''=IF(TRIM(LEFT(E$x,9))=BASE!\$Z\$4,COUNTIFS(BASE!\$F\$$_rowInit:\$F\$$_lastRowBase,CERTIFICADO!B$x,BASE!\$C\$$_rowInit:\$C\$$_lastRowBase,C$x,BASE!\$G\$$_rowInit:\$G\$$_lastRowBase,LEFT(CERTIFICADO!D$x,4),BASE!\$N\$$_rowInit:\$N\$$_lastRowBase,CERTIFICADO!\$Z\$4),0)
        ''';
    // MONTO VACANTE
    page.getRangeByIndex(x, _column + 5).formula =
        '''=IF(TRIM(LEFT(E$x,9))=BASE!\$Z\$4,SUMIFS(BASE!\$Z\$$_rowInit:\$Z\$$_lastRowBase,BASE!\$F\$$_rowInit:\$F\$$_lastRowBase,CERTIFICADO!B$x,BASE!\$C\$$_rowInit:\$C\$$_lastRowBase,C$x,BASE!\$G\$$_rowInit:\$G\$$_lastRowBase,LEFT(CERTIFICADO!D$x,4),BASE!\$N\$$_rowInit:\$N\$$_lastRowBase,CERTIFICADO!\$Z\$4),0)+
        IF(TRIM(LEFT(E$x,9))=BASE!\$AA\$4,SUMIFS(BASE!\$AA\$$_rowInit:\$AA\$$_lastRowBase,BASE!\$F\$$_rowInit:\$F\$$_lastRowBase,CERTIFICADO!B$x,BASE!\$C\$$_rowInit:\$C\$$_lastRowBase,C$x,BASE!\$G\$$_rowInit:\$G\$$_lastRowBase,LEFT(CERTIFICADO!D$x,4),BASE!\$N\$$_rowInit:\$N\$$_lastRowBase,CERTIFICADO!\$Z\$4),0)+
        IF(TRIM(LEFT(E$x,9))=BASE!\$AB\$4,SUMIFS(BASE!\$AB\$$_rowInit:\$AB\$$_lastRowBase,BASE!\$F\$$_rowInit:\$F\$$_lastRowBase,CERTIFICADO!B$x,BASE!\$C\$$_rowInit:\$C\$$_lastRowBase,C$x,BASE!\$G\$$_rowInit:\$G\$$_lastRowBase,LEFT(CERTIFICADO!D$x,4),BASE!\$N\$$_rowInit:\$N\$$_lastRowBase,CERTIFICADO!\$Z\$4),0)+
        IF(TRIM(LEFT(E$x,9))=BASE!\$AE\$4,SUMIFS(BASE!\$AE\$$_rowInit:\$AE\$$_lastRowBase,BASE!\$F\$$_rowInit:\$F\$$_lastRowBase,CERTIFICADO!B$x,BASE!\$C\$$_rowInit:\$C\$$_lastRowBase,C$x,BASE!\$G\$$_rowInit:\$G\$$_lastRowBase,LEFT(CERTIFICADO!D$x,4),BASE!\$N\$$_rowInit:\$N\$$_lastRowBase,CERTIFICADO!\$Z\$4),0)''';

    page.getRangeByIndex(x, _column + 6).formula = '=X$x+Z$x';
    page.getRangeByIndex(x, _column + 7).formula = '=Y$x+AA$x';
    page.getRangeByIndex(x, _column + 8).formula = '=I$x+AC$x';
    page.getRangeByIndex(x, _column + 9).formula = '=H$x-AD$x';
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
        _params.add(PresupuestoCasEntity(
            anoEje: e.value[0].anoEje,
            fuente: e.value[0].fuente,
            producto: e.value[0].producto,
            meta: e.value[0].meta,
            clasificador: '23.28.11'));
      }

      final foundEspecifica12 = e.value.where((element) =>
          element.clasificador.substring(0, 8).trim() == '23.28.12');
      if (foundEspecifica12.isEmpty) {
        _params.add(PresupuestoCasEntity(
            anoEje: e.value[0].anoEje,
            fuente: e.value[0].fuente,
            producto: e.value[0].producto,
            meta: e.value[0].meta,
            clasificador: '23.28.12'));
      }

      final foundEspecifica14 = e.value.where((element) =>
          element.clasificador.substring(0, 8).trim() == '23.28.14');
      if (foundEspecifica14.isEmpty) {
        _params.add(PresupuestoCasEntity(
            anoEje: e.value[0].anoEje,
            fuente: e.value[0].fuente,
            producto: e.value[0].producto,
            meta: e.value[0].meta,
            clasificador: '23.28.14'));
      }
    }
  });

  presupuestoOrderByFuenteMetaRDR.entries.forEach((e) {
    if (e.value.isNotEmpty) {
      var foundEspecifica11 = e.value.where((element) =>
          element.clasificador.substring(0, 8).trim() == '23.28.11');
      if (foundEspecifica11.isEmpty) {
        _params.add(PresupuestoCasEntity(
            anoEje: e.value[0].anoEje,
            fuente: e.value[0].fuente,
            producto: e.value[0].producto,
            meta: e.value[0].meta,
            clasificador: '23.28.11'));
      }

      final foundEspecifica12 = e.value.where((element) =>
          element.clasificador.substring(0, 8).trim() == '23.28.12');
      if (foundEspecifica12.isEmpty) {
        _params.add(PresupuestoCasEntity(
            anoEje: e.value[0].anoEje,
            fuente: e.value[0].fuente,
            producto: e.value[0].producto,
            meta: e.value[0].meta,
            clasificador: '23.28.12'));
      }

      final foundEspecifica14 = e.value.where((element) =>
          element.clasificador.substring(0, 8).trim() == '23.28.14');
      if (foundEspecifica14.isEmpty) {
        _params.add(PresupuestoCasEntity(
            anoEje: e.value[0].anoEje,
            fuente: e.value[0].fuente,
            producto: e.value[0].producto,
            meta: e.value[0].meta,
            clasificador: '23.28.14'));
      }
    }
  });
}
