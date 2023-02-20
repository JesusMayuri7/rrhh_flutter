// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'package:rrhh_clean/app/modules/requerimientos/presenter/detail/requerimientos_detail_dataosurce.dart';
import 'package:rrhh_clean/app/modules/requerimientos/presenter/list/bloc/requerimiento_list_bloc.dart';
import 'package:rrhh_clean/core/domain/entities/area_entity.dart';
import 'package:rrhh_clean/core/domain/entities/fuente_entity.dart';
import 'package:rrhh_clean/core/domain/entities/meta_enttity.dart';
import 'package:rrhh_clean/core/domain/entities/modalidad_entity.dart';

import '../../domain/requerimiento_detalle_entity.dart';
import '../bloc/requerimientos_bloc.dart';
import '../list/requerimientos_list_columns.dart';
import 'bloc/requerimiento_detail_bloc.dart';
import 'requerimientos_detail_columns.dart';

class RequerimientoDetailPage extends StatefulWidget {
  RequerimientoDetailPage({
    Key? key,
    required this.requerimientoDetailEntity,
    required this.requerimientoListBloc,
  }) : super(key: key);

  final List<RequerimientoDetalleEntity> requerimientoDetailEntity;
  final RequerimientoListBloc requerimientoListBloc;

  @override
  State<RequerimientoDetailPage> createState() =>
      _RequerimientoDetailPageState();
}

class _RequerimientoDetailPageState extends State<RequerimientoDetailPage> {
  RequerimientosDetailDataSource requerimientosDetailDataSource =
      RequerimientosDetailDataSource(detalleRequerimiento: []);
  List<RequerimientoDetalleEntity> listDetail = [];
  //static PlutoGridStateManager? stateManagerDetail = null;
  late PlutoGridStateManager stateManagerDetail;

  final _blocRequerimientoList = Modular.get<RequerimientoListBloc>();

  List<FuenteEntity> fuentes = [];
  List<MetaEntity> metas = [];
  List<AreaEntity> areas = [];
  List<ModalidadEntity> modalidades = [];

  @override
  void initState() {
    super.initState();
/*     if (this._blocRequerimientoList.state is RequerimientoSetDetailState) {
      requerimientosDetailDataSource.detalleRequerimiento =
          (this._blocRequerimientoList.state as RequerimientoSetDetailState)
              .requerimientoDetail;
    } */
  }

  List<PlutoRow> rowsDetail = [];

  final RequerimientoDetailBloc requerimientoDetailBloc =
      Modular.get<RequerimientoDetailBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RequerimientoDetailBloc, RequerimientoDetailState>(
      listener: (context, state) {},
      buildWhen: (previousState, newState) {
        if (newState is RequerimientoSetDetailState) return true;
        return false;
      },
      bloc: this.requerimientoDetailBloc,
      builder: (context, state) {
        if (this._blocRequerimientoList.state is RequerimientoSetDetailState) {
          this.requerimientosDetailDataSource.clearFilters();
          this.requerimientosDetailDataSource.buildDataGridRows();
          this.requerimientosDetailDataSource.updateDataGrid();
        }
        return Expanded(
            child: SizedBox(
                height: 500,
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
                        source: requerimientosDetailDataSource,
                        headerRowHeight: 25,
                        rowHeight: 25,
                        isScrollbarAlwaysShown: true,
                        gridLinesVisibility: GridLinesVisibility.both,
                        headerGridLinesVisibility: GridLinesVisibility.both,
                        //allowSorting: true,
                        allowFiltering: true,
                        allowMultiColumnSorting: true,
                        allowTriStateSorting: true,
                        showSortNumbers: true,
                        selectionMode: SelectionMode.single,
                        columns: requerimientos_detail_columns(context)),
                  ),
                )));
      },
    );
  }
}
