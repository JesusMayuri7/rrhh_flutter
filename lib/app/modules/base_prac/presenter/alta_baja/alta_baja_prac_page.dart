import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:rrhh_clean/app/modules/base_prac/domain/alta_baja_use_case.dart';

import 'package:rrhh_clean/app/modules/base_prac/domain/practicante_entity.dart';
import 'package:rrhh_clean/app/modules/base_prac/presenter/alta_baja/bloc/alta_baja_prac_bloc.dart';
import 'package:rrhh_clean/core/uitls/widgets/label_with_form_field_initial.dart';

class AltaBajaPracPage extends StatefulWidget {
  final PracticanteEntity practicanteEntity;

  AltaBajaPracPage({
    Key? key,
    required this.practicanteEntity,
  }) : super(key: key);

  @override
  _AltaBajaPracPageState createState() => _AltaBajaPracPageState();
}

class _AltaBajaPracPageState extends State<AltaBajaPracPage> {
  late ParamsAltaBaja paramsAltaBaja;
  final _formKey = GlobalKey<FormState>();
  final _bloc = Modular.get<AltaBajaPracBloc>();

  var maskDateFormatter = new MaskTextInputFormatter(
      mask: '####-##-##', filter: {"#": RegExp(r'[0-9]')});

  @override
  void initState() {
    paramsAltaBaja = ParamsAltaBaja(
        id: widget.practicanteEntity.id,
        anio: widget.practicanteEntity.anio,
        fechaBaja: widget.practicanteEntity.fechaBaja,
        fechaAlta: widget.practicanteEntity.fechaAlta,
        codigoBaja: widget.practicanteEntity.codigoPlaza,
        codigoAlta: '');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocConsumer<AltaBajaPracBloc, AltaBajaPracState>(
          bloc: this._bloc,
          listener: (context, state) {
            if (state is AltaBajaPracLoaded) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('Operacon exitosa')));
            }
            if (state is AltaBajaPracError) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Error al grabar: ' + state.message)));
            }
          },
          builder: (context, state) {
            return Column(mainAxisAlignment: MainAxisAlignment.start,
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                //mainAxisSize: MainAxisSize.max,
                children: [
                  Text('Baja y Alta de Practicante'),
                  SizedBox(height: 10.0),
                  Expanded(
                    child: Scrollbar(
                      thumbVisibility: true,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
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
                                            initialValue:
                                                paramsAltaBaja.anio.toString(),
                                            maxLength: 1,
                                            textAlign: TextAlign.center,
                                            title: 'Año',
                                            keyboardType: TextInputType.text),
                                      ),
                                      SizedBox(width: 25.0),
                                      Expanded(
                                        child: LabelWithFormFieldInitial(
                                            initialValue: widget
                                                .practicanteEntity.codigoPlaza,
                                            maxLength: 1,
                                            textAlign: TextAlign.center,
                                            title: 'Airhsp',
                                            onSaved: (value) {
                                              paramsAltaBaja.codigoBaja =
                                                  value!;
                                            },
                                            keyboardType: TextInputType.text),
                                      ),
                                      SizedBox(width: 25.0),
                                      Expanded(
                                        child: LabelWithFormFieldInitial(
                                            initialValue:
                                                widget.practicanteEntity.plaza,
                                            maxLength: 1,
                                            textAlign: TextAlign.center,
                                            title: 'Plaza',
                                            keyboardType: TextInputType.text),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5.0),
                                  LabelWithFormFieldInitial(
                                      initialValue:
                                          widget.practicanteEntity.descUnidad,
                                      maxLength: 1,
                                      textAlign: TextAlign.left,
                                      title: 'Unidad',
                                      keyboardType: TextInputType.text),
                                  SizedBox(height: 5.0),
                                  LabelWithFormFieldInitial(
                                      initialValue:
                                          widget.practicanteEntity.descArea,
                                      maxLength: 1,
                                      textAlign: TextAlign.left,
                                      title: 'Area',
                                      keyboardType: TextInputType.text),
                                  SizedBox(height: 5.0),
                                  LabelWithFormFieldInitial(
                                      initialValue:
                                          widget.practicanteEntity.dni,
                                      maxLength: 1,
                                      textAlign: TextAlign.left,
                                      title: 'Dni',
                                      keyboardType: TextInputType.text),
                                  SizedBox(height: 5.0),
                                  LabelWithFormFieldInitial(
                                      initialValue:
                                          widget.practicanteEntity.nombres,
                                      maxLength: 1,
                                      textAlign: TextAlign.left,
                                      title: 'Nombres',
                                      keyboardType: TextInputType.text),
                                  SizedBox(height: 5.0),
                                  Container(
                                      alignment: Alignment.center,
                                      child: Text('Estados')),
                                  Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      side: BorderSide(
                                        color: Colors.blue,
                                        width: 2.0,
                                      ),
                                    ),
                                    borderOnForeground: true,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0, vertical: 10.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Expanded(
                                                child: LabelWithFormFieldInitial(
                                                    initialValue: widget
                                                        .practicanteEntity
                                                        .tramite,
                                                    maxLength: 1,
                                                    textAlign: TextAlign.center,
                                                    title: 'Tramite',
                                                    keyboardType:
                                                        TextInputType.text),
                                              ),
                                              SizedBox(width: 20.0),
                                              Expanded(
                                                child:
                                                    LabelWithFormFieldInitial(
                                                        initialValue: widget
                                                            .practicanteEntity
                                                            .estado,
                                                        maxLength: 1,
                                                        textAlign:
                                                            TextAlign.center,
                                                        title: 'Actual',
                                                        keyboardType:
                                                            TextInputType.text),
                                              ),
                                              SizedBox(width: 20.0),
                                              Expanded(
                                                child: LabelWithFormFieldInitial(
                                                    initialValue: widget
                                                        .practicanteEntity
                                                        .estados,
                                                    maxLength: 1,
                                                    textAlign: TextAlign.center,
                                                    title: 'SigaNet',
                                                    keyboardType:
                                                        TextInputType.text),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 5.0),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Expanded(
                                                child:
                                                    LabelWithFormFieldInitial(
                                                        initialValue: widget
                                                            .practicanteEntity
                                                            .estadoPap,
                                                        maxLength: 1,
                                                        textAlign:
                                                            TextAlign.center,
                                                        title: 'PAP',
                                                        keyboardType:
                                                            TextInputType.text),
                                              ),
                                              SizedBox(width: 20.0),
                                              Expanded(
                                                child:
                                                    LabelWithFormFieldInitial(
                                                        initialValue: widget
                                                            .practicanteEntity
                                                            .estadoOpp,
                                                        maxLength: 1,
                                                        textAlign:
                                                            TextAlign.center,
                                                        title: 'OPP',
                                                        keyboardType:
                                                            TextInputType.text),
                                              ),
                                              SizedBox(width: 20.0),
                                              Expanded(
                                                child:
                                                    LabelWithFormFieldInitial(
                                                        initialValue: widget
                                                            .practicanteEntity
                                                            .estadoAir,
                                                        maxLength: 1,
                                                        textAlign:
                                                            TextAlign.center,
                                                        title: 'AIRHSP',
                                                        keyboardType:
                                                            TextInputType.text),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5.0),
                                  LabelWithFormFieldInitial(
                                      initialValue: paramsAltaBaja.fechaBaja,
                                      hintText: '2021-01-01',
                                      maxLength: 10,
                                      textAlign: TextAlign.left,
                                      title: 'Fecha Baja',
                                      inputFormatters: [
                                        maskDateFormatter //set the number limit including slash
                                      ],
                                      onSaved: (value) {
                                        paramsAltaBaja.fechaBaja = value!;
                                      },
                                      keyboardType: TextInputType.text),
                                  LabelWithFormFieldInitial(
                                      maxLength: 6,
                                      textAlign: TextAlign.left,
                                      title: 'Codigo Alta',
                                      onSaved: (value) {
                                        paramsAltaBaja.codigoAlta = value!;
                                      },
                                      validator: (value) {
                                        return value!.length != 6
                                            ? 'Codigo de plaza es de 06 digitos'
                                            : null;
                                      },
                                      keyboardType: TextInputType.text),
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
                                                    AltaBajaPracEventLoad(
                                                        params:
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
