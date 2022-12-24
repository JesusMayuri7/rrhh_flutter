import 'package:fluent_ui/fluent_ui.dart' as fluentUi;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:rrhh_clean/app/modules/home/domain/devengado_total_entity.dart';
import 'package:rrhh_clean/app/modules/home/presenter/home_cap_estado_opp/home_cap_estado_opp_page.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'presenter/home_devengado_total/bloc/homedevengadototal_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final blocHomeDevengadoTotal = Modular.get<HomeDevengadoTotalBloc>();

  @override
  void initState() {
    super.initState();
    this.blocHomeDevengadoTotal.add(HomeDevengadoTotalLoad());
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: BlocBuilder<HomeDevengadoTotalBloc, HomeDevengadoTotalState>(
            bloc: blocHomeDevengadoTotal,
            builder: (context, state) {
              if (state is HomeDevengadoTotalLoading) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 10),
                    Text('Cargando Datos...')
                  ],
                );
              }
              if (state is HomedevengadototalLoaded) {
                return Container(
                  width: double.infinity,
                  child: Wrap(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            fluentUi.Button(
                                child: Text('Actualizar'),
                                onPressed: () => this
                                    .blocHomeDevengadoTotal
                                    .add(HomeDevengadoTotalLoad())),
                          ],
                        ),
                      ),
                      Wrap(
                        children: [
                          Container(
                              width: 250,
                              height: 300,
                              child: _buildChartCap(state.devengadoTotal)),
                          Container(
                              width: 250,
                              height: 300,
                              child: _buildChartCas(state.devengadoTotal)),
                          Container(
                              width: 250,
                              height: 300,
                              child: _buildChartPrac(state.devengadoTotal)),
                          SizedBox(width: 10),
                          HomeCapEstadoOppPage(
                              capEstadoOppEntity: state.capEstadoOpp)
                        ],
                      ),
                    ],
                  ),
                );
              }
              return fluentUi.FilledButton(
                child: Text('Reintentar'),
                onPressed: () =>
                    this.blocHomeDevengadoTotal.add(HomeDevengadoTotalLoad()),
              );
            },
          ),
        ),
      ),
    );
  }

  SfCartesianChart _buildChartCap(List<DevengadoTotalEntity> _data) {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(text: 'CAP', textStyle: TextStyle(fontSize: 8)),
      // legend: Legend(isVisible: !isCardView),
      primaryXAxis: CategoryAxis(
        labelStyle: TextStyle(fontSize: 10),
        majorGridLines: const MajorGridLines(width: 0),
      ),
      primaryYAxis: NumericAxis(
          labelStyle: TextStyle(fontSize: 10),
          majorGridLines: const MajorGridLines(width: 0),
          numberFormat: NumberFormat.compact()),
      legend: Legend(isVisible: true),
      series: _getSpacingBarSeries(Colors.blue,
          _data.where((element) => element.dscModalidad == 'CAP').toList()),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  SfCartesianChart _buildChartCas(List<DevengadoTotalEntity> _data) {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(text: 'CAS', textStyle: TextStyle(fontSize: 8)),
      // legend: Legend(isVisible: !isCardView),
      primaryXAxis: CategoryAxis(
        labelStyle: TextStyle(fontSize: 10),
        majorGridLines: const MajorGridLines(width: 0),
      ),
      primaryYAxis: NumericAxis(
          labelStyle: TextStyle(
            fontSize: 10,
          ),
          majorGridLines: const MajorGridLines(width: 0),
          numberFormat: NumberFormat.compact()),
      legend: Legend(isVisible: true),
      series: _getSpacingBarSeries(Colors.red,
          _data.where((element) => element.dscModalidad == 'CAS').toList()),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  SfCartesianChart _buildChartPrac(List<DevengadoTotalEntity> _data) {
    return SfCartesianChart(
        plotAreaBorderWidth: 0,
        title: ChartTitle(text: 'PRAC', textStyle: TextStyle(fontSize: 8)),
        primaryXAxis: CategoryAxis(
          labelStyle: TextStyle(fontSize: 10),
          majorGridLines: const MajorGridLines(width: 0),
        ),
        primaryYAxis: NumericAxis(
            labelStyle: TextStyle(fontSize: 10),
            majorGridLines: const MajorGridLines(width: 0),
            numberFormat: NumberFormat.compact()),
        legend: Legend(isVisible: true),
        series: _getSpacingBarSeries(Colors.green,
            _data.where((element) => element.dscModalidad == 'PRAC').toList()),
        tooltipBehavior: TooltipBehavior(
          enable: true,
        ));
  }

  List<BarSeries<DevengadoTotalEntity, String>> _getSpacingBarSeries(
      Color _color, List<DevengadoTotalEntity> chartData) {
    return <BarSeries<DevengadoTotalEntity, String>>[
      BarSeries<DevengadoTotalEntity, String>(
        color: _color,
        spacing: 0.2,
        dataLabelSettings: DataLabelSettings(
            textStyle: TextStyle(fontSize: 9, color: Colors.white),
            alignment: ChartAlignment.center,
            labelAlignment: ChartDataLabelAlignment.bottom,
            isVisible: true,
            labelPosition: ChartDataLabelPosition.inside),
        dataSource: chartData,
        name: 'Devengado ' +
            NumberFormat('#,##0.00', 'en_US').format(
              double.parse(
                  chartData.isEmpty ? '0' : chartData.first.total.toString()),
            ),
        legendIconType: LegendIconType.diamond,
        xValueMapper: (DevengadoTotalEntity sales, _) => sales.mes,
        yValueMapper: (DevengadoTotalEntity sales, _) => sales.monto,
      ),
    ];
  }
}
