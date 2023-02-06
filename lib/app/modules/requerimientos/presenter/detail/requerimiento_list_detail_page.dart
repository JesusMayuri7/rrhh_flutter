// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pluto_grid/pluto_grid.dart';

import 'package:rrhh_clean/app/modules/requerimientos/presenter/get_columns_grid.dart';
import 'package:rrhh_clean/core/domain/entities/area_entity.dart';
import 'package:rrhh_clean/core/domain/entities/fuente_entity.dart';
import 'package:rrhh_clean/core/domain/entities/meta_enttity.dart';
import 'package:rrhh_clean/core/domain/entities/modalidad_entity.dart';

import '../../domain/requerimiento_detalle_entity.dart';
import '../bloc/requerimientos_bloc.dart';
import 'bloc/requerimiento_detail_bloc.dart';

class RequerimientoListDetailPage extends StatefulWidget {
  RequerimientoListDetailPage({
    Key? key,
  }) : super(key: key);

  @override
  State<RequerimientoListDetailPage> createState() =>
      _RequerimientoListDetailPageState();
}

class _RequerimientoListDetailPageState
    extends State<RequerimientoListDetailPage> {
  List<RequerimientoDetalleEntity> listDetail = [];
  //static PlutoGridStateManager? stateManagerDetail = null;
  late PlutoGridStateManager stateManagerDetail;

  final _blocRequerimiento = Modular.get<RequerimientosBloc>();

  List<FuenteEntity> fuentes = [];
  List<MetaEntity> metas = [];
  List<AreaEntity> areas = [];
  List<ModalidadEntity> modalidades = [];

  @override
  void initState() {
    super.initState();
    if (this._blocRequerimiento.state is RequerimientosLoaded) {
      this.fuentes =
          (this._blocRequerimiento.state as RequerimientosLoaded).fuentes;
      this.metas =
          (this._blocRequerimiento.state as RequerimientosLoaded).metas;
      this.areas =
          (this._blocRequerimiento.state as RequerimientosLoaded).areas;
      this.modalidades =
          (this._blocRequerimiento.state as RequerimientosLoaded).modalidades;
    }
  }

  List<PlutoRow> rowsDetail = [];

  final RequerimientoDetailBloc requerimientoDetailBloc =
      Modular.get<RequerimientoDetailBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequerimientoDetailBloc, RequerimientoDetailState>(
      bloc: this.requerimientoDetailBloc,
      builder: (context, state) {
        if (state is RequerimientoDetailLoaded) {
          rowsDetail = state.requerimientoDetail
              .map((e) => PlutoRow(
                    cells: {
                      'desc_area': PlutoCell(value: e.descArea),
                      'cargo': PlutoCell(value: e.cargo),
                      'cantidad': PlutoCell(value: e.cantidad),
                      'monto': PlutoCell(value: e.monto),
                    },
                  ))
              .toList();
          stateManagerDetail.removeRows(stateManagerDetail.rows);
          stateManagerDetail.resetCurrentState();
          stateManagerDetail.appendRows(rowsDetail);
        }
        return Expanded(
          child: PlutoGrid(
              key: ValueKey('RequerimientoDetail'),
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
              columns: columnsDetail(this.areas),
              rows: rowsDetail,
              onChanged: (PlutoGridOnChangedEvent event) {},
              onLoaded: (PlutoGridOnLoadedEvent event) {
                stateManagerDetail = event.stateManager;
                event.stateManager.setShowColumnFilter(true);
              }),
        );
      },
    );
  }
}
