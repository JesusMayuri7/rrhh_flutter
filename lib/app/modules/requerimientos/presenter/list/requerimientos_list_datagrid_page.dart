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

import '../detail/requerimiento_detail_page.dart';
import 'bloc/requerimiento_list_bloc.dart';
import 'requerimiento_grid_datagrid_page.dart';

class RequerimientosListDatagridPage extends StatefulWidget {
  const RequerimientosListDatagridPage({Key? key}) : super(key: key);

  @override
  State<RequerimientosListDatagridPage> createState() =>
      _RequerimientosListDatagridPageState();
}

class _RequerimientosListDatagridPageState
    extends State<RequerimientosListDatagridPage> {
  final requerimientoListBloc = Modular.get<RequerimientoListBloc>();

  List<RequerimientoEntity> requerimientoList = [];

  @override
  void initState() {
    super.initState();
    if (requerimientoListBloc.state is RequerimientoListInitial) {
      requerimientoListBloc.add(RequerimientoListLoadEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RequerimientoListBloc, RequerimientoListState>(
      listener: (context, state) {
        print(state.runtimeType.toString());
      },
      buildWhen: (previous, current) {
        return (current is RequerimientoListLoaded) ? true : false;
      },
      bloc: requerimientoListBloc,
      builder: (context, state) {
        if (state is RequerimientoListLoaded) {
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
                        /*   showModalDialogWidget(
                            contextDialog: context,
                            width: 800,
                            height: 550,
                            pageDetail: NewRequerimientoPage(
                                contextReq: context,
                                requerimientoEntity: this.rowSelected)); */
                      }
                    }),
              ],
            ),
            RequerimientoGridDataGridPage(
              requerimientoListBloc: requerimientoListBloc,
              context: context,
              requerimientosEntity: requerimientoList,
            ),
            /*     RequerimientoDetailPage(
              requerimientoListBloc: this.requerimientoListBloc,
              requerimientoDetailEntity: [],
            ) */
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
