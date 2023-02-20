// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pluto_grid/pluto_grid.dart';

import 'package:rrhh_clean/app/modules/requerimientos/presenter/detail/requerimiento_detail_page.dart';

import '../../../domain/requerimiento_detalle_entity.dart';
import '../../../domain/requerimiento_entity.dart';
import '../../get_columns_grid.dart';
import '../bloc/requerimiento_list_bloc.dart';

class RequerimientoPlutoPage extends StatelessWidget {
  List<RequerimientoDetalleEntity> requerimientoDetail = [];
  final List<PlutoRow> rows = [];
  final List<RequerimientoEntity> requerimientoList;
  RequerimientoEntity? rowSelected;
  final requerimientoListDetailBloc = Modular.get<RequerimientoListBloc>();
  static PlutoGridStateManager? stateManager = null;

  RequerimientoPlutoPage({
    Key? key,
    required this.requerimientoList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5.0),
        child: PlutoGrid(
            key: ValueKey('Master'),
            configuration: PlutoGridConfiguration(
              columnFilter: PlutoGridColumnFilterConfig(),
              scrollbar: PlutoGridScrollbarConfig(isAlwaysShown: true),
              style: PlutoGridStyleConfig(
                cellTextStyle: TextStyle(fontSize: 11),
                columnTextStyle: TextStyle(fontSize: 11, color: Colors.white),
                columnHeight: 25,
                rowHeight: 21,
                columnFilterHeight: 25,
                enableGridBorderShadow: true,
              ),
            ),
            columns: columns,
            rows: rows,
            mode: PlutoGridMode.select,
            onSelected: (PlutoGridOnSelectedEvent event) {
              if (event.row != null) {
//                        int index = event.row?.cells['id']?.value;

                requerimientoDetail =
                    requerimientoList[event.rowIdx!].requerimientoDetalle;
                this.rowSelected = requerimientoList[event.rowIdx!];
                this.requerimientoListDetailBloc.add(
                    RequerimientoSetDetailEvent(
                        reqrerimientoDetail: requerimientoDetail));
                ;
              }
            },
            onRowChecked: (e) {
              print(e.row?.cells['column1']?.value);
            },
            onChanged: (PlutoGridOnChangedEvent event) {
              print(event.rowIdx);
            },
            onRowSecondaryTap: (e) {},
            onLoaded: (PlutoGridOnLoadedEvent event) {
              stateManager = event.stateManager;
              stateManager!.setSelectingMode(PlutoGridSelectingMode.none);
              event.stateManager.setShowColumnFilter(true);
            }),
      ),
    );
  }
}
