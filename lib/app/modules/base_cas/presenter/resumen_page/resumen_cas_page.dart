import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../domain/entities/resumen_entity.dart';

import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'bloc/resumen_bloc.dart';
import 'widgets/getColumnsResumen.dart';
import 'widgets/resumen_cas_ds.dart';
import 'widgets/stacked_header.dart';

class ResumenCasPage extends StatefulWidget {
  @override
  _ResumenCasPageState createState() => _ResumenCasPageState();
}

class _ResumenCasPageState extends State<ResumenCasPage>
    with AutomaticKeepAliveClientMixin {
  final ResumenBloc bloc = Modular.get<ResumenBloc>();
  late ResumenCasDs _resumenCasDs;
  List<ResumenEntity> resumenCas = const [];

  @override
  void initState() {
    super.initState();
    _resumenCasDs = ResumenCasDs(resumenCas);
    _resumenCasDs.buildDataGridRows();
    _resumenCasDs.updateDataGrid();
    //this.bloc.add(ResumenCasEventRefresh());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<ResumenBloc, ResumenState>(
      bloc: this.bloc,
      builder: (context, state) {
        if (state is ResumenLoaded) {
          _resumenCasDs.resumenList = state.resumenCasList;
          _resumenCasDs.buildDataGridRows();
          _resumenCasDs.updateDataGrid();
        }
        //print(resumenCas.toString());
        return Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 70),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(children: <Widget>[
                    Text(
                      'RESUMEN CAS',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    TextButton(
                        onPressed: () {
                          this.bloc.add(ResumenCasEventRefresh());
                        },
                        child: Text('Actualizar'))
                  ]),
                  const Divider(),
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
                          source: _resumenCasDs,
                          headerRowHeight: 23,
                          rowHeight: 22,
                          gridLinesVisibility: GridLinesVisibility.both,
                          headerGridLinesVisibility: GridLinesVisibility.both,
                          allowSorting: true,
                          allowMultiColumnSorting: true,
                          allowTriStateSorting: true,
                          showSortNumbers: true,
                          stackedHeaderRows: getStackedHeaderRows(),
                          columns: getColumnsResumen(context)),
                    ),
                  ),
                ],
              ),
            ));
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
