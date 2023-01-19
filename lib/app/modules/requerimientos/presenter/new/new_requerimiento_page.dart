// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:pluto_grid/pluto_grid.dart';

import 'package:rrhh_clean/app/modules/requerimientos/domain/requerimiento_entity.dart';
import 'package:rrhh_clean/app/modules/requerimientos/presenter/bloc/requerimientos_bloc.dart';
import 'package:rrhh_clean/app/modules/requerimientos/presenter/get_columns_grid.dart';

import 'package:rrhh_clean/core/domain/entities/area_entity.dart';
import 'package:rrhh_clean/core/domain/entities/fuente_entity.dart';
import 'package:rrhh_clean/core/domain/entities/meta_enttity.dart';
import 'package:rrhh_clean/core/domain/entities/modalidad_entity.dart';
import 'package:rrhh_clean/core/uitls/widgets/dropdown_form_presupuestal.dart';

import 'package:rrhh_clean/core/uitls/widgets/label_with_form_field_initial.dart';
import 'package:rrhh_clean/core/uitls/widgets/show_toast_dialog.dart';

import 'bloc/requerimiento_new_bloc.dart';

class NewRequerimientoPage extends StatefulWidget {
  RequerimientoEntity? requerimientoEntity;
  final BuildContext contextReq;

  NewRequerimientoPage({
    Key? key,
    required this.requerimientoEntity,
    required this.contextReq,
  }) : super(key: key);

  @override
  _NewRequerimientoPageState createState() => _NewRequerimientoPageState();
}

class _NewRequerimientoPageState extends State<NewRequerimientoPage> {
  late NewParamsRequerimiento paramsNewRequerimiento;
  final _formKey = GlobalKey<FormState>();
  final _blocNew = Modular.get<RequerimientoNewBloc>();
  final _blocRequerimiento = Modular.get<RequerimientosBloc>();

  static PlutoGridStateManager? stateManagerDetail = null;
  List<PlutoRow> rowsDetail = [];

  FuenteEntity? _fuenteEntity;
  MetaEntity? _metaEntity;
  AreaEntity? _areaEntity;
  ModalidadEntity? _modalidadEntity;

  List<FuenteEntity> fuentes = [];
  List<MetaEntity> metas = [];
  List<AreaEntity> areas = [];
  List<ModalidadEntity> modalidades = [];
  var maskDateFormatter = new MaskTextInputFormatter(
      mask: '####-##-##', filter: {"#": RegExp(r'[0-9]')});

  @override
  void initState() {
    super.initState();
    if (this._blocRequerimiento.state is RequerimientosLoaded) {
      this.fuentes =
          (this._blocRequerimiento.state as RequerimientosLoaded).fuentes;
      this.metas =
          (this._blocRequerimiento.state as RequerimientosLoaded).metas;
      this.areas =
          (this._blocRequerimiento.state as RequerimientosLoaded).areas;
      this.modalidades =
          (this._blocRequerimiento.state as RequerimientosLoaded).modalidades;

      _areaEntity = widget.requerimientoEntity == null
          ? areas.first
          : areas.firstWhere(
              (element) => element.id == widget.requerimientoEntity?.areaId);

      _metaEntity = widget.requerimientoEntity == null
          ? metas.first
          : metas.firstWhere((element) =>
              element.idmetaAnual == widget.requerimientoEntity?.metaId);

      _fuenteEntity = widget.requerimientoEntity == null
          ? fuentes.first
          : fuentes.firstWhere(
              (element) => element.id == widget.requerimientoEntity?.fuenteId);

      _modalidadEntity = widget.requerimientoEntity == null
          ? modalidades.first
          : modalidades.firstWhere((element) =>
              element.id == widget.requerimientoEntity?.modalidadId);

      if (widget.requerimientoEntity == null)
        paramsNewRequerimiento = NewParamsRequerimiento(anio: '2023');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocConsumer<RequerimientoNewBloc, RequerimientoNewState>(
          bloc: this._blocNew,
          listener: (context, state) {
            if (state is RequerimientoNewSaved) {
              showToastSuccess(context, 'Se grabao correctamente');
              Navigator.pop(context);
            }
            if (state is RequerimientoNewError) {
              showToastError(context, state.toString());
            }
          },
          builder: (context, state) {
            return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Requerimientos - ' +
                      paramsNewRequerimiento.anio.toString()),
                  SizedBox(height: 10.0),
                  Expanded(
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
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Expanded(
                                      flex: 8,
                                      child: DropdownFormPresupuestal<
                                              ModalidadEntity>(
                                          label: 'Modalidad',
                                          hintText: 'Buscar Modalidad',
                                          value: _modalidadEntity!,
                                          hint: 'Seleccione Modalidad',
                                          dropdownWidth: 350,
                                          dropDownMenuItems: this
                                              .modalidades
                                              .map<
                                                      DropdownMenuItem<
                                                          ModalidadEntity>>(
                                                  (ModalidadEntity value) {
                                            return DropdownMenuItem<
                                                ModalidadEntity>(
                                              child: Text(
                                                  '${value.dsc_modalidad}',
                                                  style:
                                                      TextStyle(fontSize: 11)),
                                              value: value,
                                            );
                                          }).toList(),
                                          onChanged: (value) {
                                            paramsNewRequerimiento.modalidad =
                                                value!;
                                            //  _areaEntity = value;
                                          }),
                                    ),
                                    SizedBox(width: 15),
                                    Expanded(
                                      flex: 4,
                                      child: LabelWithFormFieldInitial(
                                        initialValue: paramsNewRequerimiento
                                            .expedientePvn!,
                                        maxLength: 30,
                                        maxLines: 1,
                                        textAlign: TextAlign.right,
                                        title: 'Exp. PVN',
                                        keyboardType: TextInputType.text,
                                        onSaved: (value) {
                                          paramsNewRequerimiento.expedientePvn =
                                              value!;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Expanded(
                                      flex: 8,
                                      child: DropdownFormPresupuestal<
                                              FuenteEntity>(
                                          label: 'Fuente',
                                          hintText: 'Buscar Fuente',
                                          value: _fuenteEntity!,
                                          hint: 'Seleccione Fuente',
                                          dropdownWidth: 350,
                                          dropDownMenuItems: this.fuentes.map<
                                                  DropdownMenuItem<
                                                      FuenteEntity>>(
                                              (FuenteEntity value) {
                                            return DropdownMenuItem<
                                                FuenteEntity>(
                                              child: Text('${value.dscFuente}',
                                                  style:
                                                      TextStyle(fontSize: 11)),
                                              value: value,
                                            );
                                          }).toList(),
                                          onChanged: (value) {
                                            paramsNewRequerimiento.fuente =
                                                value;
                                            //  _areaEntity = value;
                                          }),
                                    ),
                                    SizedBox(width: 15),
                                    Expanded(
                                      flex: 4,
                                      child: LabelWithFormFieldInitial(
                                        initialValue: paramsNewRequerimiento
                                            .documentoPvn!,
                                        maxLength: 30,
                                        maxLines: 1,
                                        textAlign: TextAlign.right,
                                        title: 'Doc. PVN',
                                        keyboardType: TextInputType.text,
                                        onSaved: (value) {
                                          paramsNewRequerimiento.documentoPvn =
                                              value!;
                                        },
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Expanded(
                                      flex: 8,
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownFormPresupuestal<
                                                MetaEntity>(
                                            label: 'Meta',
                                            hintText: 'Buscar Meta',
                                            value: _metaEntity!,
                                            hint: 'Seleccione Meta',
                                            dropdownWidth: 350,
                                            dropDownMenuItems: this.metas.map<
                                                    DropdownMenuItem<
                                                        MetaEntity>>(
                                                (MetaEntity value) {
                                              return DropdownMenuItem<
                                                  MetaEntity>(
                                                child: Text(
                                                    '${value.finalidad}',
                                                    style: TextStyle(
                                                        fontSize: 11)),
                                                value: value,
                                              );
                                            }).toList(),
                                            onChanged: (value) {
                                              paramsNewRequerimiento.meta =
                                                  value;
                                              //  _areaEntity = value;
                                            }),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      flex: 4,
                                      child: LabelWithFormFieldInitial(
                                        initialValue: paramsNewRequerimiento
                                            .fechaDocumento!,
                                        maxLength: 30,
                                        maxLines: 1,
                                        textAlign: TextAlign.right,
                                        title: 'Fecha Doc.',
                                        keyboardType: TextInputType.text,
                                        onSaved: (value) {
                                          paramsNewRequerimiento
                                              .fechaDocumento = value!;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 15),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Expanded(
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownFormPresupuestal<
                                                AreaEntity>(
                                            label: 'Area',
                                            hintText: 'Buscar Area',
                                            value: _areaEntity!,
                                            hint: 'Seleccione Area',
                                            dropdownWidth: 350,
                                            dropDownMenuItems: this.areas.map<
                                                    DropdownMenuItem<
                                                        AreaEntity>>(
                                                (AreaEntity value) {
                                              return DropdownMenuItem<
                                                  AreaEntity>(
                                                child: Text('${value.descArea}',
                                                    style: TextStyle(
                                                        fontSize: 11)),
                                                value: value,
                                              );
                                            }).toList(),
                                            onChanged: (value) {
                                              paramsNewRequerimiento.orgArea =
                                                  value;
                                              //  _areaEntity = value;
                                            }),
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(color: Colors.blue),
                                SizedBox(height: 5.0),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: LabelWithFormFieldInitial(
                                        initialValue: paramsNewRequerimiento
                                            .fechaDocumento!,
                                        maxLength: 30,
                                        maxLines: 1,
                                        textAlign: TextAlign.right,
                                        title: 'Cant.',
                                        keyboardType: TextInputType.text,
                                        onSaved: (value) {
                                          paramsNewRequerimiento
                                              .fechaDocumento = value!;
                                        },
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Expanded(
                                      flex: 3,
                                      child: LabelWithFormFieldInitial(
                                        initialValue: paramsNewRequerimiento
                                            .fechaDocumento!,
                                        maxLength: 30,
                                        maxLines: 1,
                                        textAlign: TextAlign.right,
                                        title: 'Sub Area',
                                        keyboardType: TextInputType.text,
                                        onSaved: (value) {
                                          paramsNewRequerimiento
                                              .fechaDocumento = value!;
                                        },
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Expanded(
                                      flex: 3,
                                      child: LabelWithFormFieldInitial(
                                        initialValue: paramsNewRequerimiento
                                            .fechaDocumento!,
                                        maxLength: 30,
                                        maxLines: 1,
                                        textAlign: TextAlign.right,
                                        title: 'Cargo',
                                        keyboardType: TextInputType.text,
                                        onSaved: (value) {
                                          paramsNewRequerimiento
                                              .fechaDocumento = value!;
                                        },
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Expanded(
                                      flex: 1,
                                      child: LabelWithFormFieldInitial(
                                        initialValue: paramsNewRequerimiento
                                            .fechaDocumento!,
                                        maxLength: 10,
                                        maxLines: 1,
                                        textAlign: TextAlign.right,
                                        title: 'Monto',
                                        keyboardType: TextInputType.text,
                                        onSaved: (value) {
                                          paramsNewRequerimiento
                                              .fechaDocumento = value!;
                                        },
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Expanded(
                                        child: ElevatedButton(
                                            onPressed: () {},
                                            child: Text('Add')))
                                  ],
                                ),
                                SizedBox(height: 5),
                                SizedBox(
                                  height: 280,
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: PlutoGrid(
                                            key: ValueKey(
                                                'AddRequerimientoDetail'),
                                            configuration:
                                                PlutoGridConfiguration(
                                              columnFilter:
                                                  PlutoGridColumnFilterConfig(),
                                              scrollbar:
                                                  PlutoGridScrollbarConfig(
                                                      isAlwaysShown: true),
                                              style: PlutoGridStyleConfig(
                                                cellTextStyle:
                                                    TextStyle(fontSize: 11),
                                                columnTextStyle: TextStyle(
                                                    fontSize: 11,
                                                    color: Colors.white),
                                                columnHeight: 25,
                                                rowHeight: 21,
                                                columnFilterHeight: 25,
                                                enableGridBorderShadow: true,
                                              ),
                                            ),
                                            columns: columnsDetail,
                                            rows: [],
                                            onChanged: (PlutoGridOnChangedEvent
                                                event) {},
                                            onLoaded:
                                                (PlutoGridOnLoadedEvent event) {
                                              //  stateManagerDetail = event.stateManager;
                                              event.stateManager
                                                  .setShowColumnFilter(true);
                                            }),
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                              child: ElevatedButton(
                                                  onPressed: () {},
                                                  child: Text('Guardar')))
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ]),
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
