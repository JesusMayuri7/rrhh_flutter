import 'package:fluent_ui/fluent_ui.dart' as f;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:rrhh_clean/core/domain/entities/fuente_entity.dart';
import 'package:rrhh_clean/core/uitls/widgets/dropdownmenuitem_presupuesto.dart';
import 'package:rrhh_clean/core/uitls/widgets/label_with_dropdown.dart';

import 'package:rrhh_clean/core/uitls/widgets/label_with_form_field_initial.dart';

import '../../domain/judicial_entity.dart';
import '../../domain/new_judiciales_use_case.dart';
import '../bloc/new/bloc/new_judicial_bloc.dart';

class NewJudicialPage extends StatefulWidget {
  final JudicialEntity judicialEntity;

  NewJudicialPage({
    Key? key,
    required this.judicialEntity,
  }) : super(key: key);

  @override
  _NewJudicialPageState createState() => _NewJudicialPageState();
}

class _NewJudicialPageState extends State<NewJudicialPage> {
  late ParamsNewJudicial paramsAltaBaja;
  final _formKey = GlobalKey<FormState>();
  final _bloc = Modular.get<NewJudicialBloc>();

  List<String> _presupuesto = ['ACTIVO', 'PREVISTA', 'NO_PREVISTA'];
  String presupuestoSelected = 'NO_PREVISTA';
  FuenteEntity? _fuenteEntity;

  var maskDateFormatter = new MaskTextInputFormatter(
      mask: '####-##-##', filter: {"#": RegExp(r'[0-9]')});

  @override
  void initState() {
    paramsAltaBaja = ParamsNewJudicial(
      id: widget.judicialEntity.id,
      anio: widget.judicialEntity.anio,
      presupuesto: '',
      fuenteId: '',
      orgAreaId: '',
      dni: '',
      nombres: '',
      metaId: '',
      fecha: '',
      cargo: '',
      montoJudicial: 0,
      montoPlanilla: 0,
      nroExpedienteJudicial: '',
      expedientePvn: '',
      expedienteMtc: '',
      expedienteMef: '',
      estadoProcesal: '',
      detalle: '',
      codigoPlaza: '',
      documentoOrh: '',
      nroCap: '',
      descEscala: '',
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocConsumer<NewJudicialBloc, NewJudicialState>(
          bloc: this._bloc,
          listener: (context, state) {
            if (state is NewJudicialSaved) {
              Navigator.pop(context);
              f.showSnackbar(
                context,
                f.Snackbar(
                  content: Text('Se grabo exitosamente!'),
                ),
              );
            }
            if (state is NewJudicialError) {
              print(state.message);
              f.showSnackbar(
                context,
                f.Snackbar(
                  content: Text('Error: no se puede grabar! ' + state.message),
                ),
              );
              /*      ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Error al grabar: ' + state.message))); */
            }
          },
          builder: (context, state) {
            return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                //mainAxisSize: MainAxisSize.max,
                children: [
                  Text('Judiciales - ' + paramsAltaBaja.anio.toString()),
                  SizedBox(height: 5.0),
                  Expanded(
                    child: Scrollbar(
                      thumbVisibility: true,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Form(
                            key: _formKey,
                            autovalidateMode: AutovalidateMode.always,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  SizedBox(height: 5.0),
                                  Row(children: [
                                    Expanded(
                                      flex: 4,
                                      child: LabelWithDropDown<String>(
                                        title: 'Presupuesto',
                                        value: presupuestoSelected,
                                        dropdownMenuItemList:
                                            buildPresupuesto(_presupuesto),
                                        onChanged: (value) {
                                          paramsAltaBaja.presupuesto = value!;
                                        },
                                      ),
                                    ),
                                    SizedBox(width: 20.0),
                                    Expanded(
                                      flex: 8,
                                      child: LabelWithDropDown<FuenteEntity>(
                                        title: 'Fuente',
                                        value: _fuenteEntity,
                                        dropdownMenuItemList:
                                            /*      (this.blocSubsidio.state is SubsidioLoaded)
                                ? buildFuentes(
                                    (this.blocSubsidio.state as SubsidioLoaded)
                                        .fuentes)
                                : */
                                            [],
                                        onChanged: (value) {
                                          paramsAltaBaja.fuenteId =
                                              value!.id.toString();
                                          _fuenteEntity = value;
                                        },
                                      ),
                                    ),
                                  ]),
                                  SizedBox(height: 5.0),
                                  LabelWithFormFieldInitial(
                                    initialValue:
                                        widget.judicialEntity.finalidad,
                                    maxLength: 15,
                                    textAlign: TextAlign.left,
                                    title: 'Meta',
                                    keyboardType: TextInputType.text,
                                    onSaved: (value) {
                                      //paramsAltaBaja.descArea = value!;
                                    },
                                  ),
                                  SizedBox(height: 5.0),
                                  LabelWithFormFieldInitial(
                                    initialValue:
                                        widget.judicialEntity.descArea,
                                    maxLength: 15,
                                    textAlign: TextAlign.left,
                                    title: 'Area',
                                    keyboardType: TextInputType.text,
                                    onSaved: (value) {
                                      //paramsAltaBaja.descArea = value!;
                                    },
                                  ),
                                  SizedBox(height: 5.0),
                                  LabelWithFormFieldInitial(
                                    initialValue: widget.judicialEntity.cargo,
                                    maxLength: 255,
                                    textAlign: TextAlign.left,
                                    title: 'Cargo',
                                    maxLines: 1,
                                    keyboardType: TextInputType.text,
                                    onSaved: (value) {
                                      paramsAltaBaja.cargo = value!;
                                    },
                                  ),
                                  SizedBox(height: 5.0),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: LabelWithFormFieldInitial(
                                          maxLength: 255,
                                          initialValue:
                                              widget.judicialEntity.dni,
                                          maxLines: 1,
                                          textAlign: TextAlign.left,
                                          title: 'Dni',
                                          keyboardType: TextInputType.text,
                                          onSaved: (value) {
                                            paramsAltaBaja.dni = value!;
                                          },
                                        ),
                                      ),
                                      SizedBox(width: 20),
                                      Expanded(
                                        flex: 9,
                                        child: LabelWithFormFieldInitial(
                                          initialValue: widget
                                              .judicialEntity.nombres
                                              .toString(),
                                          maxLength: 255,
                                          maxLines: 1,
                                          textAlign: TextAlign.left,
                                          title: 'Nombres',
                                          keyboardType: TextInputType.text,
                                          onSaved: (value) {
                                            paramsAltaBaja.nombres = value!;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5.0),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: LabelWithFormFieldInitial(
                                          initialValue:
                                              widget.judicialEntity.codigoPlaza,
                                          maxLength: 10,
                                          maxLines: 1,
                                          textAlign: TextAlign.right,
                                          title: 'Codigo Plaza',
                                          keyboardType: TextInputType.text,
                                          onSaved: (value) {
                                            paramsAltaBaja.codigoPlaza = value!;
                                          },
                                        ),
                                      ),
                                      SizedBox(width: 20.0),
                                      Expanded(
                                        child: LabelWithFormFieldInitial(
                                          initialValue:
                                              widget.judicialEntity.nroCap,
                                          maxLength: 10,
                                          maxLines: 1,
                                          textAlign: TextAlign.right,
                                          title: 'Nro. Cap',
                                          keyboardType: TextInputType.text,
                                          onSaved: (value) {
                                            paramsAltaBaja.nroCap = value!;
                                          },
                                        ),
                                      ),
                                      SizedBox(width: 20.0),
                                      Expanded(
                                        child: LabelWithFormFieldInitial(
                                          initialValue: widget
                                              .judicialEntity.fechaIngreso,
                                          maxLength: 10,
                                          maxLines: 1,
                                          textAlign: TextAlign.right,
                                          title: 'Fe. Ing.',
                                          keyboardType: TextInputType.text,
                                          onSaved: (value) {
                                            paramsAltaBaja.fecha = value!;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5.0),
                                  Row(
                                    children: [
                                      Expanded(
                                          child: LabelWithFormFieldInitial(
                                        initialValue:
                                            widget.judicialEntity.descEscala,
                                        maxLength: 10,
                                        maxLines: 1,
                                        textAlign: TextAlign.right,
                                        title: 'Desc. Escala',
                                        keyboardType: TextInputType.text,
                                        onSaved: (value) {
                                          paramsAltaBaja.descEscala = value!;
                                        },
                                      )),
                                      SizedBox(width: 20.0),
                                      Expanded(
                                          child: LabelWithFormFieldInitial(
                                        initialValue: widget
                                            .judicialEntity.descEscala
                                            .toString(),
                                        maxLength: 10,
                                        maxLines: 1,
                                        textAlign: TextAlign.right,
                                        title: 'Monto Planilla',
                                        keyboardType: TextInputType.text,
                                        onSaved: (value) {
                                          paramsAltaBaja.descEscala = value!;
                                        },
                                      )),
                                    ],
                                  ),
                                  SizedBox(height: 5.0),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: LabelWithFormFieldInitial(
                                          initialValue: widget
                                              .judicialEntity.documentoOrh,
                                          maxLength: 15,
                                          textAlign: TextAlign.center,
                                          title: 'N° Doc. ORH',
                                          keyboardType: TextInputType.text,
                                          onSaved: (value) {
                                            paramsAltaBaja.documentoOrh =
                                                value!;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5.0),
                                  LabelWithFormFieldInitial(
                                    initialValue: widget
                                        .judicialEntity.nroExpedienteJudicial,
                                    maxLength: 15,
                                    textAlign: TextAlign.right,
                                    title: 'N° Exp. Judicial',
                                    keyboardType: TextInputType.text,
                                    onSaved: (value) {
                                      // paramsAltaBaja.hojaRuta = value!;
                                    },
                                  ),
                                  SizedBox(height: 5.0),
                                  Row(
                                    children: [
                                      Expanded(
                                          flex: 3,
                                          child: LabelWithFormFieldInitial(
                                            initialValue: widget
                                                .judicialEntity.montoJudicial
                                                .toString(),
                                            maxLength: 10,
                                            maxLines: 1,
                                            textAlign: TextAlign.right,
                                            title: 'Monto Judicial',
                                            keyboardType: TextInputType.text,
                                            onSaved: (value) {
                                              paramsAltaBaja.montoJudicial =
                                                  double.parse(value!);
                                            },
                                          )),
                                      SizedBox(width: 20.0),
                                      Expanded(
                                        flex: 9,
                                        child: LabelWithFormFieldInitial(
                                          initialValue: widget
                                              .judicialEntity.estadoProcesal,
                                          maxLength: 15,
                                          textAlign: TextAlign.center,
                                          title: 'Estado Procesal',
                                          keyboardType: TextInputType.text,
                                          onSaved: (value) {
                                            paramsAltaBaja.estadoProcesal =
                                                value!;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5.0),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: LabelWithFormFieldInitial(
                                          initialValue: widget
                                              .judicialEntity.expedientePvn,
                                          maxLength: 10,
                                          maxLines: 1,
                                          textAlign: TextAlign.right,
                                          title: 'Exp. PVN',
                                          keyboardType: TextInputType.text,
                                          onSaved: (value) {
                                            paramsAltaBaja.expedientePvn =
                                                value!;
                                          },
                                        ),
                                      ),
                                      SizedBox(width: 20),
                                      Expanded(
                                        child: LabelWithFormFieldInitial(
                                          initialValue: widget
                                              .judicialEntity.expedienteMtc,
                                          maxLength: 10,
                                          maxLines: 1,
                                          textAlign: TextAlign.right,
                                          title: 'Exp. MTC',
                                          keyboardType: TextInputType.text,
                                          onSaved: (value) {
                                            paramsAltaBaja.expedienteMtc =
                                                value!;
                                          },
                                        ),
                                      ),
                                      SizedBox(width: 20),
                                      Expanded(
                                        child: LabelWithFormFieldInitial(
                                          initialValue: widget
                                              .judicialEntity.expedienteMef
                                              .toString(),
                                          maxLength: 10,
                                          maxLines: 1,
                                          textAlign: TextAlign.right,
                                          title: 'Exp. MEF',
                                          keyboardType: TextInputType.text,
                                          onSaved: (value) {
                                            paramsAltaBaja.expedienteMef =
                                                value!;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5.0),
                                  LabelWithFormFieldInitial(
                                    initialValue: widget.judicialEntity.detalle,
                                    maxLength: 255,
                                    textAlign: TextAlign.left,
                                    title: 'Detalle',
                                    maxLines: 6,
                                    keyboardType: TextInputType.text,
                                    onSaved: (value) {
                                      paramsAltaBaja.detalle = value!;
                                    },
                                  ),
                                  SizedBox(height: 5.0),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: ElevatedButton(
                                            onPressed: () {
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                _formKey.currentState!.save();
                                                print(
                                                    paramsAltaBaja.toString());
                                                this._bloc.add(
                                                    NewDocumentLoadEvent(
                                                        paramsNewJudicial:
                                                            paramsAltaBaja));
                                              }
                                            },
                                            child:
                                                false //(this.blocEdit.state is EditConfianzaSaving)
                                                    ? Center(
                                                        heightFactor: 1,
                                                        widthFactor: 1,
                                                        child: SizedBox(
                                                          height: 16,
                                                          width: 16,
                                                          child:
                                                              CircularProgressIndicator(
                                                            valueColor:
                                                                AlwaysStoppedAnimation<
                                                                        Color>(
                                                                    Colors
                                                                        .blue),
                                                            strokeWidth: 1.5,
                                                          ),
                                                        ),
                                                      )
                                                    : Text('Guardar'),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                            child: ElevatedButton(
                                                onPressed: () =>
                                                    Navigator.pop(context),
                                                child: Text('Cancelar')))
                                      ],
                                    ),
                                  )
                                ]),
                          ),
                        ),
                      ),
                    ),
                  )
                ]);
          },
        ));
  }
}

List<DropdownMenuItem<String>> buildPresupuesto(List<String> fuenteModel) {
  List<DropdownMenuItem<String>> listFuente = [];
  for (String item in fuenteModel) {
    listFuente.add(DropdownMenuItem(
      value: item,
      child: Text(item),
    ));
  }
  //_fuenteFinanciamientoEntity = fuenteModel[0];
  return listFuente;
}
