// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rrhh_clean/app/modules/judiciales/domain/judicial_detail_entity.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';


import 'package:rrhh_clean/app/modules/requerimientos/presenter/list/bloc/requerimiento_list_bloc.dart';
import 'package:rrhh_clean/core/domain/entities/area_entity.dart';
import 'package:rrhh_clean/core/domain/entities/fuente_entity.dart';
import 'package:rrhh_clean/core/domain/entities/meta_enttity.dart';
import 'package:rrhh_clean/core/domain/entities/modalidad_entity.dart';

import 'cubit/judicial_detail_cubit.dart';
import 'judicial_detail_columns.dart';
import 'judicial_detail_dataosurce.dart';


class JudicialDetailPage extends StatelessWidget {
  

  //final List<JudicialDetailEntity> judicialDetailEntity;
  //final RequerimientoListBloc judicialListBloc;

  List<FuenteEntity> fuentes = [];
  List<MetaEntity> metas = [];
  List<AreaEntity> areas = [];
  List<ModalidadEntity> modalidades = [];

/*
    if (this._blocRequerimientoList.state is RequerimientoSetDetailState) {
      judicialDetailDataSource.detalleJudicial =
          (this._blocRequerimientoList.state as RequerimientoSetDetailState)
              .requerimientoDetail;
*/

JudicialDetailDataSource? judicialDetailDataSource = JudicialDetailDataSource(
        detailJudicial: []);

  final JudicialDetailCubit judicialDetailBloc =
      Modular.get<JudicialDetailCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<JudicialDetailCubit, JudicialDetailState>(
      listener: (context, state) {

      },
      buildWhen: (previousState, newState) {
        if (newState is JudicialDetailLoaded) return true;
        return false;
      },
      bloc: this.judicialDetailBloc,
      builder: (context, state) {
        if (state is JudicialDetailLoaded) {
          this.judicialDetailDataSource?.clearFilters();
          judicialDetailDataSource = JudicialDetailDataSource(
              detailJudicial: state.judicialDetailList);
          this.judicialDetailDataSource?.buildDataGridRows();
          this.judicialDetailDataSource?.updateDataGrid();
        }
        return Expanded(
            child: SizedBox(
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
                        highlightRowOnHover: true,
                        footerFrozenRowsCount: 0,
                        //footerFrozenColumnsCount: 1,
                        //frozenColumnsCount: 3,
                        source: judicialDetailDataSource!,
                        headerRowHeight: 25,
                        rowHeight: 25,
                        isScrollbarAlwaysShown: true,
                        gridLinesVisibility: GridLinesVisibility.both,
                        headerGridLinesVisibility: GridLinesVisibility.both,                                                
                        allowMultiColumnSorting: true,
                        allowTriStateSorting: true,
                        showSortNumbers: true,
                        selectionMode: SelectionMode.single,
                        columns: judicialDetailColumns(context),

                        ),
                  ),
                )));
      },
    );
  }
}
