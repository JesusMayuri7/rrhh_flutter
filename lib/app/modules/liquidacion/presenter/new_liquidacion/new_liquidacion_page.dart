import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:rrhh_clean/app/modules/liquidacion/bloc/liquidacion_bloc.dart';

import 'package:rrhh_clean/app/modules/liquidacion/domain/entities/liquidacion_detalle._entity.dart';

import 'package:rrhh_clean/app/modules/liquidacion/domain/usecases/add_liquidacion_usecase.dart';
import 'package:rrhh_clean/app/modules/liquidacion/presenter/new_liquidacion/bloc/new_liquidacion_bloc.dart';
import 'package:rrhh_clean/core/domain/entities/clasificador_entity.dart';
import 'package:rrhh_clean/core/domain/entities/fuente_entity.dart';
import 'package:rrhh_clean/core/domain/entities/meta_enttity.dart';
import 'package:rrhh_clean/core/uitls/constants/constants.dart';
import 'package:rrhh_clean/core/uitls/widgets/dropdownmenuitem_presupuesto.dart';
import 'package:rrhh_clean/core/uitls/widgets/label_with_dropdown.dart';
import 'package:rrhh_clean/core/uitls/widgets/label_with_form_field.dart';

class NewLiquidacionPage extends StatefulWidget {
  final String dscModalidad;
  final String anioSelected;

  const NewLiquidacionPage({
    Key? key,
    required this.dscModalidad,
    required this.anioSelected,
  }) : super(key: key);

  @override
  _NewLiquidacionPageState createState() => _NewLiquidacionPageState();
}

class _NewLiquidacionPageState extends State<NewLiquidacionPage> {
  ParamsAddLiquidacion? newLiquidacion;
  final _formKey = GlobalKey<FormState>();

  TextEditingController montoCertificadoController = TextEditingController();
  ClasificadorEntity? _clasificadorEntity;
  MetaEntity? _metaEntity;
  FuenteEntity? _fuenteEntity;

  final newLiquidacionBloc = Modular.get<NewLiquidacionBloc>();
  final blocLiquidacion = Modular.get<LiquidacionBloc>();

  @override
  void initState() {
    this
        .newLiquidacionBloc
        .add(GetLiquidacionClasificadoresEvent(anio: widget.anioSelected));

    newLiquidacion = ParamsAddLiquidacion(
        anio: widget.anioSelected,
        modalidadId: widget.dscModalidad == 'CAS' ? 1 : 3,
        dscCertificado: '',
        fuenteId: 1,
        metaId: 0,
        codigoPlaza: '',
        codigoSiga: '',
        dni: '',
        nombres: '',
        expediente: '',
        liquidacionDetalle: []);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewLiquidacionBloc, NewLiquidacionState>(
      listener: (context, state) {
        if (state is NewLiquidacionError)
          SnackBar(content: Text(state.message));
      },
      bloc: this.newLiquidacionBloc,
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
                        child:
                            Text('Nueva Liquidacion - ' + widget.dscModalidad),
                      ),
                      Text(newLiquidacion!.anio),
                      LabelWithFormField(
                        maxLength: 10,
                        textAlign: TextAlign.left,
                        title: 'Certificado',
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onSaved: (value) {
                          newLiquidacion?.dscCertificado = value!;
                        },
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      LabelWithDropDown<FuenteEntity>(
                        title: 'Fuente',
                        value: _fuenteEntity,
                        dropdownMenuItemList: buildFuentes(fuentes),
                        onChanged: (value) {
                          newLiquidacion!.fuenteId = value!.id;
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
                        dropdownMenuItemList: (this.blocLiquidacion.state
                                is LiquidacionLoadedState)
                            ? buildMetas((this.blocLiquidacion.state
                                    as LiquidacionLoadedState)
                                .metas)
                            : [],
                        onChanged: (value) {
                          newLiquidacion!.metaId = value!.idmetaAnual;
                          _metaEntity = value;
                        },
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      LabelWithFormField(
                        heightErroStyle: 0.5,
                        maxLength: 6,
                        textAlign: TextAlign.left,
                        title: 'Codigo AIRHSP',
                        //textController: codigoAirhspController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onSaved: (value) {
                          newLiquidacion?.codigoPlaza = value!;
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
                      LabelWithFormField(
                        heightErroStyle: 0.5,
                        maxLength: 5,
                        textAlign: TextAlign.left,
                        title: 'Codigo SIGA',
                        //textController: codigoAirhspController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onSaved: (value) {
                          newLiquidacion?.codigoSiga = value!;
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
                      LabelWithFormField(
                        heightErroStyle: 0.5,
                        maxLength: 8,
                        textAlign: TextAlign.left,
                        title: 'Dni',
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        keyboardType: TextInputType.number,
                        onSaved: (value) {
                          newLiquidacion!.dni = value!;
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
                      LabelWithFormField(
                        heightErroStyle: 0.5,
                        keyboardType: TextInputType.text,
                        maxLength: 200,
                        textAlign: TextAlign.left,
                        title: 'Apellidos y Nombres',
                        inputFormatters: [
                          FilteringTextInputFormatter.singleLineFormatter
                        ],
                        onSaved: (value) {
                          newLiquidacion!.nombres = value!;
                        },
                        validator: (value) {
                          if (value!.isEmpty) return 'Nombres invalido';
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      LabelWithFormField(
                        heightErroStyle: 0.5,
                        keyboardType: TextInputType.text,
                        maxLength: 20,
                        textAlign: TextAlign.left,
                        title: 'Expediente SIAF',
                        inputFormatters: [
                          FilteringTextInputFormatter.singleLineFormatter
                        ],
                        onSaved: (value) {
                          newLiquidacion!.expediente = value!;
                        },
                      ),
                      Divider(color: Colors.blue),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                              flex: 7,
                              child: LabelWithDropDown<ClasificadorEntity>(
                                title: 'Clasificador',
                                value: _clasificadorEntity,
                                dropdownMenuItemList: (this
                                        .blocLiquidacion
                                        .state is LiquidacionLoadedState)
                                    ? buildClasificadores((this
                                            .blocLiquidacion
                                            .state as LiquidacionLoadedState)
                                        .clasificadores)
                                    : [],
                                onChanged: (value) {
                                  _clasificadorEntity = value;
                                },
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              flex: 3,
                              child: LabelWithFormField(
                                  maxLength: 15,
                                  textAlign: TextAlign.right,
                                  title: 'Monto',
                                  textController:
                                      this.montoCertificadoController,
                                  keyboardType: TextInputType.number)),
                          SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                this.newLiquidacionBloc.add(
                                    AddClasificadorMontoEvent(
                                        clasificadorEntity:
                                            _clasificadorEntity!,
                                        montoCertificado: double.parse(this
                                            .montoCertificadoController
                                            .text)));
                                this.montoCertificadoController.text = '0';
                              },
                              child: Text('Agregar'))
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      _listClasificadores(state),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate() &&
                                    (state as NewLiquidacionSuccessState)
                                            .clasificadorMonto
                                            .length >
                                        0) {
                                  _formKey.currentState?.save();
                                  newLiquidacion!.liquidacionDetalle = [
                                    for (var item in state.clasificadorMonto)
                                      LiquidacionDetalleEntity(
                                        clasificador: item['dsc_clasificador'],
                                        montoDevengado: 0,
                                        montoDevolucion: 0,
                                        montoCertificado:
                                            item['monto_certificado'],
                                        montoLiquidacion: 0,
                                        id: item['id'],
                                      )
                                  ];
                                  this.newLiquidacionBloc.add(
                                      AddLiquidacionEvent(
                                          liquidacionEntity: newLiquidacion!));
                                  print(newLiquidacion.toString());
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

  Widget _listClasificadores(stateClasificadores) {
    if (stateClasificadores is NewLiquidacionSuccessState) {
      print('listadoState ' + stateClasificadores.clasificadorMonto.toString());
      return (stateClasificadores.clasificadorMonto.length > 0)
          ? Expanded(
              child: DataTable(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.amber, width: 2)),
                  headingRowColor:
                      MaterialStateColor.resolveWith((states) => Colors.amber),
                  headingRowHeight: 20,
                  headingTextStyle: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                  dataRowHeight: 22,
                  columns: const <DataColumn>[
                    DataColumn(
                      label: Text(
                        'Clasificador',
                      ),
                    ),
                    DataColumn(
                      numeric: true,
                      label: Text(
                        'Monto',
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Accion',
                      ),
                    ),
                  ],
                  rows: stateClasificadores.clasificadorMonto
                      .map(
                        (e) => DataRow(
                          cells: <DataCell>[
                            DataCell(Text(e['id'].toString() +
                                ': ' +
                                e['dsc_clasificador'])),
                            DataCell(Text(NumberFormat('#,##0.00', 'en_US')
                                .format(double.parse(
                                    e['monto_certificado'].toString())))),
                            DataCell(Text('Del')),
                          ],
                        ),
                      )
                      .toList()))
          : Container();
    } else
      return Container();
  }
}
