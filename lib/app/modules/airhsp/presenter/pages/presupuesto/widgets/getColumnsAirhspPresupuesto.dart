import 'package:flutter/material.dart';
import 'package:rrhh_clean/app/modules/airhsp/domain/entities/columns_grid_presupuesto.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

List<GridColumn> getColumnsAirhspPresupuesto(BuildContext context, ColumnsGridPresupuesto columns) {
  return ([
    GridColumn(
      allowFiltering: false,
      width: 50,
      columnName: 'codigo_plaza',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Plaza',
          style: TextStyle(color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      allowEditing: false,
      width: 70,
      columnName: 'dni',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Dni',
          style: TextStyle(color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      allowEditing: false,
      width: 250,
      columnName: 'nombres',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Nombres',
          style: TextStyle(color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
        GridColumn(
      allowEditing: false,
      width: 100,
      columnName: 'desc_grupo_ocupacional',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Cargo',
          style: TextStyle(color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      allowEditing: false,
      width: 100,
      columnName: 'cargo',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Cargo',
          style: TextStyle(color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      allowEditing: false,
      width: 70,
      columnName: 'nivel',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Nivel',
          style: TextStyle(color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      width: 80,
      columnName: 'estado',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Estado',
          style: TextStyle(color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      width: 75,
      columnName: 'rem_prin_ro',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'RO',
          style: TextStyle(color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      width: 75,
      columnName: 'rem_prin_rdr',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'RDR',
          style: TextStyle(color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      width: 80,
      columnName: 'incremento',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'DS-311-2022-EF',
          style: TextStyle(color: Colors.white, fontSize: 10.0),
        ),
      ),
    ),
    GridColumn(
      width: 75,
      columnName: 'bonificacion_familiar',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Bon. Fam.',
          style: TextStyle(color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),

    GridColumn(
      width: 80,
      columnName: 'essalud',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Essalud',
          style: TextStyle(color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
        GridColumn(
      width: 85,
      columnName: 'basico_anual',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Basico',
          style: TextStyle(color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
      GridColumn(
      width: 80,
      columnName: 'essalud_anual',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Essalud',
          style: TextStyle(color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
        GridColumn(
      width: 80,
      columnName: 'escolaridad',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Escolaridad',
          style: TextStyle(color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
            GridColumn(
              visible: !columns.gratificacion,
      width: 80,
      columnName: 'gratificacion_julio',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Grati. Julio',
          style: TextStyle(color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
                GridColumn(
                                          visible: !columns.gratificacion,
      width: 80,
      columnName: 'gratificacion_diciembre',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Grati. Dic.',
          style: TextStyle(color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
       GridColumn(
        visible: columns.gratificacion,
      width: 85,
      columnName: 'gratificacion',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Grati',
          style: TextStyle(color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
                 GridColumn(
                  visible: !columns.bonificacion,
      width: 80,
      columnName: 'bonificacion_extraordinaria_julio',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Bonif. Ext. Julio',
          style: TextStyle(color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
                     GridColumn(
                      visible: !columns.bonificacion,
      width: 80,
      columnName: 'bonificacion_extraordinaria_diciembre',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Bonif. Ext. Dic.',
          style: TextStyle(color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
                      visible: columns.bonificacion,
      width: 85,
      columnName: 'bonificacion_extraordinaria',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Bonif. Ext.',
          style: TextStyle(color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      visible: !columns.cts,
      width: 80,
      columnName: 'cts_mayo',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Cts Mayo',
          style: TextStyle(color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      visible: !columns.cts,
      width: 80,
      columnName: 'cts_noviembre',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Cts Nov.',
          style: TextStyle(color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
    GridColumn(
      visible: columns.cts,
      width: 85,
      columnName: 'cts',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Cts',
          style: TextStyle(color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
        GridColumn(
     
      width: 90,
      columnName: 'total',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Total',
          style: TextStyle(color: Colors.white, fontSize: 11.0),
        ),
      ),
    ),
  ]);
}
