import 'package:fluent_ui/fluent_ui.dart' as fluentUi;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:rrhh_clean/app/modules/requerimientos/domain/requerimiento_detalle_entity.dart';
import 'package:rrhh_clean/app/modules/requerimientos/domain/requerimiento_entity.dart';
import 'package:rrhh_clean/app/modules/requerimientos/presenter/get_columns_grid.dart';
import 'package:rrhh_clean/app/modules/requerimientos/presenter/list/pluto/requerimiento_grid_pluto_page.dart';
import 'package:rrhh_clean/app/modules/requerimientos/presenter/new/new_requerimiento_page.dart';
import 'package:rrhh_clean/core/uitls/widgets/show_dialog_widget.dart';

import '../../detail/requerimiento_detail_page.dart';
import '../bloc/requerimiento_list_bloc.dart';

class RequerimientosListPage extends StatefulWidget {
  const RequerimientosListPage({Key? key}) : super(key: key);

  @override
  State<RequerimientosListPage> createState() => _RequerimientosListPageState();
}

class _RequerimientosListPageState extends State<RequerimientosListPage> {
  final requerimientoListBloc = Modular.get<RequerimientoListBloc>();

  static PlutoGridStateManager? stateManager = null;
  List<RequerimientoDetalleEntity> requerimientoDetail = [];
  List<RequerimientoEntity> requerimientoList = [];
  RequerimientoEntity? rowSelected;
  List<PlutoRow> rows = [];

  @override
  void initState() {
    if (requerimientoListBloc.state is RequerimientoListInitial) {
      requerimientoListBloc.add(RequerimientoLoadListEvent());
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
                      'desc_area': PlutoCell(value: e.descUnidad),
                      'nro_expediente': PlutoCell(value: e.nroExpediente),
                      'dcto_solicitud': PlutoCell(value: e.dctoSolicitud),
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
                          .add(RequerimientoLoadListEvent());
                    }),
                SizedBox(width: 10),
                fluentUi.FilledButton(
                    child: Text('Nuevo'),
                    onPressed: () {
                      // if (this.rowSelected != null)
                      {
                        showModalDialogWidget(
                            contextDialog: context,
                            width: 800,
                            height: 550,
                            pageDetail: NewRequerimientoPage(
                                contextReq: context,
                                requerimientoEntity: this.rowSelected));
                      }
                    }),
              ],
            ),
            RequerimientoPlutoPage(requerimientoList: requerimientoList)
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
