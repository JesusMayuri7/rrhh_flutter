import 'package:fluent_ui/fluent_ui.dart' as fluentUi;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rrhh_clean/app/modules/judiciales/domain/new_judicial_detail_use_case.dart';
import 'package:rrhh_clean/core/uitls/widgets/show_toast_dialog.dart';

import '../cubit/judicial_detail_cubit.dart';

class JudicialNewDetailPage extends StatefulWidget {
  JudicialNewDetailPage({
    Key? key,
    required this.paramsNewJudicialDetail,
  }) : super(key: key);

  ParamsNewJudicialDetail? paramsNewJudicialDetail;

  @override
  State<JudicialNewDetailPage> createState() => _JudicialNewDetailPageState();
}

class _JudicialNewDetailPageState extends State<JudicialNewDetailPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    if (this.widget.paramsNewJudicialDetail == null) {
      this.widget.paramsNewJudicialDetail = ParamsNewJudicialDetail.empty();
    }
    super.initState();
  }

  JudicialDetailCubit judicialDetailCubit = Modular.get<JudicialDetailCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<JudicialDetailCubit, JudicialDetailState>(
      bloc: this.judicialDetailCubit,
      listener: (context, state) {
                if(state is JudicialDetailLoaded){
           Navigator.pop(context);
           showToastSuccess(context, 'Se grabo exitosamente');
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text('Agregar seguimiento de Registro Judicial'),
                  SizedBox(height: 10),
                  fluentUi.InfoLabel(
                    label: 'Detalle',
                    child: fluentUi.TextFormBox(
                        expands: false,
                        keyboardType: TextInputType.text,
                        maxLength: 250,
                        maxLines: 5,
                        validator: (value) {
                          if (value!.isEmpty) return 'Campo vacio';
                          return null;
                        },
                        initialValue:
                            this.widget.paramsNewJudicialDetail!.detalle ?? '',
                        onSaved: (value) => this
                            .widget
                            .paramsNewJudicialDetail
                            ?.detalle = value),
                  ),
                  fluentUi.InfoLabel(
                    label: 'N° de Expediente',
                    child: fluentUi.TextFormBox(
                        keyboardType: TextInputType.text,
                        maxLength: 100,
                        maxLines: 1,
                        validator: (value) {
                          if (value!.isEmpty) return 'Campo vacio';
                          return null;
                        },
                        initialValue: this
                                .widget
                                .paramsNewJudicialDetail!
                                .expedientePvn ??
                            '',
                        onSaved: (value) => this
                            .widget
                            .paramsNewJudicialDetail
                            ?.expedientePvn = value),
                  ),
                  fluentUi.InfoLabel(
                    label: 'Fecha de Expediente',
                    child: fluentUi.TextFormBox(
                        keyboardType: TextInputType.text,
                        maxLength: 100,
                        maxLines: 1,
                        validator: (value) {
                          if (value!.isEmpty) return 'Campo vacio';
                          return null;
                        },
                        initialValue: this
                                .widget
                                .paramsNewJudicialDetail!
                                .fechaExpedientePvn ??
                            '',
                        onSaved: (value) => this
                            .widget
                            .paramsNewJudicialDetail
                            ?.fechaExpedientePvn = value),
                  ),
                  fluentUi.InfoLabel(
                    label: 'N° de Documento',
                    child: fluentUi.TextFormBox(
                        keyboardType: TextInputType.text,
                        maxLength: 100,
                        maxLines: 1,
                        validator: (value) {
                          if (value!.isEmpty) return 'Campo vacio';
                          return null;
                        },
                        initialValue:
                            this.widget.paramsNewJudicialDetail!.nroDocumento ??
                                '',
                        onSaved: (value) => this
                            .widget
                            .paramsNewJudicialDetail
                            ?.nroDocumento = value),
                  ),
                  SizedBox(height: 10),
                  fluentUi.FilledButton(
                      child: Text('Guardar'),
                      onPressed: () {
                        if (this._formKey.currentState!.validate()) {
                          this._formKey.currentState?.save();
                          this.judicialDetailCubit.add(JudicialNewDetailEvent(                            
                              paramsNewJudicialDetail:
                                  this.widget.paramsNewJudicialDetail!));
                        }
                      })
                ],
              ),
            )),
      ),
    );
  }
}
