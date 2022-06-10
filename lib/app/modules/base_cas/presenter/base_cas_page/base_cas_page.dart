//import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'listado_cas_page/listado_cas_page.dart';
import 'listado_cas_page/widgets/base_cas_datasource.dart';
import 'parameters_page/bloc/headparameters_bloc.dart';
import 'parameters_page/parameters_page.dart';

//import 'package:pluto_grid/pluto_grid.dart';
//import 'package:pluto_grid/pluto_grid.dart';

//import 'my_data.dart';

class BaseCasPage extends StatefulWidget {
  BaseCasPage() : super();

  @override
  _BaseCasPageState createState() => _BaseCasPageState();
}

class _BaseCasPageState extends State<BaseCasPage> //with AfterLayoutMixin
{
  String dropdownPresupuesto = 'TODOS';
  String dropdownEstado = 'TODOS';
  //late DataGridController dataGridController;
  late BaseCasDataSource jsonDataGridSource;
  final bloc = Modular.get<HeadParametersBloc>();

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
  void initState() {
    super.initState();
    //this.bloc.add(InitialBaseCasEvent(dscVariable: 'CALCULAR_PROYECCION_CAS', modalidadId: 1));
    //this.jsonDataGridSource = BaseCasDataSource(<BaseCasEntity>[]);
    //this.jsonDataGridSource.buildDataGridRows();
    //this.jsonDataGridSource.updateDataGrid();
  }

  @override
  Widget build(BuildContext context) {
    // print('reconstruyendo');
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Column(children: [
        ParametersPage(),
        //grid(),
        BlocConsumer<HeadParametersBloc, HeadParametersState>(
            listener: (context, state) {
              if (state is HeadParametersSuccessState &&
                  state.status == StatusCas.failure) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.black,
                  content: Text(state.message),
                ));
              }
            },
            bloc: this.bloc,
            builder: (context, state) {
              if (state is HeadParametersSuccessState &&
                  (state.status == StatusCas.loadedList ||
                      state.status == StatusCas.exportingList))
                return ListadoCasPage(listadoCas: state.listadoCas);
              if (state is HeadParametersSuccessState &&
                  (state.status == StatusCas.loadingList))
                return Center(child: CircularProgressIndicator());
              return ListadoCasPage(listadoCas: []);
            })
      ]),
    );
  }
}
