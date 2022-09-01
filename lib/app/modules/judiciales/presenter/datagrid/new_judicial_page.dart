// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:collection/collection.dart';
import 'package:fluent_ui/fluent_ui.dart' as f;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'package:rrhh_clean/core/domain/entities/area_entity.dart';
import 'package:rrhh_clean/core/domain/entities/fuente_entity.dart';
import 'package:rrhh_clean/core/domain/entities/meta_enttity.dart';
import 'package:rrhh_clean/core/uitls/widgets/dropdownmenuitem_presupuesto.dart';
import 'package:rrhh_clean/core/uitls/widgets/label_with_dropdown.dart';
import 'package:rrhh_clean/core/uitls/widgets/label_with_form_field_initial.dart';

import '../../cubit/judiciales_bloc.dart';
import '../../domain/judicial_entity.dart';
import '../../domain/new_judiciales_use_case.dart';
import '../bloc/new/bloc/new_judicial_bloc.dart';

class NewJudicialPage extends StatefulWidget {
  final JudicialEntity judicialEntity;
  final BuildContext contextJudicial;

  NewJudicialPage({
    Key? key,
    required this.judicialEntity,
    required this.contextJudicial,
  }) : super(key: key);

  @override
  _NewJudicialPageState createState() => _NewJudicialPageState();
}

class _NewJudicialPageState extends State<NewJudicialPage> {
  late ParamsNewJudicial paramsAltaBaja;
  final _formKey = GlobalKey<FormState>();
  final _bloc = Modular.get<NewJudicialBloc>();
  final _blocJudicial = Modular.get<JudicialesBloc>();

  List<String> _presupuesto = ['ACTIVO', 'PREVISTA', 'NO_PREVISTA'];
  List<String> _estadoProcesal = [
    'SEGUIMIENTO',
    'DEMANDA_ADMITIDA',
    'MEDIDA_CAUTELAR',
    'SENTENCIA_1RA_INSTANCIA',
    'SENTENCIA_2DA_INSTANCIA',
    'SENTENCIA_CASACION',
    'TRIBUNAL_CONSTITUACIONAL',
    'COSA_JUZGADA'
  ];

  String presupuestoSelected = 'NO_PREVISTA';
  String estadoProcesalSelected = 'SEGUIMIENTO';
  int? _fuenteEntity;
  int? _metaEntity;
  int? _areaEntity;

  var maskDateFormatter = new MaskTextInputFormatter(
      mask: '####-##-##', filter: {"#": RegExp(r'[0-9]')});

  @override
  void initState() {
    _fuenteEntity = widget.judicialEntity.fuenteId == 0
        ? (this._blocJudicial.state as JudicialesLoaded).fuentes.first.id
        : widget.judicialEntity.fuenteId;

    _areaEntity = widget.judicialEntity.orgAreaId == 0
        ? (this._blocJudicial.state as JudicialesLoaded).areas.first.orgAreaId
        : widget.judicialEntity.orgAreaId;

    _metaEntity = widget.judicialEntity.metaId == 0
        ? (this._blocJudicial.state as JudicialesLoaded).metas.first.idmetaAnual
        : widget.judicialEntity.metaId;

    paramsAltaBaja = ParamsNewJudicial(
      id: widget.judicialEntity.id,
      anio: widget.judicialEntity.anio,
      presupuesto: widget.judicialEntity.presupuesto,
      fuenteId: _fuenteEntity!,
      orgAreaId: _areaEntity!,
      dni: widget.judicialEntity.dni,
      nombres: widget.judicialEntity.nombres,
      metaId: _metaEntity!,
      fecha: widget.judicialEntity.fechaIngreso,
      cargo: widget.judicialEntity.cargo,
      montoJudicial: widget.judicialEntity.montoJudicial,
      montoPlanilla: widget.judicialEntity.montoPlanilla,
      nroExpedienteJudicial: widget.judicialEntity.nroExpedienteJudicial,
      expedientePvn: widget.judicialEntity.expedientePvn,
      expedienteMtc: widget.judicialEntity.expedienteMtc,
      expedienteMef: widget.judicialEntity.expedienteMef,
      estadoProcesal: widget.judicialEntity.estadoProcesal,
      detalle: widget.judicialEntity.detalle,
      codigoPlaza: widget.judicialEntity.codigoPlaza,
      documentoOrh: widget.judicialEntity.documentoOrh,
      nroCap: widget.judicialEntity.nroCap,
      descEscala: widget.judicialEntity.descEscala,
      observacion: widget.judicialEntity.observacion,
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
                                        value: paramsAltaBaja.presupuesto,
                                        dropdownMenuItemList:
                                            buildCombo(_presupuesto),
                                        onChanged: (value) {
                                          paramsAltaBaja.presupuesto = value!;
                                        },
                                      ),
                                    ),
                                    SizedBox(width: 20.0),
                                    Expanded(
                                      flex: 8,
                                      child: LabelWithDropDown<int>(
                                        title: 'Fuente',
                                        value: paramsAltaBaja.fuenteId,
                                        dropdownMenuItemList: (this
                                                ._blocJudicial
                                                .state is JudicialesLoaded)
                                            ? buildFuentes((this
                                                    ._blocJudicial
                                                    .state as JudicialesLoaded)
                                                .fuentes)
                                            : [],
                                        onChanged: (value) {
                                          paramsAltaBaja.fuenteId = value!;
                                          // _fuenteEntity = value;
                                        },
                                      ),
                                    ),
                                  ]),
                                  SizedBox(height: 5.0),
                                  LabelWithDropDown<int>(
                                    title: 'Meta',
                                    value: paramsAltaBaja.metaId,
                                    dropdownMenuItemList: (this
                                            ._blocJudicial
                                            .state is JudicialesLoaded)
                                        ? buildMetas((this._blocJudicial.state
                                                as JudicialesLoaded)
                                            .metas)
                                        : [],
                                    onChanged: (value) {
                                      paramsAltaBaja.metaId = value!;
                                      //_metaEntity = value;
                                    },
                                  ),
                                  SizedBox(height: 5.0),
                                  LabelWithDropDown<int>(
                                    title: 'Area',
                                    value: paramsAltaBaja.orgAreaId,
                                    dropdownMenuItemList: (this
                                            ._blocJudicial
                                            .state is JudicialesLoaded)
                                        ? buildAreas((this._blocJudicial.state
                                                as JudicialesLoaded)
                                            .areas)
                                        : [],
                                    onChanged: (value) {
                                      paramsAltaBaja.orgAreaId = value!;
                                      //_areaEntity = value;
                                    },
                                  ),
                                  SizedBox(height: 5.0),
                                  LabelWithFormFieldInitial(
                                    initialValue: paramsAltaBaja.cargo,
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
                                        flex: 2,
                                        child: LabelWithFormFieldInitial(
                                          maxLength: 255,
                                          initialValue: paramsAltaBaja.dni,
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
                                        flex: 8,
                                        child: LabelWithFormFieldInitial(
                                          initialValue:
                                              paramsAltaBaja.nombres.toString(),
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
                                      SizedBox(width: 20),
                                      Expanded(
                                        flex: 2,
                                        child: LabelWithFormFieldInitial(
                                          initialValue: paramsAltaBaja.fecha,
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
                                              paramsAltaBaja.codigoPlaza,
                                          maxLength: 10,
                                          maxLines: 1,
                                          textAlign: TextAlign.right,
                                          title: 'Cod. Plaza',
                                          keyboardType: TextInputType.text,
                                          onSaved: (value) {
                                            paramsAltaBaja.codigoPlaza = value!;
                                          },
                                        ),
                                      ),
                                      SizedBox(width: 20.0),
                                      Expanded(
                                        child: LabelWithFormFieldInitial(
                                          initialValue: paramsAltaBaja.nroCap,
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
                                        initialValue: paramsAltaBaja.descEscala,
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
                                        initialValue: paramsAltaBaja
                                            .montoPlanilla
                                            .toString(),
                                        maxLength: 10,
                                        maxLines: 1,
                                        textAlign: TextAlign.right,
                                        title: 'Monto Planilla',
                                        keyboardType: TextInputType.text,
                                        onSaved: (value) {
                                          paramsAltaBaja.montoPlanilla =
                                              num.parse(value!);
                                        },
                                      )),
                                    ],
                                  ),
                                  Divider(color: Colors.blue),
                                  SizedBox(height: 5.0),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: LabelWithFormFieldInitial(
                                          initialValue:
                                              paramsAltaBaja.expedientePvn,
                                          maxLength: 30,
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
                                      SizedBox(width: 15),
                                      Expanded(
                                        child: LabelWithFormFieldInitial(
                                          initialValue:
                                              paramsAltaBaja.expedienteMtc,
                                          maxLength: 30,
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
                                      SizedBox(width: 15),
                                      Expanded(
                                        child: LabelWithFormFieldInitial(
                                          initialValue:
                                              paramsAltaBaja.expedienteMef,
                                          maxLength: 30,
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
                                  Divider(color: Colors.blue),
                                  SizedBox(height: 5.0),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: LabelWithFormFieldInitial(
                                          initialValue:
                                              paramsAltaBaja.documentoOrh,
                                          maxLength: 100,
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
                                    initialValue:
                                        paramsAltaBaja.nroExpedienteJudicial,
                                    maxLength: 100,
                                    textAlign: TextAlign.right,
                                    title: 'N° Exp. Judicial',
                                    keyboardType: TextInputType.text,
                                    onSaved: (value) {
                                      paramsAltaBaja.nroExpedienteJudicial =
                                          value!;
                                    },
                                  ),
                                  SizedBox(height: 5.0),
                                  Row(
                                    children: [
                                      Expanded(
                                          flex: 3,
                                          child: LabelWithFormFieldInitial(
                                            initialValue: paramsAltaBaja
                                                .montoJudicial
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
                                        flex: 4,
                                        child: LabelWithDropDown<String>(
                                          title: 'Presupuesto',
                                          value: paramsAltaBaja.estadoProcesal,
                                          dropdownMenuItemList:
                                              buildCombo(_estadoProcesal),
                                          onChanged: (value) {
                                            paramsAltaBaja.estadoProcesal =
                                                value!;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5.0),
                                  LabelWithFormFieldInitial(
                                    initialValue: paramsAltaBaja.detalle,
                                    maxLength: 1025,
                                    textAlign: TextAlign.left,
                                    title: 'Detalle',
                                    maxLines: 6,
                                    keyboardType: TextInputType.text,
                                    onSaved: (value) {
                                      paramsAltaBaja.detalle = value!;
                                    },
                                  ),
                                  SizedBox(height: 5.0),
                                  LabelWithFormFieldInitial(
                                    initialValue: paramsAltaBaja.observacion,
                                    maxLength: 255,
                                    textAlign: TextAlign.left,
                                    title: 'Observacion',
                                    maxLines: 1,
                                    keyboardType: TextInputType.text,
                                    onSaved: (value) {
                                      paramsAltaBaja.observacion = value!;
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

List<DropdownMenuItem<String>> buildCombo(List<String> model) {
  List<DropdownMenuItem<String>> listFuente = [];
  for (String item in model) {
    listFuente.add(DropdownMenuItem(
      value: item,
      child: Text(item),
    ));
  }
  //_fuenteFinanciamientoEntity = model[0];
  return listFuente;
}
