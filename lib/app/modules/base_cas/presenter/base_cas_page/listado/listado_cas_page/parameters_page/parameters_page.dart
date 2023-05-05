import 'package:fluent_ui/fluent_ui.dart' as f;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rrhh_clean/app/app_service.dart';
import 'package:rrhh_clean/core/uitls/widgets/label_with_dropdown.dart';
import 'package:rrhh_clean/core/uitls/widgets/label_with_form_field.dart';

import 'bloc/headparameters_bloc.dart';

class ParametersPage extends StatefulWidget {
  @override
  _HeadBaseCasPageState createState() => _HeadBaseCasPageState();
}

class _HeadBaseCasPageState extends State<ParametersPage>
    with AutomaticKeepAliveClientMixin {
  final bloc = Modular.get<HeadParametersBloc>();
  final appBloc = Modular.get<AppService>();
  String? anioSelected;

  @override
  void initState() {
    super.initState();

    anioSelected = appBloc.sessionEntity?.anio;
    if (this.bloc.state is HeadParametersInitialState) {
      this.bloc.add(HeadParametersFormLoadEvent(
          dscVariable: 'CALCULAR_PROYECCION_CAS',
          modalidadId: 1,
          anio: anioSelected!));
    }
  }

  final ScrollController controller = ScrollController();

  String dropdownPresupuesto = 'TODOS';
  String dropdownEstado = 'TODOS';
  //late DataGridController dataGridController;

  TextEditingController uitController = TextEditingController();
  TextEditingController porcentajeMaximoEssaludController =
      TextEditingController();
  TextEditingController aguinaldoSemestralController = TextEditingController();
  TextEditingController porcentajeEssaludController = TextEditingController();
  TextEditingController porcentajeprimaSctrSaludController =
      TextEditingController();
  TextEditingController porcentajePrimaSctrPensionController =
      TextEditingController();
  TextEditingController porcentajeComisionSctrPensionController =
      TextEditingController();
  TextEditingController porcentajeIgvController = TextEditingController();
  TextEditingController incrementoCasController = TextEditingController();

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

    double w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Scrollbar(
        thickness: 5.0,
        thumbVisibility: w > 940 ? false : true,
        controller: controller,
        child: SingleChildScrollView(
          controller: controller,
          scrollDirection: Axis.horizontal,
          child: Container(
            margin: EdgeInsets.only(
              bottom: w > 940 ? 3 : 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocBuilder<HeadParametersBloc, HeadParametersState>(
                    bloc: this.bloc,
                    buildWhen: (previousState, state) {
                      if (state is HeadParametersSuccessState) return true;
                      return false;
                    },
                    builder: (context, state) {
                      if (state is HeadParametersSuccessState) {
                        uitController.text = state.uit.toString();
                        porcentajeMaximoEssaludController.text =
                            state.porcentajeMaximoEssalud.toString();
                        aguinaldoSemestralController.text =
                            state.aguinaldoSemestral.toString();
                        porcentajeEssaludController.text =
                            state.porcentajeDescEssalud.toString();
                        porcentajeprimaSctrSaludController.text =
                            state.porcentajeSctrSalud.toString();
                        porcentajePrimaSctrPensionController.text =
                            state.porcentajePrimaSctrPension.toString();
                        porcentajeComisionSctrPensionController.text =
                            state.porcentajeComisionSctrPension.toString();
                        porcentajeIgvController.text =
                            state.porcentajeIgv.toString();
                        incrementoCasController.text =
                            state.incrementoCas.toString();
                        return Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              f.FilledButton(
                                onPressed: (state.status ==
                                            StatusCas.loadedParameter ||
                                        (state.listadoCas.isNotEmpty &&
                                            state.status !=
                                                StatusCas.loadingList))
                                    ? () => this.bloc.add(
                                        HeadParametersListEvent(
                                            anio: this.anioSelected!))
                                    : null,
                                child: (state.status == StatusCas.loadingList)
                                    ? Center(
                                        heightFactor: 1,
                                        widthFactor: 1,
                                        child: SizedBox(
                                          height: 16,
                                          width: 16,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    Color.fromARGB(
                                                        255, 255, 255, 255)),
                                            strokeWidth: 1.5,
                                          ),
                                        ),
                                      )
                                    : Text("Listar"),
                              ),
                              SizedBox(width: 10),
                              Container(
                                width: 97,
                                child: LabelWithDropDown<int>(
                                  isExpanded: true,
                                  title: 'Mes Inicio',
                                  dropdownMenuItemList:
                                      _buildListMeses(listMesInicio),
                                  onChanged: (int? value) {
                                    mesInicio = value ?? 0;
                                  },
                                  value: mesInicio,
                                ),
                              ),
                              SizedBox(width: 7),
                              Container(
                                width: 97,
                                child: LabelWithDropDown<int>(
                                  isExpanded: true,
                                  title: 'Mes Fin',
                                  dropdownMenuItemList:
                                      _buildListMeses(listMesFin),
                                  onChanged: (int? value) {
                                    mesFin = value ?? 0;
                                  },
                                  value: mesFin,
                                ),
                              ),
                              SizedBox(width: 7),
                              Container(
                                width: 80,
                                child: LabelWithFormField(
                                    maxLength: 12,
                                    textAlign: TextAlign.center,
                                    title: 'Uit',
                                    textController: uitController,
                                    keyboardType: TextInputType.number),
                              ),
                              Container(
                                width: 80,
                                child: LabelWithFormField(
                                    maxLength: 12,
                                    textAlign: TextAlign.center,
                                    title: 'Incremento',
                                    textController: incrementoCasController,
                                    keyboardType: TextInputType.number),
                              ),
                              SizedBox(width: 7),
                              Container(
                                width: 60,
                                child: LabelWithFormField(
                                    maxLength: 18,
                                    textAlign: TextAlign.center,
                                    title: '% Max. Essalud',
                                    textController:
                                        porcentajeMaximoEssaludController,
                                    keyboardType: TextInputType.number),
                              ),
                              SizedBox(width: 7),
                              Container(
                                width: 60,
                                child: LabelWithFormField(
                                    maxLength: 8,
                                    textAlign: TextAlign.center,
                                    title: '% Essalud',
                                    textController: porcentajeEssaludController,
                                    keyboardType: TextInputType.number),
                              ),
                              SizedBox(width: 7),
                              Container(
                                width: 60,
                                child: LabelWithFormField(
                                    maxLength: 8,
                                    textAlign: TextAlign.center,
                                    title: 'Agui. Sem.',
                                    textController:
                                        aguinaldoSemestralController,
                                    keyboardType: TextInputType.number),
                              ),
                              SizedBox(width: 7),
                              SizedBox(width: 7),
                              Container(
                                width: 60,
                                child: LabelWithFormField(
                                    maxLength: 8,
                                    textAlign: TextAlign.center,
                                    title: '% Igv',
                                    textController: porcentajeIgvController,
                                    keyboardType: TextInputType.number),
                              ),
                              Container(
                                width: 60,
                                child: LabelWithFormField(
                                    maxLength: 8,
                                    textAlign: TextAlign.center,
                                    title: '% Prima Sctr-Salud',
                                    textController:
                                        porcentajeprimaSctrSaludController,
                                    keyboardType: TextInputType.number),
                              ),
                              Container(
                                width: 60,
                                child: LabelWithFormField(
                                    maxLength: 8,
                                    textAlign: TextAlign.center,
                                    title: '% Prima Sctr-Pension',
                                    textController:
                                        porcentajePrimaSctrPensionController,
                                    keyboardType: TextInputType.number),
                              ),
                              Container(
                                width: 65,
                                child: LabelWithFormField(
                                    maxLength: 8,
                                    textAlign: TextAlign.center,
                                    title: '% Comision Sctr-Pension',
                                    textController:
                                        porcentajeComisionSctrPensionController,
                                    keyboardType: TextInputType.number),
                              ),
                              SizedBox(width: 7),
                              f.FilledButton(
                                  onPressed: (state.status ==
                                          StatusCas.loadedList)
                                      ? () => this.bloc.add(HeadParametersCalcularEvent(
                                          anio: this.anioSelected!,
                                          uit: double.parse(uitController.text),
                                          porcentajeMaximoEssalud: double.parse(
                                              porcentajeMaximoEssaludController
                                                  .text),
                                          aguinaldoSemestral: double.parse(
                                              aguinaldoSemestralController
                                                  .text),
                                          porcentajeEssalud: double.parse(
                                              porcentajeEssaludController.text),
                                          porcentajePrimaSctrSalud: double.parse(
                                              porcentajeprimaSctrSaludController.text),
                                          porcentajePrimaSctrPension: double.parse(porcentajePrimaSctrPensionController.text),
                                          porcentajeComisionSctrPension: double.parse(porcentajeComisionSctrPensionController.text),
                                          porcentajeIgv: double.parse(porcentajeIgvController.text),
                                          incrementoCas: double.parse(incrementoCasController.text),
                                          mesInicio: this.mesInicio,
                                          mesFin: this.mesFin))
                                      : null,
                                  child: (state.status == StatusCas.calculating)
                                      ? Center(
                                          heightFactor: 1,
                                          widthFactor: 1,
                                          child: SizedBox(
                                            height: 16,
                                            width: 16,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                      Colors.blue),
                                              strokeWidth: 1.5,
                                            ),
                                          ),
                                        )
                                      : Text('Calcular')),
                              SizedBox(width: 10),
                              f.FilledButton(
                                  onPressed: (state.status ==
                                          StatusCas.loadedList)
                                      ? () {
                                          this.bloc.add(HeadParametersExportEvent(
                                              anio: this.anioSelected!,
                                              uit: double.parse(
                                                  uitController.text),
                                              porcentajeMaximoEssalud: double.parse(
                                                  porcentajeMaximoEssaludController
                                                      .text),
                                              aguinaldoSemestral: double.parse(
                                                  aguinaldoSemestralController
                                                      .text),
                                              porcentajeEssalud: double.parse(
                                                  porcentajeEssaludController
                                                      .text),
                                              porcentajePrimaSctrSalud:
                                                  double.parse(
                                                      porcentajeprimaSctrSaludController.text),
                                              porcentajePrimaSctrPension: double.parse(porcentajePrimaSctrPensionController.text),
                                              porcentajeComisionSctrPension: double.parse(porcentajeComisionSctrPensionController.text),
                                              porcentajeIgv: double.parse(porcentajeIgvController.text),
                                              incrementoCas: double.parse(incrementoCasController.text),
                                              mesInicio: mesInicio,
                                              mesFin: mesFin));
                                        }
                                      : () {},
                                  child: (state.status ==
                                          StatusCas.exportingList)
                                      ? Center(
                                          heightFactor: 1,
                                          widthFactor: 1,
                                          child: SizedBox(
                                            height: 16,
                                            width: 16,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                      Colors.blue),
                                              strokeWidth: 1.5,
                                            ),
                                          ),
                                        )
                                      : Text('Exportar')),
                              SizedBox(width: 10),
/*                               Container(
                                width: 200,
                                child: LabelWithFormField(
                                    maxLength: 100,
                                    textAlign: TextAlign.center,
                                    title: 'Buscar',
                                    //textController: porcentajeIgvController,
                                    keyboardType: TextInputType.text),
                              ), */
                            ]);
                      }
                      return Center(child: CircularProgressIndicator());
                    }),
              ],
            ),
          ),
        ),
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
