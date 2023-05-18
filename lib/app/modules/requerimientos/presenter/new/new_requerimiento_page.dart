import 'package:fluent_ui/fluent_ui.dart' as fluentUi;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';


import 'package:rrhh_clean/app/modules/requerimientos/domain/requerimiento_entity.dart';
import 'package:rrhh_clean/app/modules/requerimientos/presenter/bloc/requerimientos_bloc.dart';
import 'package:rrhh_clean/app/modules/requerimientos/presenter/new/datatable_new_requerimiento.dart';


import 'package:rrhh_clean/core/domain/entities/area_entity.dart';
import 'package:rrhh_clean/core/domain/entities/fuente_entity.dart';
import 'package:rrhh_clean/core/domain/entities/meta_enttity.dart';
import 'package:rrhh_clean/core/domain/entities/modalidad_entity.dart';
import 'package:rrhh_clean/core/uitls/widgets/label_with_form_field_initial.dart';
import 'package:rrhh_clean/core/uitls/widgets/show_toast_dialog.dart';

import 'bloc/requerimiento_new_bloc.dart';

class NewRequerimientoPage extends StatefulWidget {
  final RequerimientoEntity? requerimientoEntity;
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
  NewParamsRequerimientoDetalle paramsNewRequerimientoDetalle = NewParamsRequerimientoDetalle();
  final _formKey = GlobalKey<FormState>();
  final _blocNew = Modular.get<RequerimientoNewBloc>();
  final _blocRequerimiento = Modular.get<RequerimientosBloc>();


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
              (element) => element.id == widget.requerimientoEntity?.unidadId);

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

       print(modalidades);     
       print(_modalidadEntity);     

    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocConsumer<RequerimientoNewBloc, RequerimientoNewState>(
          bloc: this._blocNew,
          listener: (context, state) {
            if (state.statusNewRequerimiento == StatusNewRequerimiento.saved) {
              showToastSuccess(context, 'Se grabao correctamente');
              Navigator.pop(context);
            }
            if (state.statusNewRequerimiento == StatusNewRequerimiento.error) {
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
                                    SizedBox(
                                      width: 350.0,
                                      child: fluentUi.InfoLabel(
                                        label: 'Modalidad',
                                        child: fluentUi.AutoSuggestBox<ModalidadEntity>(                                                     
                                                      enabled: true,
                                                      items: this.modalidades
                                                          .map<fluentUi.AutoSuggestBoxItem<ModalidadEntity>>(
                                                            (modalidad) => fluentUi.AutoSuggestBoxItem<ModalidadEntity>(
                                                              value: modalidad,
                                                              label: modalidad.dsc_modalidad,
                                                              onFocusChange: (focused) {
                                                                if (focused) debugPrint('Focused $modalidad');
                                                              },
                                                            ),
                                                          )
                                                          .toList(),
                                                      onSelected: (item) {
                                                        //setState(() => selectedCat = item.value);
                                                      },
                                                    ),
                                      ),
                                    ),
                                      SizedBox(width: 15),
                                    Expanded(
                                      flex: 4,
                                      child: fluentUi.InfoLabel(
                                        label: 'Exp. PVN',
                                        child: fluentUi.TextFormBox(
                                          initialValue: paramsNewRequerimiento
                                              .expedientePvn!,
                                          maxLength: 30,
                                          maxLines: 1,
                                          textAlign: TextAlign.right,                                        
                                          keyboardType: TextInputType.text,
                                          onSaved: (value) {
                                            paramsNewRequerimiento.expedientePvn =
                                                value!;
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    SizedBox(
                                          width: 350.0,
                                          child: fluentUi.InfoLabel(
                                            label: 'Fuente',
                                            child: fluentUi.AutoSuggestBox<FuenteEntity>(                                                     
                                                          enabled: true,
                                                          items: this.fuentes
                                                              .map<fluentUi.AutoSuggestBoxItem<FuenteEntity>>(
                                                                (fuente) => fluentUi.AutoSuggestBoxItem<FuenteEntity>(
                                                                  value: fuente,
                                                                  label: fuente.dscFuente,
                                                                  onFocusChange: (focused) {
                                                                    if (focused) debugPrint('Focused $fuente');
                                                                  },
                                                                ),
                                                              )
                                                              .toList(),
                                                          onSelected: (item) {
                                                            //setState(() => selectedCat = item.value);
                                                          },
                                                        ),
                                          ),
                                        ),
                                                                            SizedBox(width: 15),
                                    Expanded(
                                      flex: 4,
                                      child: fluentUi.InfoLabel(
                                        label: 'Doc. PVN',
                                        child: fluentUi.TextFormBox(
                                          initialValue: paramsNewRequerimiento
                                              .documentoPvn!,
                                          maxLength: 30,
                                          maxLines: 1,
                                          textAlign: TextAlign.right,                                        
                                          keyboardType: TextInputType.text,
                                          onSaved: (value) {
                                            paramsNewRequerimiento.documentoPvn =
                                                value!;
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),                                                               
                                SizedBox(height: 10),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                                                            SizedBox(
                                          width: 350.0,
                                    child: fluentUi.InfoLabel(
                                          label: 'Area',
                                          child: fluentUi.AutoSuggestBox<AreaEntity>(                                                     
                                                        enabled: true,
                                                        items: this.areas
                                                            .map<fluentUi.AutoSuggestBoxItem<AreaEntity>>(
                                                              (area) => fluentUi.AutoSuggestBoxItem<AreaEntity>(
                                                                value: area,
                                                                label: area.descArea,
                                                                onFocusChange: (focused) {
                                                                  if (focused) debugPrint('Focused $area');
                                                                },
                                                              ),
                                                            )
                                                            .toList(),
                                                        onSelected: (item) {
                                                          //setState(() => selectedCat = item.value);
                                                        },
                                                      ),
                                        ),
                                  ),
                                     SizedBox(width: 15),
                                    Expanded(
                                      flex: 4,
                                      child: fluentUi.InfoLabel(
                                      label: 'Fecha Doc.',
                                        child: fluentUi.TextFormBox(
                                          initialValue: paramsNewRequerimiento
                                              .fechaDocumento!,
                                          maxLength: 30,
                                          maxLines: 1,
                                          textAlign: TextAlign.right,                                          
                                          keyboardType: TextInputType.text,
                                          onSaved: (value) {
                                            paramsNewRequerimiento
                                                .fechaDocumento = value!;
                                          },
                                      ),
                                      ), ),
                              ],),                                                                                                                                       
                                SizedBox(height: 15),                                   
                                Divider(color: Colors.blue),
                                SizedBox(height: 5.0),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: LabelWithFormFieldInitial(
                                        initialValue: paramsNewRequerimientoDetalle.cantidad.toString(),                                            
                                        maxLength: 30,
                                        maxLines: 1,
                                        textAlign: TextAlign.right,
                                        title: 'Cant.',
                                        keyboardType: TextInputType.text,
                                        onSaved: (value) {
                                          final int cantidad = int.parse(value!);
                                          paramsNewRequerimientoDetalle.cantidad = cantidad;
                                        },
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Expanded(
                                      flex: 3,
                                      child: LabelWithFormFieldInitial(
                                        initialValue: paramsNewRequerimientoDetalle.descArea,
                                        maxLength: 30,
                                        maxLines: 1,
                                        textAlign: TextAlign.right,
                                        title: 'Sub Area',
                                        keyboardType: TextInputType.text,
                                        onSaved: (value) {
                                          paramsNewRequerimientoDetalle.descArea = value!;
                                        },
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Expanded(
                                      flex: 3,
                                      child: LabelWithFormFieldInitial(
                                        initialValue: paramsNewRequerimientoDetalle.cargo,
                                        maxLength: 30,
                                        maxLines: 1,
                                        textAlign: TextAlign.right,
                                        title: 'Cargo',
                                        keyboardType: TextInputType.text,
                                        onSaved: (value) {
                                          paramsNewRequerimientoDetalle.cargo = value!;
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
                                          final num monto = num.parse(value!);
                                          paramsNewRequerimientoDetalle.monto = monto;
                                        },
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Expanded(
                                        child: ElevatedButton(
                                            onPressed: () {
                                                  _formKey.currentState!.save();
                                                   this._blocNew.add(AddRequerimientoDetalleEvent(
                                                    newParamsRequerimiento: this.paramsNewRequerimiento,
                                                    paramsNewRequerimientoDetalle: this.paramsNewRequerimientoDetalle
                                                   ));
                                            },
                                            child: Text('Add')))
                                  ],
                                ),
                                SizedBox(height: 5),
                                SizedBox(
                                  height: 280,
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: DataTableNewRequerimiento(requerimientoDetalle: state.requerimientoEntity == null ? [] : state.requerimientoEntity!.requerimientoDetalle )
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
