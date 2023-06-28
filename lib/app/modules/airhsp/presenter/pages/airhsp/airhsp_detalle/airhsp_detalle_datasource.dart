import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class AirhspDetalleDataSource extends DataGridSource {
  AirhspDetalleDataSource({
    required this.listadoDetalle,
    required this.context,
    //required this.areas,
  }) {
    buildDataGridRows();
  }

  List<Map<String,dynamic>> listadoDetalle = [];
  BuildContext context;
  List<DataGridRow> _airshpDetalleDataGridRows = [];
  //final blocPrac = Modular.get<AirhspPresupuestoBloc>();

  @override
  List<DataGridRow> get rows => _airshpDetalleDataGridRows;

  void buildDataGridRows() {
    _airshpDetalleDataGridRows = listadoDetalle.map((e) => null).toList();
        
            
      }
        
  }

    @override
  Widget? buildTableSummaryCellWidget(
      GridTableSummaryRow summaryRow,
      GridSummaryColumn? summaryColumn,
      RowColumnIndex rowColumnIndex,
      String summaryValue) {
        return () {
          if (summaryColumn?.columnName == 'codigoPlaza') {
            return Container(
                padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 2),
                alignment: Alignment.center,
                child: Text(
                  NumberFormat('0', 'en_US').format(
                    num.parse(summaryValue.isEmpty ? '0' : summaryValue),
                  ),
                  style: TextStyle(fontSize: 13),              
                  maxLines: 1,
                ));
          }
          return Container();
        }();
      }
          

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    final int rowIndex = effectiveRows.indexOf(row);
    Color getRowBackgroundColor() {
      if ((rowIndex % 2) == 0)
        return Color.fromRGBO(202, 225, 255, 1);
      else
        return Colors.white;
    }

    return DataGridRowAdapter(
      color: getRowBackgroundColor(),
      cells: row.getCells().map<Widget>((e) {
        if (e.columnName == 'anio' ||
            e.columnName == 'codigoPlaza'
           ) {
          return Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(
              left: 5,
            ),
            child: Text(
              e.value.toString(),
              style: TextStyle(fontSize: 11),
            ),
          );
        } else
          return Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(
              left: 5,
            ),
            child: Text(
              e.value.toString(),
              maxLines: 1,
              style: TextStyle(fontSize: 11),
              overflow: TextOverflow.ellipsis,
            ),
          );
      }).toList(),
    );
  }

  void updateDataGrid() {
    notifyListeners();
  }
}


