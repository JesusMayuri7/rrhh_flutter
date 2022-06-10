import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

Widget _getWidgetForStackedHeaderFuente(String title, Color color) {
  return Container(
    color: color,
    child: DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        isDense: true,
        isExpanded: true,
        value: title,
        items: ['TODOS', 'RO', 'RDR']
            .map((String item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: TextStyle(fontSize: 8),
                  ),
                ))
            .toList(),
        onChanged: (value) => {title = value!},
      ),
    ),
  );
}

List<StackedHeaderRow> getStackedHeaderRows() {
  List<StackedHeaderRow> _stackedHeaderRows;
  _stackedHeaderRows = <StackedHeaderRow>[
    StackedHeaderRow(
      cells: [
        StackedHeaderCell(
          columnNames: [
            'ene_monto',
            'ene_essalud',
            'ene_sctr_salud',
            'ene_vidaley',
            'ene_sctr_pension',
            'ene_escolaridad'
          ],
          child: Text(
            'Enero',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
        StackedHeaderCell(
          columnNames: [
            'feb_monto',
            'feb_essalud',
            'feb_sctr_salud',
            'feb_vidaley',
            'feb_sctr_pension',
          ],
          child: Text(
            'Febrero',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
        StackedHeaderCell(
          columnNames: [
            'mar_monto',
            'mar_essalud',
            'mar_sctr_salud',
            'mar_vidaley',
            'mar_sctr_pension',
          ],
          child: Text(
            'Marzo',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
        StackedHeaderCell(
          columnNames: [
            'abr_monto',
            'abr_essalud',
            'abr_sctr_salud',
            'abr_vidaley',
            'abr_sctr_pension',
          ],
          child: Text(
            'Abril',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
        StackedHeaderCell(
          columnNames: [
            'may_monto',
            'may_essalud',
            'may_sctr_salud',
            'may_vidaley',
            'may_sctr_pension',
            'may_cts'
          ],
          child: Text(
            'Mayo',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
        StackedHeaderCell(
          columnNames: [
            'jun_monto',
            'jun_essalud',
            'jun_sctr_salud',
            'jun_vidaley',
            'jun_sctr_pension',
          ],
          child: Text(
            'Junio',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
        StackedHeaderCell(
          columnNames: [
            'jul_monto',
            'jul_essalud',
            'jul_sctr_salud',
            'jul_vidaley',
            'jul_sctr_pension',
            'jul_grati',
            'jul_boni'
          ],
          child: Text(
            'Julio',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
        StackedHeaderCell(
          columnNames: [
            'ago_monto',
            'ago_essalud',
            'ago_sctr_salud',
            'ago_vidaley',
            'ago_sctr_pension',
          ],
          child: Text(
            'Agosto',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
        StackedHeaderCell(
          columnNames: [
            'set_monto',
            'set_essalud',
            'set_sctr_salud',
            'set_vidaley',
            'set_sctr_pension',
          ],
          child: Text(
            'Setiembre',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
        StackedHeaderCell(
          columnNames: [
            'oct_monto',
            'oct_essalud',
            'oct_sctr_salud',
            'oct_vidaley',
            'oct_sctr_pension',
          ],
          child: Text(
            'Octubre',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
        StackedHeaderCell(
          columnNames: [
            'nov_monto',
            'nov_essalud',
            'nov_sctr_salud',
            'nov_vidaley',
            'nov_sctr_pension',
            'nov_cts'
          ],
          child: Text(
            'Noviembre',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
        StackedHeaderCell(
          columnNames: [
            'dic_monto',
            'dic_essalud',
            'dic_sctr_salud',
            'dic_vidaley',
            'dic_sctr_pension',
            'dic_grati',
            'dic_boni'
          ],
          child: Text(
            'Diciembre',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
      ],
    )
  ];
  return _stackedHeaderRows;
}
