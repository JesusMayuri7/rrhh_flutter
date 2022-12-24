import 'package:fluent_ui/fluent_ui.dart' as fluentUi;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:rrhh_clean/app/modules/requerimientos/domain/requerimiento_detalle_entity.dart';
import 'package:rrhh_clean/app/modules/requerimientos/domain/requerimiento_entity.dart';
import 'package:rrhh_clean/app/modules/requerimientos/presenter/get_columns_grid.dart';
import 'package:rrhh_clean/app/modules/requerimientos/presenter/new/new_requerimiento_page.dart';
import 'package:rrhh_clean/core/uitls/widgets/show_dialog_widget.dart';

import '../detail/requerimiento_list_detail_page.dart';
import 'bloc/requerimiento_list_bloc.dart';

class RequerimientosListPage extends StatefulWidget {
  const RequerimientosListPage({Key? key}) : super(key: key);

  @override
  State<RequerimientosListPage> createState() => _RequerimientosListPageState();
}

class _RequerimientosListPageState extends State<RequerimientosListPage> {
  final requerimientoListBloc = Modular.get<RequerimientoListBloc>();
  List<PlutoRow> rows = [];
  static PlutoGridStateManager? stateManager = null;
  List<RequerimientoDetalleEntity> requerimientoDetail = [];
  List<RequerimientoEntity> requerimientoList = [];
  RequerimientoEntity? rowSelected;

  @override
  void initState() {
    if (requerimientoListBloc.state is RequerimientoListInitial) {
      requerimientoListBloc.add(RequerimientoListLoadEvent());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequerimientoListBloc, RequerimientoListState>(
      bloc: requerimientoListBloc,
      builder: (context, state) {
        if (state is RequerimientoListLoaded) {
          rows = state.requerimientoList
              .map((e) => PlutoRow(
                    cells: {
                      'id': PlutoCell(value: e.id),
                      'anio': PlutoCell(value: e.anio),
                      'dsc_modalidad': PlutoCell(value: e.dscModalidad),
                      'nro_expediente': PlutoCell(value: e.nroExpediente),
                      'dcto_solicitud': PlutoCell(value: e.dctoSolicitud),
                      'desc_area': PlutoCell(value: e.descArea),
                      'fecha_solicitud': PlutoCell(value: e.fechaSolicitud),
                    },
                  ))
              .toList();
          stateManager!.removeRows(stateManager!.rows);
          stateManager!.resetCurrentState();
          stateManager!.appendRows(rows);
          requerimientoList = state.requerimientoList;
        }
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                fluentUi.FilledButton(
                    child: Text('Actualizar'),
                    onPressed: () {
                      this
                          .requerimientoListBloc
                          .add(RequerimientoListLoadEvent());
                    }),
                SizedBox(width: 10),
                fluentUi.FilledButton(
                    child: Text('Nuevo'),
                    onPressed: () {
                      // if (this.rowSelected != null)
                      {
                        showModalDialogWidget(
                            contextDialog: context,
                            width: 600,
                            height: 550,
                            pageDetail: NewRequerimientoPage(
                                contextReq: context,
                                requerimientoEntity: this.rowSelected));
                      }
                    }),
              ],
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                child: PlutoGrid(
                    key: ValueKey('Master'),
                    configuration: PlutoGridConfiguration(
                      columnFilter: PlutoGridColumnFilterConfig(),
                      scrollbar: PlutoGridScrollbarConfig(isAlwaysShown: true),
                      style: PlutoGridStyleConfig(
                        cellTextStyle: TextStyle(fontSize: 11),
                        columnTextStyle:
                            TextStyle(fontSize: 11, color: Colors.white),
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

                        requerimientoDetail = requerimientoList[event.rowIdx!]
                            .requerimientoDetalle;
                        this.rowSelected = requerimientoList[event.rowIdx!];
                        this.requerimientoListBloc.add(
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
                    onRowSecondaryTap: (e) {
                      print('Secondary click A Row.(${e.offset})');
                      print(e.row?.cells['column1']?.value);
                    },
                    onLoaded: (PlutoGridOnLoadedEvent event) {
                      stateManager = event.stateManager;
                      stateManager!
                          .setSelectingMode(PlutoGridSelectingMode.none);
                      event.stateManager.setShowColumnFilter(true);
                    }),
              ),
            ),
            RequerimientoListDetailPage()
          ],
        );
      },
    );
  }
}

showModalDialogWidget2(
    {required BuildContext contextDialog, required Widget pageDetail}) {
  showDialog(
      context: contextDialog,
      builder: (BuildContext _context) {
        return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(width: 600, height: 550, child: pageDetail));
      });
}
