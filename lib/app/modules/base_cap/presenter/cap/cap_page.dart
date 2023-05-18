import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rrhh_clean/app/app_service.dart';
import 'package:rrhh_clean/core/uitls/widgets/show_toast_dialog.dart';
import 'listado_cap/listado_cap_page.dart';
import 'parameter_cap/parameter_cap_page.dart';

import 'parameter_cap/bloc/parameter_cap_bloc.dart';

class CapPage extends StatefulWidget {
  @override
  _HeadBaseCasPageState createState() => _HeadBaseCasPageState();
}

class _HeadBaseCasPageState extends State<CapPage>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    //this.bloc.add(HeadParametersFormLoadEvent(dscVariable: 'CALCULAR_PROYECCION_CAS', modalidadId: 1));
  }

  final ScrollController controller = ScrollController();
  final String? anioSelected = Modular.get<AppService>().sessionEntity!.anio;

  String dropdownPresupuesto = 'TODOS';
  String dropdownEstado = 'TODOS';
  //late DataGridController dataGridController;
  final blocHeader = Modular.get<ParameterCapBloc>();

  TextEditingController uitController = TextEditingController();
  TextEditingController porcentajeMaximoEssaludController =
      TextEditingController();
  TextEditingController aguinaldoSemestralController = TextEditingController();
  TextEditingController porcentajeEssaludController = TextEditingController();
  TextEditingController porcentajeprimaSctrSaludController =
      TextEditingController();
  TextEditingController porcentajeIgvController = TextEditingController();

  int mesInicio = 0;
  int mesFin = 11;
  List<String> listMesInicio = [
    'Enero',
    'Febrero',
    'Marzo',
    'Abril',
    'Mayo',
    'Junio',
    'Julio',
    'Agosto',
    'Setiembre',
    'Octubre',
    'Noviembre',
    'Diciembre'
  ];

  List<String> listMesFin = [
    'Enero',
    'Febrero',
    'Marzo',
    'Abril',
    'Mayo',
    'Junio',
    'Julio',
    'Agosto',
    'Setiembre',
    'Octubre',
    'Noviembre',
    'Diciembre'
  ];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    //double w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ParameterCapPage(),
          BlocConsumer<ParameterCapBloc, ParameterCapState>(
              listener: (context, state) {
                if (state is CapLoadedState) {
                  if (StatusCap.error == state.statusCap) {
                    showToastError(context, state.toString());
                  }
                }
              },
              bloc: this.blocHeader,
              builder: (context, state) {
                return Expanded(
                  child: Column(
                    children: [
                      Container(
                        height: 30,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () => this
                                    .blocHeader
                                    .add(LoadCapEvent(anio: anioSelected!)),
                                child: Text("Listar"),
                              ),
                              ElevatedButton(
                                  onPressed: null, child: Text('Calcular')),
                              SizedBox(width: 10),
                              if (state is CapLoadedState)
                                ElevatedButton(
                                  onPressed: () => this.blocHeader.add(
                                      ExportCapEvent(
                                          listCap: state.listadoBaseCap,
                                          anio: anioSelected!)),
                                  child: Text('Exportar'),
                                ),
                              SizedBox(width: 10),
                            ]),
                      ),
                      if (state is CapLoadedState)
                        ListadoCapPage(listadoBaseCap: state.listadoBaseCap),
                      if (state is CapLoadingState)
                        Center(
                          child: CircularProgressIndicator(),
                        )
                    ],
                  ),
                );
              }),
        ],
      ),
    );
  }

  List<DropdownMenuItem<int>> _buildListMeses(List<String> mesesModel) {
    List<DropdownMenuItem<int>> listMeses = [];
    mesesModel
        .asMap()
        .entries
        .map((e) => listMeses.add(DropdownMenuItem(
              value: e.key,
              child: Text(e.value.toString()),
            )))
        .toList();

    return listMeses;
  }

  @override
  bool get wantKeepAlive => true;
}
