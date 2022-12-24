import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rrhh_clean/app/modules/auth/presenter/bloc/auth_bloc.dart';
import '../../../domain/entities/presupuesto_cas_entity.dart';
import '../bloc/presupuesto_bloc.dart';
import 'widgets/getColumnsPresupuesto.dart';

import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'widgets/presupuesto_cas_ds.dart';

class PresupuestoCasPage extends StatefulWidget {
  //this.jsonDataGridSource = BaseCasDataSource(context, <BaseCasEntity>[]);

  @override
  _PresupuestoCasPageState createState() => _PresupuestoCasPageState();
}

class _PresupuestoCasPageState extends State<PresupuestoCasPage>
    with AutomaticKeepAliveClientMixin {
  final String? anioSelected =
      Modular.get<AuthBloc>().state.loginResponseEntity!.anio;
  final bloc = Modular.get<PresupuestoBloc>();
  late PresupuestoCasDs _presupuestoCasDs;
  List<PresupuestoCasEntity> presupuestoCas = const [];

  @override
  void initState() {
    super.initState();
    _presupuestoCasDs = PresupuestoCasDs(presupuestoCas);
    _presupuestoCasDs.buildDataGridRows();
    _presupuestoCasDs.updateDataGrid();
    this.bloc.add(PresupuestoCasEventLoading(anio: this.anioSelected!));
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<PresupuestoBloc, PresupuestoState>(
      bloc: this.bloc,
      builder: (context, state) {
        if (state is PresupuestoLoaded) {
          _presupuestoCasDs.presupuestoList = state.presupuestoCasList;
          _presupuestoCasDs.buildDataGridRows();
          _presupuestoCasDs.updateDataGrid();
        }
        return Padding(
            padding: EdgeInsets.only(left: 40, right: 40, top: 70),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(children: <Widget>[
                    Text(
                      'Presupuesto CAS',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    TextButton(
                        onPressed: () {
                          this.bloc.add(PresupuestoCasEventLoading(
                              anio: this.anioSelected!));
                        },
                        child: Text('Actualizar'))
                  ]),
                  Divider(),
                  Expanded(
                    child: SfDataGridTheme(
                      data: SfDataGridThemeData(
                        brightness: Theme.of(context).brightness,
                        headerHoverColor: Colors.white.withOpacity(0.3),
                        headerColor: Colors.lightBlue[800],
                      ),
                      child: SfDataGrid(
                          frozenColumnsCount: 1,
                          footerFrozenRowsCount: 1,
                          //footerFrozenColumnsCount: 1,
                          isScrollbarAlwaysShown: true,
                          source: _presupuestoCasDs,
                          headerRowHeight: 23,
                          rowHeight: 24,
                          gridLinesVisibility: GridLinesVisibility.both,
                          headerGridLinesVisibility: GridLinesVisibility.both,
                          allowSorting: true,
                          allowMultiColumnSorting: true,
                          allowTriStateSorting: true,
                          showSortNumbers: true,
                          columns: getColumnsPresuspuesto(context)),
                    ),
                  ),
                  if (state is PresupuestoLoading) CircularProgressIndicator()
                ],
              ),
            ));
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
