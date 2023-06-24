import 'package:fluent_ui/fluent_ui.dart' as fluentUi;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rrhh_clean/app/app_service.dart';
import 'package:rrhh_clean/app/modules/airhsp/domain/entities/airhsp_codigo_entity.dart';
import 'package:rrhh_clean/app/modules/airhsp/domain/use_cases/list_airhsp_codigo_use_case.dart';
import 'package:rrhh_clean/app/modules/airhsp/domain/use_cases/save_codigo_use_case.dart';
import 'package:rrhh_clean/app/modules/airhsp/presenter/bloc/codigo_bloc/airhsp_codigo_bloc.dart';
import 'package:rrhh_clean/core/domain/entities/modalidad_entity.dart';
import 'package:rrhh_clean/core/uitls/constants/constants.dart';

class AirhspCodigoDetalle extends StatelessWidget {
  final List<ModalidadEntity> modalidades;

  String selectModalidadEntrega = 'PERMANENTE';
  String selectFrecuenciaEntrega = 'MENSUAL';
  String? selectFrecuenciaMes;
  AirhspCodigo? airhspCodigo;
  ParamsAirhspCodigo? paramsAirhspCodigo;
  AirhspCodigoBloc airhspCodigoBloc = Modular.get<AirhspCodigoBloc>();
  String? anioSelected = Modular.get<AppService>().sessionEntity?.anio;

  AirhspCodigoDetalle(
      {Key? key, required this.modalidades, required this.airhspCodigo}); 
 

  @override
  Widget build(fluentUi.BuildContext context) {
    if(this.airhspCodigoBloc.state.codigoSeleted == null)
    {    
          paramsAirhspCodigo = ParamsAirhspCodigo(
          id: this.airhspCodigoBloc.state.codigoSeleted!.id,
          anio: this.airhspCodigoBloc.state.codigoSeleted!.anio,
          modalidadId: this.airhspCodigoBloc.state.codigoSeleted!.modalidadId,
          codigo: this.airhspCodigoBloc.state.codigoSeleted!.codigo,
          descCodigo: this.airhspCodigoBloc.state.codigoSeleted!.descCodigo,
          descAbreviatura: this.airhspCodigoBloc.state.codigoSeleted!.descAbreviatura,
          modalidadEntrega: this.airhspCodigoBloc.state.codigoSeleted!.modalidadEntrega,
          frecuenciaEntrega: this.airhspCodigoBloc.state.codigoSeleted!.frecuenciaEntrega,
          frecuenciaMes: this.airhspCodigoBloc.state.codigoSeleted!.frecuenciaMes,
          tipoCodigo: this.airhspCodigoBloc.state.codigoSeleted!.tipoCodigo,
          afecto: this.airhspCodigoBloc.state.codigoSeleted!.afecto,
          estado: this.airhspCodigoBloc.state.codigoSeleted!.estado);    
    } 
    else
       paramsAirhspCodigo = ParamsAirhspCodigo.empty(anio: anioSelected!,modalidadId: this.modalidades[0].id);
    return SingleChildScrollView(
      child: BlocBuilder<AirhspCodigoBloc, AirhspCodigoState>(
        bloc: this.airhspCodigoBloc,
        builder: (context, state) {
          return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                fluentUi.InfoLabel(
                  label: 'Modalidad de Contrato',
                  child: fluentUi.ComboBox<int>(
                      value: this.paramsAirhspCodigo?.modalidadId ?? 0,
                      items: this
                          .modalidades
                          .map((e) => fluentUi.ComboBoxItem(
                              child: Text(e.dsc_modalidad), value: e.id))
                          .toList(),
                      onChanged: (value) {
                        //this.selectFrecuenciaMes = value;
                      }),
                ),
                SizedBox(height: 7),
                fluentUi.InfoLabel(
                  label: 'Modalidad de Entrega',
                  child: fluentUi.ComboBox<String>(
                    value: this.paramsAirhspCodigo?.modalidadEntrega ?? '',
                    items: [
                      fluentUi.ComboBoxItem(
                          child: Text('PERMANENTE'), value: 'PERMANENTE'),
                      fluentUi.ComboBoxItem(
                        child: Text('OCASIONAL'),
                        value: 'OCASIONAL',
                      ),
                      fluentUi.ComboBoxItem(
                        child: Text('PERIODICO'),
                        value: 'PERIODICO',
                      ),
                    ],
                    onChanged: (value) {
                      //this.selectModalidadEntrega = value!;
                    },
                  ),
                ),
                SizedBox(height: 7),
                fluentUi.InfoLabel(
                    label: 'Codigo',
                    child: SizedBox(
                        width: 100,
                        child: fluentUi.TextFormBox(
                            initialValue: this.paramsAirhspCodigo?.codigo ?? '',
                            maxLength: 5))),
                SizedBox(height: 7),
                fluentUi.InfoLabel(
                    label: 'Desc. Codigo',
                    child: SizedBox(
                        width: 250,
                        child: fluentUi.TextFormBox(maxLength: 250))),
                SizedBox(height: 7),
                fluentUi.InfoLabel(
                    label: 'Desc. Abreviatura',
                    child: SizedBox(
                        width: 50,
                        child: fluentUi.TextFormBox(maxLength: 250))),
                SizedBox(height: 7),
                fluentUi.InfoLabel(
                  label: 'Modalidad de Entrega',
                  child: fluentUi.ComboBox<String>(
                    //value: selectModalidadEntrega,
                    items: [
                      fluentUi.ComboBoxItem(
                          child: Text('PERMANENTE'), value: 'PERMANENTE'),
                      fluentUi.ComboBoxItem(
                        child: Text('OCASIONAL'),
                        value: 'OCASIONAL',
                      ),
                      fluentUi.ComboBoxItem(
                        child: Text('PERIODICO'),
                        value: 'PERIODICO',
                      ),
                    ],
                    onChanged: (value) {
                      //this.selectModalidadEntrega = value!;
                    },
                  ),
                ),
                SizedBox(height: 7),
                fluentUi.InfoLabel(
                  label: 'Frecuencia de Entrega',
                  child: fluentUi.ComboBox<String>(
                    //value: selectFrecuenciaEntrega,
                    items: [
                      fluentUi.ComboBoxItem(child: Text('CESE'), value: 'CESE'),
                      fluentUi.ComboBoxItem(
                          child: Text('CORRESPONDER'), value: 'CORRESPONDER'),
                      fluentUi.ComboBoxItem(
                          child: Text('GRADO'), value: 'GRADO'),
                      fluentUi.ComboBoxItem(
                          child: Text('MENSUAL'), value: 'MENSUAL'),
                      fluentUi.ComboBoxItem(
                          child: Text('OCASIONAL'), value: 'OCASIONAL'),
                      fluentUi.ComboBoxItem(
                          child: Text('PERIODICO'), value: 'PERIODICO'),
                      fluentUi.ComboBoxItem(
                          child: Text('UNICA'), value: 'UNICA'),
                    ],
                    onChanged: (value) {
                     // this.selectFrecuenciaEntrega = value!;
                    },
                  ),
                ),
                SizedBox(height: 7),
                fluentUi.InfoLabel(
                  label: 'Frecuencia de Mes',
                  child: fluentUi.ComboBox<String>(
                    //value: selectFrecuenciaMes,
                    items: meses
                        .map((e) =>
                            fluentUi.ComboBoxItem(child: Text(e), value: e))
                        .toList(),
                    onChanged: (value) {
                      //this.selectFrecuenciaMes = value;
                    },
                  ),
                ),
                SizedBox(height: 7),
                fluentUi.InfoLabel(
                  label: 'Tipo',
                  child: fluentUi.ComboBox<String>(
                    //value: selectModalidadEntrega,
                    items: [
                      fluentUi.ComboBoxItem(
                          child: Text('INGRESO'), value: 'INGRESO'),
                      fluentUi.ComboBoxItem(
                        child: Text('APORTE'),
                        value: 'APORTE',
                      ),
                    ],
                    onChanged: (value) {
                      //this.selectModalidadEntrega = value!;
                    },
                  ),
                ),
                SizedBox(height: 7),
                fluentUi.InfoLabel(
                  label: 'Afecto',
                  child: fluentUi.Checkbox(
                      checked: true, onChanged: (value) => {}),
                ),
                SizedBox(height: 7),
                fluentUi.InfoLabel(
                  label: 'Activo',
                  child: fluentUi.Checkbox(
                      checked: true, onChanged: (value) => {}),
                ),
              ]);
        },
      ),
    );
  }
}
