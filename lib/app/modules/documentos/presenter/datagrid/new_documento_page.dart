import 'package:fluent_ui/fluent_ui.dart' as f;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:rrhh_clean/app/modules/documentos/domain/new_documentos_use_case.dart';
import 'package:rrhh_clean/app/modules/documentos/presenter/bloc/new/bloc/new_documento_bloc.dart';

import 'package:rrhh_clean/core/uitls/widgets/label_with_form_field_initial.dart';

import '../../domain/documento_entity.dart';

class NewDocumentoPage extends StatefulWidget {
  final DocumentoEntity documentoEntity;

  NewDocumentoPage({
    Key? key,
    required this.documentoEntity,
  }) : super(key: key);

  @override
  _NewDocumentoPageState createState() => _NewDocumentoPageState();
}

class _NewDocumentoPageState extends State<NewDocumentoPage> {
  late ParamsNewDocumento paramsAltaBaja;
  final _formKey = GlobalKey<FormState>();
  final _bloc = Modular.get<NewDocumentoBloc>();

  var maskDateFormatter = new MaskTextInputFormatter(
      mask: '####-##-##', filter: {"#": RegExp(r'[0-9]')});

  @override
  void initState() {
    paramsAltaBaja = ParamsNewDocumento(
        id: widget.documentoEntity.id,
        anio: widget.documentoEntity.anio,
        asunto: '',
        destino: '',
        remite: '',
        tipo: '',
        estado: '',
        expedientePvn: '',
        expedienteMtc: '',
        expedienteMef: '',
        fecha: '',
        numeroPvn: '',
        detalle: '');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocConsumer<NewDocumentoBloc, NewDocumentoState>(
          bloc: this._bloc,
          listener: (context, state) {
            if (state is NewDocumentoSaved) {
              Navigator.pop(context);
              f.showSnackbar(
                context,
                f.Snackbar(
                  content: Text('Se grabo exitosamente!'),
                ),
              );
            }
            if (state is NewDocumentoError) {
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
            return Column(mainAxisAlignment: MainAxisAlignment.start,
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                //mainAxisSize: MainAxisSize.max,
                children: [
                  Text('Documentos'),
                  SizedBox(height: 10.0),
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
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Expanded(
                                        child: LabelWithFormFieldInitial(
                                            maxLength: 4,
                                            initialValue:
                                                paramsAltaBaja.anio.toString(),
                                            maxLines: 1,
                                            textAlign: TextAlign.center,
                                            title: 'Año',
                                            keyboardType: TextInputType.text),
                                      ),
                                      SizedBox(width: 25.0),
                                      Expanded(
                                        child: LabelWithFormFieldInitial(
                                            initialValue:
                                                widget.documentoEntity.tipo,
                                            maxLength: 50,
                                            textAlign: TextAlign.center,
                                            title: 'Tipo',
                                            onSaved: (value) {
                                              paramsAltaBaja.tipo = value!;
                                            },
                                            keyboardType: TextInputType.text),
                                      ),
                                      SizedBox(width: 25.0),
                                      Expanded(
                                        child: LabelWithFormFieldInitial(
                                          initialValue:
                                              widget.documentoEntity.estado,
                                          maxLength: 50,
                                          textAlign: TextAlign.center,
                                          title: 'Estado',
                                          keyboardType: TextInputType.text,
                                          onSaved: (value) {
                                            paramsAltaBaja.estado = value!;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5.0),
                                  LabelWithFormFieldInitial(
                                    maxLength: 255,
                                    initialValue: widget.documentoEntity.remite,
                                    maxLines: 2,
                                    textAlign: TextAlign.left,
                                    title: 'Remite',
                                    keyboardType: TextInputType.text,
                                    onSaved: (value) {
                                      paramsAltaBaja.remite = value!;
                                    },
                                  ),
                                  SizedBox(height: 5.0),
                                  LabelWithFormFieldInitial(
                                    initialValue:
                                        widget.documentoEntity.destino,
                                    maxLength: 255,
                                    maxLines: 2,
                                    textAlign: TextAlign.left,
                                    title: 'Destino',
                                    keyboardType: TextInputType.text,
                                    onSaved: (value) {
                                      paramsAltaBaja.destino = value!;
                                    },
                                  ),
                                  SizedBox(height: 5.0),
                                  LabelWithFormFieldInitial(
                                    initialValue: widget.documentoEntity.asunto,
                                    maxLength: 255,
                                    textAlign: TextAlign.left,
                                    title: 'Asunto',
                                    maxLines: 5,
                                    keyboardType: TextInputType.text,
                                    onSaved: (value) {
                                      paramsAltaBaja.asunto = value!;
                                    },
                                  ),
                                  SizedBox(height: 5.0),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          child: LabelWithFormFieldInitial(
                                            initialValue: widget
                                                .documentoEntity.numeroPvn,
                                            maxLength: 15,
                                            textAlign: TextAlign.center,
                                            title: 'N° Doc. PVN',
                                            keyboardType: TextInputType.text,
                                            onSaved: (value) {
                                              paramsAltaBaja.numeroPvn = value!;
                                            },
                                          ),
                                        ),
                                        SizedBox(width: 20.0),
                                        Expanded(
                                          child: LabelWithFormFieldInitial(
                                            initialValue:
                                                widget.documentoEntity.fecha,
                                            maxLength: 10,
                                            maxLines: 1,
                                            textAlign: TextAlign.left,
                                            title: 'Fec. Doc. PVN',
                                            keyboardType: TextInputType.text,
                                            onSaved: (value) {
                                              paramsAltaBaja.fecha = value!;
                                            },
                                          ),
                                        ),
                                      ]),
                                  SizedBox(height: 5.0),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Expanded(
                                        child: LabelWithFormFieldInitial(
                                          initialValue: widget
                                              .documentoEntity.expedientePvn,
                                          maxLength: 15,
                                          textAlign: TextAlign.center,
                                          title: 'Exp. PVN',
                                          keyboardType: TextInputType.text,
                                          onSaved: (value) {
                                            paramsAltaBaja.expedientePvn =
                                                value!;
                                          },
                                        ),
                                      ),
                                      SizedBox(width: 20.0),
                                      Expanded(
                                        child: LabelWithFormFieldInitial(
                                          initialValue: widget
                                              .documentoEntity.expedienteMtc,
                                          maxLength: 15,
                                          textAlign: TextAlign.center,
                                          title: 'Exp. MTC',
                                          keyboardType: TextInputType.text,
                                          onSaved: (value) {
                                            paramsAltaBaja.expedienteMtc =
                                                value!;
                                          },
                                        ),
                                      ),
                                      SizedBox(width: 20.0),
                                      Expanded(
                                        child: LabelWithFormFieldInitial(
                                          initialValue: widget
                                              .documentoEntity.expedienteMef,
                                          maxLength: 15,
                                          textAlign: TextAlign.center,
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
                                    initialValue:
                                        widget.documentoEntity.detalle,
                                    maxLength: 255,
                                    textAlign: TextAlign.left,
                                    title: 'Detalle',
                                    maxLines: 4,
                                    keyboardType: TextInputType.text,
                                    onSaved: (value) {
                                      paramsAltaBaja.detalle = value!;
                                    },
                                  ),
                                  SizedBox(height: 10.0),
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
                                                        paramsNewDocumento:
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
