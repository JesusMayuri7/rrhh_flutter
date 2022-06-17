import 'package:collection/collection.dart';
import 'package:rrhh_clean/app/modules/base_cas/domain/entities/base_cas_entity.dart';
import 'package:rrhh_clean/app/modules/base_cas/domain/entities/presupuesto_cas_entity.dart';
import 'package:rrhh_clean/app/modules/base_cas/domain/usecases/calcular_cas_use_case.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';

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
    'Cantidad',
    'Proyeccion',
    'TotalProyeccion',
    'Saldo'
  ];
  certificadoSheet.importList(headerPresupuesto, firstRowHeading, 1, false);

  _fuenteMetaOfBase(baseCas, params.certificado);
  fuenteMetaOfCertifcado(baseCas, params.certificado);
  print('despues');

  for (int index = 0; index < params.certificado.length; index++) {
    final List<Object> row =
        List.from(params.certificado[index].toMap().values.toList());

    certificadoSheet.importList(row, firstRowHeading + index + 1, 1, false);
  }

  final int _rowSum = certificadoSheet.getLastRow();

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

  _proyeccion(6, 22, certificadoSheet, certificadoSheet.getLastRow() - 1,
      baseCas, lastRowBase);

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

  certificadoSheet.getRangeByName('F6:U${_rowSum + 1}').numberFormat =
      '#,##0.00';
  certificadoSheet.getRangeByName('W6:W${_rowSum + 1}').numberFormat =
      '#,##0.00';
  certificadoSheet.getRangeByName('Y6:Y${_rowSum + 1}').numberFormat =
      '#,##0.00';
  certificadoSheet.getRangeByName('AA6:AA${_rowSum + 1}').numberFormat =
      '#,##0.00';
  certificadoSheet.getRangeByName('AC6:AE${_rowSum + 1}').numberFormat =
      '#,##0.00';
  certificadoSheet.getRangeByName('A6:AE${_rowSum + 1}').autoFit();
}

_proyeccion(int _rowInit, int _column, Worksheet page, int _rowEnd, _baseCas,
    int _lastRowBase) {
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

  certificadoOrderByFuenteMetaRDR.entries.forEach((e) {
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
      addClasificadorInCertificado(_params, _baseCas[x], '23.28.11');
      addClasificadorInCertificado(_params, _baseCas[x], '23.28.12');
      addClasificadorInCertificado(_params, _baseCas[x], '23.28.14');
      addClasificadorInCertificado(_params, _baseCas[x], '23.26.34');
    }
  }
}

void addClasificadorInCertificado(List<PresupuestoCasEntity> _certificado,
    BaseCasEntity _baseCasEntity, String clasificador) {
  _certificado.add(PresupuestoCasEntity(
      anoEje: 2022,
      fuente: _baseCasEntity.fuenteBase,
      producto: _baseCasEntity.producto,
      meta: _baseCasEntity.meta2020,
      clasificador: clasificador));
}
