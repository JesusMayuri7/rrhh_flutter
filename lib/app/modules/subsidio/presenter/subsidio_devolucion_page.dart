import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:rrhh_clean/app/modules/auth/presenter/bloc/auth_bloc.dart';
import 'package:rrhh_clean/app/modules/subsidio/domain/new_subsidio_devolucion_usecase.dart';

import 'package:rrhh_clean/app/modules/subsidio/domain/subsidio_devolucion_entity.dart';
import 'package:rrhh_clean/app/modules/subsidio/presenter/bloc/subsidio_devolucion_bloc.dart';
import 'package:rrhh_clean/app/modules/subsidio/presenter/exportSubsidio.dart';
import 'package:rrhh_clean/app/modules/subsidio/presenter/new_subsidio/new_subsidio_devolucion_page.dart';
import 'package:rrhh_clean/app/modules/subsidio/presenter/subsidioDevolucionGridDatasource.dart';

import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';

import 'getColumnsSubsidioDevolucion.dart';

class SubsidioDevolucionPage extends StatefulWidget {
  const SubsidioDevolucionPage({Key? key}) : super(key: key);

  @override
  _SubsidioDevolucionPageState createState() => _SubsidioDevolucionPageState();
}

class _SubsidioDevolucionPageState extends State<SubsidioDevolucionPage>
    with AutomaticKeepAliveClientMixin {
  final DataGridController _dataGridController = DataGridController();

  final bloc = Modular.get<SubsidioDevolucionBloc>();

  DataGridRow? rowSelection;

  var _modalidad = ['CAS', 'CAP'];
  var _anios = ['2021', '2022', '2023', '2024', '2025'];

  String anioSelected = (Modular.get<AuthBloc>().state as SuccessAuthState)
      .loginResponseEntity
      .anio;
  //String anioSelected = DateFormat('y').format(DateTime.now());
  String modalidadSelected = 'CAS';

  @override
  void initState() {
    super.initState();
    //..add(SubsidioDataInitialLoad(anio: '2021'))
    this.bloc.add(SubsidioDevolucionLoad(
        anio: anioSelected, modalidad: modalidadSelected));
    //this.bloc.add(GetListLiquidacionEvent(anio: int.parse(anioSelected), modalidad: modalidadSelected));
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    SubsidioDevolucionGridDataSource subsidioDevolucionDataSource =
        SubsidioDevolucionGridDataSource(
            context: context,
            subsidioDevolucionFiltered: [],
            dataGridController: _dataGridController);
    return BlocConsumer<SubsidioDevolucionBloc, SubsidioDevolucionState>(
        buildWhen: (previousState, newState) {
          if (newState is SubsidioDevolucionLoaded) return true;
          return false;
        },
        bloc: this.bloc,
        listener: (context, state) {
          if (state is SubsidioDevolucionError)
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
        },
        builder: (context, state) {
          if (state is SubsidioDevolucionLoaded) {
            //this._dataGridController.endEdit();
            subsidioDevolucionDataSource.subsidioDevolucionFiltered =
                state.subsidioDevolucionFiltered;
            subsidioDevolucionDataSource.buildDataGridRows();
            subsidioDevolucionDataSource.updateDataGrid();
          }
          return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          DropdownButton<String>(
                            value: modalidadSelected,
                            items: _modalidad
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                  value: value, child: Text(value));
                            }).toList(),
                            onChanged: (String? value) {
                              print(value);
                              setState(() {
                                modalidadSelected = value!;
                              });
                              // this.blocApp.add(AppAnioSelectEvent(_anioSelected));
                            },
                          ),
                          Container(
                              width: 200,
                              child: TextFormField(
                                  style: TextStyle(fontSize: 11),
                                  textAlign: TextAlign.right,
                                  keyboardType: TextInputType.text,
                                  onFieldSubmitted: (value) {
                                    /*
                                            this.bloc.add(
                                                SetLiquidacionFilteredTextEvent(
                                                    modalidad: modalidadSelected,
                                                    anio: anioSelected,
                                                    criterio: value));
                                                    */
                                  },
                                  decoration: InputDecoration(
                                    hintStyle: TextStyle(fontSize: 11),
                                    hintText: 'Filtrar',
                                    prefixIcon: Icon(Icons.search_outlined),
                                    // set the prefix icon constraints
                                    prefixIconConstraints: BoxConstraints(
                                      minWidth: 20,
                                      minHeight: 20,
                                    ),
                                    border: OutlineInputBorder(),
                                    isDense: true, // Added this
                                    contentPadding: EdgeInsets.only(
                                      left: 5,
                                      top: 12,
                                    ), // Added this
                                  ))),
                          ElevatedButton(
                              onPressed: () {
                                this.bloc.add(SubsidioDevolucionLoad(
                                    anio: anioSelected,
                                    modalidad: (this.bloc.state
                                            is SubsidioDevolucionLoaded)
                                        ? (this.bloc.state
                                                as SubsidioDevolucionLoaded)
                                            .modalidad
                                        : modalidadSelected));
                              },
                              child: Text(
                                'Actualizar',
                                style: TextStyle(fontSize: 11),
                              )),
                          ElevatedButton(
                              onPressed: () {
                                exportDevoluciontoExcel(
                                    (state as SubsidioDevolucionLoaded)
                                        .subsidioDevolucionFiltered);
                              },
                              child: Text(
                                'Exportar',
                                style: TextStyle(fontSize: 11),
                              )),
                          /*
                                  ElevatedButton(
                                      onPressed: () => exportLiquidaciontoExcel((this
                                              .bloc
                                              .state is LiquidacionListLoaded)
                                          ? (this.bloc.state as LiquidacionListLoaded)
                                              .listLiquidacionFiltered
                                          : []),
                                      child: Text('Exportar')),
                                      */
                          ElevatedButton(
                              onPressed: () => _showModalDialog(context),
                              child: Text(
                                'Nuevo',
                                style: TextStyle(fontSize: 11),
                              )),
                        ],
                      ),
                    ),
                    Expanded(
                      child: SfDataGridTheme(
                        data: SfDataGridThemeData(
                          brightness: Theme.of(context).brightness,
                          headerHoverColor: Colors.white.withOpacity(0.3),
                          headerColor: Colors.lightBlue[800],
                        ),
                        child: SfDataGrid(
                          tableSummaryRows: [
                            GridTableSummaryRow(
                                showSummaryInRow: false,
                                title: 'Total Salary: {Sum} for 20 employees',
                                columns: [
                                  GridSummaryColumn(
                                      name: 'Sum',
                                      columnName: 'monto_devolucion',
                                      summaryType: GridSummaryType.sum)
                                ],
                                position: GridTableSummaryRowPosition.bottom)
                          ],
                          //key: ValueKey('Liquidacion'),
                          allowEditing: true,
                          highlightRowOnHover: true,
                          editingGestureType: EditingGestureType.doubleTap,
                          navigationMode: GridNavigationMode.cell,
                          source: subsidioDevolucionDataSource,

                          //controller: this._dataGridController,
                          columns: getColumnsSubisioDevolucion(),
                          headerRowHeight: 30,
                          footer: Container(),
                          footerHeight: 25,
                          rowHeight: 19,
                          isScrollbarAlwaysShown: true,
                          gridLinesVisibility: GridLinesVisibility.both,
                          headerGridLinesVisibility: GridLinesVisibility.both,
                          allowSorting: true,
                          allowMultiColumnSorting: true,
                          allowTriStateSorting: true,
                          showSortNumbers: true,
                          selectionMode: SelectionMode.single,
                          onSelectionChanged: (List<DataGridRow> addedRows,
                              List<DataGridRow> removedRows) {
                            final index = subsidioDevolucionDataSource.rows
                                .indexOf(addedRows.last);

                            SubsidioDevolucionEntity liquidacion =
                                subsidioDevolucionDataSource
                                    .subsidioDevolucionFiltered[index];
/*
                                this.bloc.add(SetLiquidacionDetalleEvent(
                                    dscCertificado: liquidacion.dscCertificado,
                                    liquidacionDetalle:
                                        liquidacion.liquidacionDetalle,
                                    nombres: liquidacion.nombres));
                                    */
                          },
                        ),
                      ),
                    ),
                  ]));
        });
  }

  _showModalDialog(_context) {
    showDialog(
        context: _context,
        builder: (BuildContext _context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: Container(
                  width: 350,
                  height: 600,
                  child: NewSubsidioDevolucionPage(
                      params: ParamsNewSubsidio(anio: int.parse(anioSelected)),
                      dscModalidad: modalidadSelected)));
        });
  }

  Widget dropDownModalidad() {
    return SizedBox(
      width: 93,
      height: 20,
      child: Padding(
        padding: const EdgeInsets.only(left: 5, right: 11),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
                child: Text(
              modalidadSelected,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 11),
            )),
            const SizedBox(
              width: 12,
              height: 17,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget dropDownAnio() {
    return SizedBox(
      width: 93,
      height: 20,
      child: Padding(
        padding: const EdgeInsets.only(left: 5, right: 11),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
                child: Text(
              anioSelected,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 11),
            )),
            const SizedBox(
              width: 12,
              height: 17,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
