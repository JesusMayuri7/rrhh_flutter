import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rrhh_clean/app/app_service.dart';
import 'package:rrhh_clean/app/bloc/app_bloc.dart';
import 'package:rrhh_clean/app/modules/auth/presenter/bloc/auth_bloc.dart';
import 'package:rrhh_clean/app/modules/liquidacion/bloc/liquidacion_bloc.dart';

import 'package:rrhh_clean/app/modules/liquidacion/presenter/liquidacion_resumen/bloc/liquidacion_resumen_bloc.dart';
import 'package:rrhh_clean/app/modules/liquidacion/presenter/liquidacion_resumen/getColumnsLiquidacionResumenLiquidacion.dart';
import 'package:rrhh_clean/app/modules/liquidacion/presenter/liquidacion_resumen/getColumnsLiquidacionResumenSiaf.dart';
import 'package:rrhh_clean/core/domain/entities/certificado_entity.dart';
import 'package:rrhh_clean/core/domain/entities/clasificador_entity.dart';
import 'package:rrhh_clean/core/uitls/widgets/dropdownmenuitem_presupuesto.dart';
import 'package:rrhh_clean/core/uitls/widgets/label_with_dropdown.dart';
import 'package:rrhh_clean/core/uitls/widgets/show_toast_dialog.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'package:syncfusion_flutter_core/theme.dart';

import 'liquidacion_resumen_liquidacion_datasource.dart';
import 'liquidacion_resumen_siaf_datasource.dart';

class LiquidacionResumenPage extends StatefulWidget {
  LiquidacionResumenPage({Key? key}) : super(key: key);

  @override
  _LiquidacionResumenPageState createState() => _LiquidacionResumenPageState();
}

class _LiquidacionResumenPageState extends State<LiquidacionResumenPage>
    with AutomaticKeepAliveClientMixin {
  final blocResumen = Modular.get<LiquidacionResumenBloc>();
  final blocApp = Modular.get<LiquidacionBloc>();

  ClasificadorEntity? _clasificadorEntity;
  CertificadoEntity? _certificadoEntity;

  final String anioSelected = Modular.get<AppService>().sessionEntity!.anio;

  late LiquidacionResumenSiafDatasource liquidacionResumenSiafDatasource;
  late LiquidacionResumenLiquidacionDatasource
      liquidacionResumenLiquidacionDatasource;

  @override
  void initState() {
    liquidacionResumenSiafDatasource =
        LiquidacionResumenSiafDatasource(liquidacionResumenSiaf: []);
    liquidacionResumenLiquidacionDatasource =
        LiquidacionResumenLiquidacionDatasource(
            liquidacionResumenLiquidacion: []);
    //this.blocResumen.add(LiquidacionResumenLoad(anio: '2021'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocConsumer<LiquidacionResumenBloc, LiquidacionResumenState>(
      listener: (_, state) {
        if (state is LiquidacionResumenError)
          showToastError(context, state.message);
      },
      buildWhen: (previous, current) {
        if (current is LiquidacionResumenLoaded)
          return true;
        else
          return false;
      },
      bloc: blocResumen,
      builder: (context, state) {
        if (state is LiquidacionResumenLoaded) {
          this.liquidacionResumenSiafDatasource.liquidacionResumenSiaf =
              state.liquidacionResumenSiaf;
          this
                  .liquidacionResumenLiquidacionDatasource
                  .liquidacionResumenLiquidacion =
              state.liquidacionResumenLiquidacion;

          this.liquidacionResumenLiquidacionDatasource.buildDataGridRows();
          this.liquidacionResumenLiquidacionDatasource.updateDataGrid();

          this.liquidacionResumenSiafDatasource.buildDataGridRows();
          this.liquidacionResumenSiafDatasource.updateDataGrid();

          return Center(
            child: Container(
              width: 750,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: 180,
                          child: LabelWithDropDown<CertificadoEntity>(
                              isExpanded: true,
                              value: null,
                              dropdownMenuItemList:
                                  (this.blocApp.state is LiquidacionLoadedState)
                                      ? buildCertificados((this.blocApp.state
                                              as LiquidacionLoadedState)
                                          .certificados)
                                      : [],
                              onChanged: (value) => _certificadoEntity = value,
                              title: 'Certificado'),
                        ),
                        SizedBox(width: 5),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              width: 130,
                              child: LabelWithDropDown<ClasificadorEntity>(
                                  isExpanded: true,
                                  value: _clasificadorEntity,
                                  dropdownMenuItemList: (this.blocApp.state
                                          is LiquidacionLoadedState)
                                      ? buildClasificadores((this.blocApp.state
                                              as LiquidacionLoadedState)
                                          .clasificadores)
                                      : [],
                                  onChanged: (value) {
                                    setState(() {
                                      _clasificadorEntity = value;
                                    });
                                  },
                                  title: 'Clasificador'),
                            ),
                            TextButton(
                                child: Icon(_clasificadorEntity == null
                                    ? null
                                    : Icons.clear),
                                onPressed: () {
                                  setState(() {
                                    _clasificadorEntity = null;
                                  });
                                }),
                          ],
                        ),
                        Spacer(),
                        ElevatedButton(
                            onPressed: () {
                              this.blocResumen.add(LiquidacionResumenLoad(
                                  allClasificador: true,
                                  dscClasificador:
                                      _clasificadorEntity?.dscClasificador ??
                                          'TODOS',
                                  listLliquidacion: [],
                                  dscCertificado:
                                      _certificadoEntity?.dscCertificado ?? '',
                                  anio: anioSelected));
                            },
                            child: Text('Actualizar'))
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                            child: Text('Certificado ' + state.dscCertificado,
                                style: TextStyle(fontSize: 12))),
                        SizedBox(width: 20),
                        Container(
                            child: Text('Clasificador ' + state.dscClasificador,
                                style: TextStyle(fontSize: 12))),
                      ],
                    ),

                    /*
                    Container(
                        color: Colors.blue[800],
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 6,
                              child: Text('Fuente / Meta',
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.white),
                                  textAlign: TextAlign.center),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text('Certificado',
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.white),
                                  textAlign: TextAlign.left),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text('Liquidacion',
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.white),
                                  textAlign: TextAlign.left),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text('Devengado',
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.white),
                                  textAlign: TextAlign.left),
                            ),
                            Expanded(
                                flex: 2,
                                child: Text('Devolucion',
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.white),
                                    textAlign: TextAlign.left)),
                            Text('Saldo',
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white),
                                textAlign: TextAlign.center),
                          ],
                        )),
                    Container(
                      color: Colors.blue[800],
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 6,
                            child: Text('',
                                style: TextStyle(fontSize: 10),
                                textAlign: TextAlign.center),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              '(a)',
                              style:
                                  TextStyle(fontSize: 10, color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text('',
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white)),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              '(b))',
                              style:
                                  TextStyle(fontSize: 10, color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                              flex: 2,
                              child: Text('',
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.white))),
                          Text(
                            '(c)= (a)-(b)',
                            style: TextStyle(fontSize: 10, color: Colors.white),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: state.liquidacionResumenDevengado.length,
                          itemBuilder: (context, item) {
                            return Container(
                                color: state.liquidacionResumenDevengado[item]
                                            .finalidad
                                            .startsWith('01') ||
                                        state.liquidacionResumenDevengado[item]
                                            .finalidad
                                            .startsWith('02') ||
                                        state.liquidacionResumenDevengado[item]
                                            .finalidad
                                            .startsWith('Total')
                                    ? Colors.amberAccent
                                    : null,
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 6,
                                        child: Text(
                                            state
                                                .liquidacionResumenDevengado[
                                                    item]
                                                .finalidad,
                                            style: TextStyle(fontSize: 9)),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          NumberFormat('#,##0.00', 'en_US')
                                              .format(double.parse((state
                                                  .liquidacionResumenDevengado[
                                                      item]
                                                  .montoCertificado))),
                                          textAlign: TextAlign.right,
                                          style: TextStyle(fontSize: 10),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          NumberFormat('#,##0.00', 'en_US')
                                              .format(double.parse(state
                                                  .liquidacionResumenDevengado[
                                                      item]
                                                  .montoLiquidacion)),
                                          textAlign: TextAlign.right,
                                          style: TextStyle(fontSize: 10),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          NumberFormat('#,##0.00', 'en_US')
                                              .format(double.parse(state
                                                  .liquidacionResumenDevengado[
                                                      item]
                                                  .montoDevengado)),
                                          textAlign: TextAlign.right,
                                          style: TextStyle(fontSize: 10),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          NumberFormat('#,##0.00', 'en_US')
                                              .format(double.parse(state
                                                  .liquidacionResumenDevengado[
                                                      item]
                                                  .montoDevolucion)),
                                          textAlign: TextAlign.right,
                                          style: TextStyle(fontSize: 10),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          NumberFormat('#,##0.00', 'en_US')
                                              .format(double.parse(state
                                                  .liquidacionResumenDevengado[
                                                      item]
                                                  .saldo)),
                                          textAlign: TextAlign.right,
                                          style: TextStyle(fontSize: 10),
                                        ),
                                      ),
                                    ]));
                          }),
                    ),                                      
                   */
                    Row(
                      children: [
                        Text(
                            'Informacion registrada por persona ( Certificado y Devengado )',
                            style: TextStyle(
                                fontSize: 11, color: Colors.blue[800])),
                      ],
                    ),
                    Expanded(
                      child: SfDataGridTheme(
                        key: UniqueKey(),
                        data: SfDataGridThemeData(
                          brightness: Theme.of(context).brightness,
                          headerHoverColor: Colors.white.withOpacity(0.3),
                          headerColor: Colors.lightBlue[800],
                        ),
                        child: SfDataGrid(
                          headerRowHeight: 25,
                          highlightRowOnHover: true,
                          editingGestureType: EditingGestureType.doubleTap,
                          navigationMode: GridNavigationMode.cell,
                          source: liquidacionResumenLiquidacionDatasource,
                          //controller: this._dataGridController,
                          columns: getColumnsLiquidacionResumenSiaf(),

                          footerHeight: 25,
                          rowHeight: 19,
                          isScrollbarAlwaysShown: true,
                          gridLinesVisibility: GridLinesVisibility.both,
                          headerGridLinesVisibility: GridLinesVisibility.both,

                          selectionMode: SelectionMode.single,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Text('Informacion del SIAF ( Certificado y Devengado )',
                            style: TextStyle(
                                fontSize: 11, color: Colors.blue[800])),
                      ],
                    ),
                    Expanded(
                      child: SfDataGridTheme(
                        key: UniqueKey(),
                        data: SfDataGridThemeData(
                          brightness: Theme.of(context).brightness,
                          headerHoverColor: Colors.white.withOpacity(0.3),
                          headerColor: Colors.lightBlue[800],
                        ),
                        child: SfDataGrid(
                          headerRowHeight: 25,
                          highlightRowOnHover: true,
                          editingGestureType: EditingGestureType.doubleTap,
                          navigationMode: GridNavigationMode.cell,
                          source: liquidacionResumenSiafDatasource,
                          //controller: this._dataGridController,
                          columns: getColumnsLiquidacionResumenDevengado(),
                          footerHeight: 25,
                          rowHeight: 19,
                          isScrollbarAlwaysShown: true,
                          gridLinesVisibility: GridLinesVisibility.both,
                          headerGridLinesVisibility: GridLinesVisibility.both,
                          selectionMode: SelectionMode.single,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else
          return Container();
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
