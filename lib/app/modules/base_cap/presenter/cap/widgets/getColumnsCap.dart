import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

List<GridColumn> getColumnsCap(BuildContext context) {
  return ([
    GridColumn(
      width: 55,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'AIRHSP',
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'codigo_plaza',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 50,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Plaza',
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'plaza',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 50,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Plaza Ant.',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
          maxLines: 1,
        ),
      ),
      columnName: 'plaza_old',

      ////columnWidthMode: ColumnWidthMode.fill,
      //width: model.isWeb ? 135 : 90,
    ),
    GridColumn(
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Fuente',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'fuente_base',
      width: 50,
      ////columnWidthMode: ColumnWidthMode.fill,
      //width: model.isWeb ? 135 : 90,
    ),
    GridColumn(
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Fuente PAP',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'fuente_pap',
      width: 50,
      ////columnWidthMode: ColumnWidthMode.fill,
      //width: model.isWeb ? 135 : 90,
    ),
    GridColumn(
        label: Container(
          alignment: Alignment.center,
          child: Text(
            'Producto',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
          ),
        ),
        columnName: 'producto',
        width: 300
        // columnWidthMode: ColumnWidthMode.lastColumnFill,
        //columnWidthMode: ColumnWidthMode.fill,
        //width: model.isWeb ? 135 : 90,
        ),
    GridColumn(
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Actividad',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'actividad',
      width: 65,
      ////columnWidthMode: ColumnWidthMode.fill,
      //width: model.isWeb ? 135 : 90,
    ),
    GridColumn(
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Desc. Area',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'desc_area',
      width: 250,
    ),
    GridColumn(
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Meta',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'meta',
      width: 45,
    ),
    GridColumn(
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Finalidad',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'finalidad',
      width: 250,
    ),
    GridColumn(
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Cargo CAP',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'cargo_cap',
      width: 100,
    ),
    GridColumn(
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Cargo PAP',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'cargo_pap',
      width: 250,
    ),
    GridColumn(
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Estado OPP',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'estado_opp',
      width: 80,
    ),
    GridColumn(
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Estado PAP',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'estado_pap',
      width: 110,
      ////columnWidthMode: ColumnWidthMode.fill,
      //width: model.isWeb ? 135 : 90,
    ),
    GridColumn(
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Estado AIR',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'estado_air',
      width: 110,
      ////columnWidthMode: ColumnWidthMode.fill,
      //width: model.isWeb ? 135 : 90,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Estado Actual',
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'estado_actual',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 65,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'dni',
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'dni',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 230,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Nombres',
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'nombres',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 115,
      columnName: 'tipo_ingreso',
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Tipo Ingreso',
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
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
          'F. Ingreso',
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'fe_ingreso',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 100,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Tipo Salida',
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'tipo_salida',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 85,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'F. Salida',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'fe_salida',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 85,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Fin Licencia',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'fin_licencia',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 85,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Modalidad',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'modalidad',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Uniforme',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'uniforme',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Vale',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'vale',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'F. Nac.',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'fe_nac',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Nivel O',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'nivelO',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Desc.Nivel',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'desc_nivel',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Desc. Escala',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'desc_escala',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Ppto.',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'ppto_2021',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 40,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Eps ?',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'eps_aporta',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 65,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Monto \n AIR',
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'monto_air',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 65,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Monto \n Escala',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'monto_escala',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 60,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Asig. \n Fam.',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'asig_fam',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 50,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Total \n Basico',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'total_basico',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 50,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Essalud',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'essalud',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 50,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Sctr \n Salud',
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'sctr_salud',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 50,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Sctr \n Salud \n Grati',
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'sctr_salud_grati',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 50,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Vida Ley',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'vida_ley',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 50,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Sctr \n Pension',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'sctr_pension',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 50,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Sctr \n Pension \n Grati',
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'sctr_pension_grati',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Monto',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'ene_monto',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Essalud',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'ene_essalud',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Sctr Salud',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'ene_sctr_salud',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Vida Ley',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'ene_vidaley',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Sctr Pension',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'ene_sctr_pension',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'escolaridad',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'ene_escolaridad',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Monto',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'feb_monto',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Essalud',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'feb_essalud',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Sctr Salud',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'feb_sctr_salud',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Vida Ley',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'feb_vidaley',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Sctr Pension',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'feb_sctr_pension',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Monto',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'mar_monto',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Essalud',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'mar_essalud',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Sctr Salud',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'mar_sctr_salud',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Vida Ley',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'mar_vidaley',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Sctr Pension',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'mar_sctr_pension',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Monto',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'abr_monto',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Essalud',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'abr_essalud',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Sctr Salud',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'abr_sctr_salud',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Vida Ley',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'abr_vidaley',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Sctr Pension',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'abr_sctr_pension',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Monto',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'may_monto',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Essalud',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'may_essalud',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Sctr Salud',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'may_sctr_salud',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Vida Ley',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'may_vidaley',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Sctr Pension',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'may_sctr_pension',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'CTS',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'may_cts',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Monto',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'jun_monto',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Essalud',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'jun_essalud',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Sctr Salud',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'jun_sctr_salud',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Vida Ley',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'jun_vidaley',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Sctr Pension',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'jun_sctr_pension',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Monto',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'jul_monto',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Essalud',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'jul_essalud',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Sctr Salud',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'jul_sctr_salud',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Vida Ley',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'jul_vidaley',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Sctr Pension',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'jul_sctr_pension',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Gratificaion',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'jul_grati',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Bonificacion',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'jul_boni',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Monto',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'ago_monto',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Essalud',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'ago_essalud',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Sctr Salud',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'ago_sctr_salud',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Vida Ley',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'ago_vidaley',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Sctr Pension',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'ago_sctr_pension',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Monto',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'set_monto',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Essalud',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'set_essalud',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Sctr Salud',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'set_sctr_salud',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Vida Ley',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'set_vidaley',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Sctr Pension',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'set_sctr_pension',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Monto',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'oct_monto',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Essalud',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'oct_essalud',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Sctr Salud',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'oct_sctr_salud',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Vida Ley',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'oct_vidaley',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Sctr Pension',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'oct_sctr_pension',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Monto',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'nov_monto',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Essalud',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'nov_essalud',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Sctr Salud',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'nov_sctr_salud',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Vida Ley',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'nov_vidaley',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Sctr Pension',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'nov_sctr_pension',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'CTS',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'nov_cts',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Monto',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'dic_monto',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Essalud',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'dic_essalud',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Sctr Salud',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'dic_sctr_salud',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Vida Ley',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'dic_vidaley',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Sctr Pension',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'dic_sctr_pension',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Bonificacion',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'dic_boni',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
    GridColumn(
      width: 80,
      label: Container(
        alignment: Alignment.center,
        child: Text(
          'Gratificacion',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor, fontSize: 11.0),
        ),
      ),
      columnName: 'dic_grati',
      //columnWidthMode: ColumnWidthMode.fill,
    ),
  ]);
}
