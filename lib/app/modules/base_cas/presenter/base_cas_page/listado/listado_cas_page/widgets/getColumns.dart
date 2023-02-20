import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

List<GridColumn> getColumns(BuildContext context) {
  return ([
    GridColumn(
      width: 54,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'AIRHSP',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
        ),
      ),
      columnName: 'codigo_plaza',
      //columnWidthMode: ColumnWidthMode.fill,
      //width: model.isWeb ? 135 : 90,
    ),
        GridColumn(
      width: 54,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Año',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
        ),
      ),
      columnName: 'anio',
      //columnWidthMode: ColumnWidthMode.fill,
      //width: model.isWeb ? 135 : 90,
    ),
        GridColumn(
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Ppto.',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
        ),
      ),
      columnName: 'presupuesto',
      width: 55,
      ////columnWidthMode: ColumnWidthMode.fill,
      //width: model.isWeb ? 135 : 90,
    ),
        GridColumn(
      width: 50,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Fuente',
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
        ),
      ),
      columnName: 'fuente_base',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
            GridColumn(
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Producto',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
          maxLines: 1,
        ),
      ),
      columnName: 'producto',
      width: 180,
      ////columnWidthMode: ColumnWidthMode.fill,
      //width: model.isWeb ? 135 : 90,
    ),



    GridColumn(
      width: 43,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Meta',
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
        ),
      ),
      columnName: 'meta',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
        GridColumn(
      width: 250,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Finalidad',
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
        ),
      ),
      columnName: 'meta2020',
      //columnWidthMode: ColumnWidthMode.fill,
    ),

    GridColumn(
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Area',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
        ),
      ),
      columnName: 'desc_area',
      width: 200,
      ////columnWidthMode: ColumnWidthMode.fill,
      //width: model.isWeb ? 135 : 90,
    ),
    GridColumn(
        label: Container(
          alignment: Alignment.center,
          child: Text(
            'Cargo',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
          ),
        ),
        columnName: 'cargo',
        width: 300
        // columnWidthMode: ColumnWidthMode.lastColumnFill,
        //columnWidthMode: ColumnWidthMode.fill,
        //width: model.isWeb ? 135 : 90,
        ),
                    GridColumn(
        label: Container(
          alignment: Alignment.center,
          child: Text(
            'Dni',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
          ),
        ),
        columnName: 'dni',
        width: 70
        // columnWidthMode: ColumnWidthMode.lastColumnFill,
        //columnWidthMode: ColumnWidthMode.fill,
        //width: model.isWeb ? 135 : 90,
        ),
            GridColumn(
        label: Container(
          alignment: Alignment.center,
          child: Text(
            'Nombres',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
          ),
        ),
        columnName: 'nombres',
        width: 300
        // columnWidthMode: ColumnWidthMode.lastColumnFill,
        //columnWidthMode: ColumnWidthMode.fill,
        //width: model.isWeb ? 135 : 90,
        ),
    GridColumn(
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Estado Opp',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
        ),
      ),
      columnName: 'estado_opp',
      width: 65,
      ////columnWidthMode: ColumnWidthMode.fill,
      //width: model.isWeb ? 135 : 90,
    ),
    GridColumn(
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Estado Actual',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
        ),
      ),
      columnName: 'estado_actual',
      width: 65,
      ////columnWidthMode: ColumnWidthMode.fill,
      //width: model.isWeb ? 135 : 90,
    ),
    GridColumn(
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Estado Air',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
        ),
      ),
      columnName: 'estadoAir',
      width: 65,
      ////columnWidthMode: ColumnWidthMode.fill,
      //width: model.isWeb ? 135 : 90,
    ),
    GridColumn(
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Vigencia',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
        ),
      ),
      columnName: 'vigencia',
      width: 65,
      ////columnWidthMode: ColumnWidthMode.fill,
      //width: model.isWeb ? 135 : 90,
    ),
    GridColumn(
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Sustento',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
        ),
      ),
      columnName: 'sustento_legal',
      width: 85,
    ),
    GridColumn(
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Convocatoria',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
        ),
      ),
      columnName: 'convocatoria_nro',
      width: 100,
    ),
    GridColumn(
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Estado Conv.',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
        ),
      ),
      columnName: 'estado_convocatoria',
      width: 80,
    ),
    GridColumn(
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Fase',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
        ),
      ),
      columnName: 'fase',
      width: 88,
    ),
    GridColumn(
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Modalidad',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
        ),
      ),
      columnName: 'modalidad',
      width: 85,
      ////columnWidthMode: ColumnWidthMode.fill,
      //width: model.isWeb ? 135 : 90,
    ),
    GridColumn(
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Tipo Ingreso',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
        ),
      ),
      columnName: 'tipo_ingreso',
      width: 88,
    ),
    GridColumn(
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Fecha Alta',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
        ),
      ),
      columnName: 'fechaAlta',
      width: 88,
    ),
    GridColumn(
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Tipo Salida',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
        ),
      ),
      columnName: 'tipo_salida',
      width: 88,
    ),
    GridColumn(
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Fecha Baja',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
        ),
      ),
      columnName: 'fechaBaja',
      width: 88,
    ),
    GridColumn(
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Fin Licencia',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
        ),
      ),
      columnName: 'finLicencia',
      width: 88,
    ),
    GridColumn(
      width: 70,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Inicio',
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 10.0),
        ),
      ),
      columnName: 'mesInicio',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 65,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Fin',
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 10.0),
        ),
      ),
      columnName: 'mesFin',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Monto',
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
        ),
      ),
      columnName: 'monto',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
        GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Incremento',
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
        ),
      ),
      columnName: 'incrementoCas',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
        GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Monto Mensual',
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
        ),
      ),
      columnName: 'montoMensual',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 75,
      columnName: 'essalud',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Essalud',
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
        ),
      ),
      //columnWidthMode: ColumnWidthMode.fill,
      ////columnWidthMode: ColumnWidthMode.fill,
      //textAlignment: Alignment.centerRight,
    ),
    GridColumn(
      width: 85,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Monto',
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
        ),
      ),
      columnName: 'montoAnual',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Essalud',
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
        ),
      ),
      columnName: 'essaludAnual',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Aguinaldo',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
        ),
      ),
      columnName: 'aguinaldoAnual',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 85,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Total Anual',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
        ),
      ),
      columnName: 'total',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'SctrSalud',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
        ),
      ),
      columnName: 'sctrSalud',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 85,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Total SctrSalud',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
        ),
      ),
      columnName: 'sctrSaludAnual',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'SctrPension',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
        ),
      ),
      columnName: 'sctrPension',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 85,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Total SctrPension',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
        ),
      ),
      columnName: 'sctrPensionAnual',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 250,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Detalle',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarTheme.color, fontSize: 11.0),
        ),
      ),
      columnName: 'detalle',
      //columnWidthMode: ColumnWidthMode.fill,
    )
  ]);
}
