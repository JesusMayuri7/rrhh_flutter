import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:collection/collection.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'package:rrhh_clean/app/modules/subsidio/bloc/subsidio_bloc.dart';
import 'package:rrhh_clean/app/modules/subsidio/domain/new_subsidio_devolucion_usecase.dart';

import 'package:rrhh_clean/app/modules/subsidio/presenter/new_subsidio/bloc/new_subsidio_bloc.dart';
import 'package:rrhh_clean/core/domain/entities/certificado_entity.dart';
import 'package:rrhh_clean/core/domain/entities/clasificador_entity.dart';
import 'package:rrhh_clean/core/domain/entities/fuente_entity.dart';
import 'package:rrhh_clean/core/domain/entities/meta_enttity.dart';
import 'package:rrhh_clean/core/uitls/widgets/dropdownmenuitem_presupuesto.dart';
import 'package:rrhh_clean/core/uitls/widgets/label_with_dropdown.dart';

import 'package:rrhh_clean/core/uitls/widgets/label_with_form_field_initial.dart';

class NewSubsidioDevolucionPage extends StatefulWidget {
  final String dscModalidad;
  final ParamsNewSubsidio params;

  const NewSubsidioDevolucionPage({
    Key? key,
    required this.dscModalidad,
    required this.params,
  }) : super(key: key);

  @override
  _NewSubsidioDevolucionPage createState() => _NewSubsidioDevolucionPage();
}

class _NewSubsidioDevolucionPage extends State<NewSubsidioDevolucionPage> {
  ParamsNewSubsidio? newSubsidio;
  final _formKey = GlobalKey<FormState>();

  var maskDateFormatter = new MaskTextInputFormatter(
      mask: '####-##-##', filter: {"#": RegExp(r'[0-9]')});
  TextEditingController montoCertificadoController = TextEditingController();
  CertificadoEntity? _certificadoEntity;
  ClasificadorEntity? _clasificadorEntity;
  MetaEntity? _metaEntity;
  FuenteEntity? _fuenteEntity;
  String _estadoEntity = 'PENDIENTE';

  int modalidadId = 0;
  var _estados = ['VERIFICADO', 'REVISION', 'PENDIENTE'];

  final blocSubsidio = Modular.get<SubsidioBloc>();
  final blocNewSubsidio = Modular.get<NewSubsidioBloc>();

  @override
  void initState() {
    super.initState();
    widget.params.modalidadId = widget.dscModalidad == 'CAS' ? 1 : 3;
    newSubsidio = widget.params;
    newSubsidio?.estado = newSubsidio?.estado ?? 'PENDIENTE';
    _certificadoEntity = (this.blocSubsidio.state as SubsidioLoaded)
        .certificados
        .firstWhereOrNull(
            (element) => element.id == newSubsidio?.certificadoId);

    _fuenteEntity = (this.blocSubsidio.state as SubsidioLoaded)
        .fuentes
        .firstWhereOrNull((element) => element.id == newSubsidio?.fuenteId);

    _metaEntity = (this.blocSubsidio.state as SubsidioLoaded)
        .metas
        .firstWhereOrNull(
            (element) => element.idmetaAnual == newSubsidio?.metaId);

    _clasificadorEntity = (this.blocSubsidio.state as SubsidioLoaded)
        .clasificadores
        .firstWhereOrNull(
            (element) => element.id == newSubsidio?.clasificadorId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewSubsidioBloc, NewSubsidioState>(
      listener: (context, state) {
        if (state is NewSubsidioError) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error al grabar: ' + state.message)));
        }
        if (state is NewSubsidioAdded) {
          print(state.runtimeType);
          Navigator.pop(context);
        }
      },
      bloc: this.blocNewSubsidio,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                flex: 5,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        child: Text('Nueva Devolucion de Subsidio - ' +
                            widget.dscModalidad),
                      ),
                      LabelWithFormFieldInitial(
                        initialValue: newSubsidio?.anio?.toString() ?? '',
                        heightErroStyle: 0.5,
                        maxLength: 4,
                        textAlign: TextAlign.left,
                        title: 'Año',
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onSaved: (value) {
                          newSubsidio?.anio = int.parse(value!);
                        },
                        validator: (value) {
                          if (value!.isEmpty || value.length != 4)
                            return 'Año invalido';
                          return null;
                        },
                      ),
                      LabelWithDropDown<CertificadoEntity>(
                        isExpanded: true,
                        title: 'Certificado',
                        value: _certificadoEntity,
                        dropdownMenuItemList:
                            (this.blocSubsidio.state is SubsidioLoaded)
                                ? buildCertificados(
                                    (this.blocSubsidio.state as SubsidioLoaded)
                                        .certificados)
                                : [],
                        onChanged: (value) {
                          newSubsidio?.certificadoId = value?.id;
                          _certificadoEntity = value;
                        },
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      LabelWithDropDown<FuenteEntity>(
                        title: 'Fuente',
                        value: _fuenteEntity,
                        dropdownMenuItemList:
                            (this.blocSubsidio.state is SubsidioLoaded)
                                ? buildFuentes(
                                    (this.blocSubsidio.state as SubsidioLoaded)
                                        .fuentes)
                                : [],
                        onChanged: (value) {
                          newSubsidio?.fuenteId = value?.id;
                          _fuenteEntity = value;
                        },
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      LabelWithDropDown<MetaEntity>(
                        isExpanded: true,
                        title: 'Meta',
                        value: _metaEntity,
                        dropdownMenuItemList:
                            (this.blocSubsidio.state is SubsidioLoaded)
                                ? buildMetas(
                                    (this.blocSubsidio.state as SubsidioLoaded)
                                        .metas)
                                : [],
                        onChanged: (value) {
                          newSubsidio?.metaId = value?.idmetaAnual;
                          _metaEntity = value;
                        },
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      LabelWithFormFieldInitial(
                        heightErroStyle: 0.5,
                        maxLength: 6,
                        textAlign: TextAlign.left,
                        title: 'Codigo AIRHSP',
                        initialValue: newSubsidio?.codigoPlaza ?? '',
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onSaved: (value) {
                          newSubsidio?.codigoPlaza = value!;
                        },
                        validator: (value) {
                          if (value!.isEmpty || value.length != 6)
                            return 'Codigo invalido';
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      LabelWithFormFieldInitial(
                        heightErroStyle: 0.5,
                        maxLength: 5,
                        textAlign: TextAlign.left,
                        title: 'Codigo SIGA',
                        initialValue: newSubsidio?.codigoSiga ?? '',
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onSaved: (value) {
                          newSubsidio?.codigoSiga = value!;
                        },
                        validator: (value) {
                          if (value!.isEmpty || value.length != 5)
                            return 'Codigo invalido';
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      LabelWithFormFieldInitial(
                        initialValue: newSubsidio?.dni ?? '',
                        heightErroStyle: 0.5,
                        maxLength: 8,
                        textAlign: TextAlign.left,
                        title: 'Dni',
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        keyboardType: TextInputType.number,
                        onSaved: (value) {
                          newSubsidio!.dni = value!;
                        },
                        validator: (value) {
                          if (value!.isEmpty || value.length != 8)
                            return 'Dni invalido';
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      LabelWithFormFieldInitial(
                        initialValue: newSubsidio?.nombres ?? '',
                        heightErroStyle: 0.5,
                        keyboardType: TextInputType.text,
                        maxLength: 200,
                        textAlign: TextAlign.left,
                        title: 'Apellidos y Nombres',
                        inputFormatters: [
                          FilteringTextInputFormatter.singleLineFormatter
                        ],
                        onSaved: (value) {
                          newSubsidio!.nombres = value!;
                        },
                        validator: (value) {
                          if (value!.isEmpty) return 'Nombres invalido';
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      LabelWithFormFieldInitial(
                        initialValue: newSubsidio?.expediente ?? '',
                        heightErroStyle: 0.5,
                        keyboardType: TextInputType.text,
                        maxLength: 20,
                        textAlign: TextAlign.left,
                        title: 'Expediente',
                        inputFormatters: [
                          FilteringTextInputFormatter.singleLineFormatter
                        ],
                        onSaved: (value) {
                          newSubsidio!.expediente = value!;
                        },
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      LabelWithFormFieldInitial(
                        initialValue: newSubsidio?.fechaDevengado ?? '',
                        heightErroStyle: 0.5,
                        hintText: '2021-01-01',
                        maxLength: 20,
                        textAlign: TextAlign.left,
                        title: 'Fecha',
                        onSaved: (value) {
                          newSubsidio?.fechaDevengado = value;
                        },
                        keyboardType: TextInputType.text,
                        inputFormatters: [
                          maskDateFormatter //set the number limit including slash
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                              flex: 7,
                              child: LabelWithDropDown<ClasificadorEntity>(
                                title: 'Clasificador',
                                value: _clasificadorEntity,
                                dropdownMenuItemList:
                                    (this.blocSubsidio.state is SubsidioLoaded)
                                        ? buildClasificadores((this
                                                .blocSubsidio
                                                .state as SubsidioLoaded)
                                            .clasificadores)
                                        : [],
                                onChanged: (value) {
                                  newSubsidio?.clasificadorId = value?.id;
                                  _clasificadorEntity = value;
                                },
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              flex: 3,
                              child: LabelWithFormFieldInitial(
                                initialValue:
                                    newSubsidio?.monto?.toString() ?? '0',
                                maxLength: 15,
                                textAlign: TextAlign.right,
                                title: 'Monto',
                                keyboardType: TextInputType.number,
                                onSaved: (value) {
                                  newSubsidio!.monto = double.parse(value!);
                                },
                              )),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      LabelWithDropDown<String>(
                        title: 'Estado',
                        value: newSubsidio?.estado,
                        dropdownMenuItemList: _estados
                            .map((e) => DropdownMenuItem<String>(
                                  child: Text(e),
                                  value: e,
                                ))
                            .toList(),
                        onChanged: (value) {
                          newSubsidio?.estado = value;
                          _estadoEntity = value!;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState?.save();
                                  this.blocNewSubsidio.add(AddSubsidioEvent(
                                      params: this.newSubsidio!));
                                }
                              },
                              child: Text('Guardar')),
                          ElevatedButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('Cancelar')),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
