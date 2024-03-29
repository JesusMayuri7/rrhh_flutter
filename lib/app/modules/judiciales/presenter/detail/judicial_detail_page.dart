// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:fluent_ui/fluent_ui.dart' as fluentUi;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rrhh_clean/app/modules/judiciales/domain/new_judicial_detail_use_case.dart';
import 'package:rrhh_clean/core/uitls/widgets/show_toast_dialog.dart';

import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'package:rrhh_clean/core/domain/entities/area_entity.dart';
import 'package:rrhh_clean/core/domain/entities/fuente_entity.dart';
import 'package:rrhh_clean/core/domain/entities/meta_enttity.dart';
import 'package:rrhh_clean/core/domain/entities/modalidad_entity.dart';

import 'cubit/judicial_detail_cubit.dart';
import 'judicial_detail_columns.dart';
import 'judicial_detail_dataosurce.dart';
import 'new_detail/judicial_new_detail_page.dart';

class JudicialDetailPage extends StatelessWidget {
  List<FuenteEntity> fuentes = [];
  List<MetaEntity> metas = [];
  List<AreaEntity> areas = [];
  List<ModalidadEntity> modalidades = [];
  BuildContext context;  
  JudicialDetailDataSource? judicialDetailDataSource;

  JudicialDetailPage({required this.context}) {
    
    judicialDetailDataSource =
        JudicialDetailDataSource(contextUp: this.context, detailJudicial: []);
  }

  int judicialId = 0;

  final JudicialDetailCubit judicialDetailBloc =
      Modular.get<JudicialDetailCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<JudicialDetailCubit, JudicialDetailState>(
      listener: (context, state) {

        if (state is JudicialDetailError) {
          showToastError(context, 'Error al grabar');
        }
      },
      buildWhen: (previousState, newState) {
        if (newState is JudicialDetailLoaded) return true;
        return false;
      },
      bloc: this.judicialDetailBloc,
      builder: (context, state) {
        if (state is JudicialDetailLoaded) {
          this.judicialId = state.judicialId;
          this.judicialDetailDataSource?.clearFilters();
          //judicialDetailDataSource = JudicialDetailDataSource(contextUp: context, detailJudicial: state.judicialDetailList);
          this.judicialDetailDataSource?.detailJudicial =  state.judicialDetailList;
          this.judicialDetailDataSource?.buildDataGridRows();
          this.judicialDetailDataSource?.updateDataGrid();
        }
        return Column(
          children: [
            Row(
              children: [
                Text((state is JudicialDetailLoaded)? state.nombres : '',style: TextStyle(fontWeight: FontWeight.bold)),
                Spacer(),
                fluentUi.Button(
                    child: Text('Nuevo'),
                    onPressed: () {
                      if(this.judicialId !=0){
                      showModalDialogJudicialNewDetail(
                          context, ParamsNewJudicialDetail(judicialId: this.judicialId));
                      }
                      else showToastError(context, 'Seleccione un registro judicial');
                    }),
              ],
            ),
            SizedBox(
                height: 500,
                width: double.infinity,
                child: SfDataGridTheme(
                  data: SfDataGridThemeData(
                    brightness: Theme.of(context).brightness,
                    headerHoverColor: Colors.white.withOpacity(0.3),
                    headerColor: Colors.lightBlue[800],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: SfDataGrid(
                      key: ValueKey('Detail'),
                      //highlightRowOnHover: true,
                      footerFrozenRowsCount: 0,
                      //footerFrozenColumnsCount: 1,
                      //frozenColumnsCount: 3,
                      source: judicialDetailDataSource!,
                      headerRowHeight: 50,
                      rowHeight: 50,
                      gridLinesVisibility: GridLinesVisibility.both,
                      headerGridLinesVisibility: GridLinesVisibility.both,
                      //selectionMode: SelectionMode.single,
                      columns: judicialDetailColumns(context),
                    ),
                  ),
                )),
          ],
        );
      },
    );
  }
}

showModalDialogJudicialNewDetail(_context, ParamsNewJudicialDetail _judicial) {
  showDialog(
      context: _context,
      builder: (BuildContext context) {
        return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
                height: 450,
                width: 300,
                child: JudicialNewDetailPage(
                    paramsNewJudicialDetail:_judicial )));
      });
}
