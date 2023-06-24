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
import 'package:rrhh_clean/core/domain/entities/tipo_requerimiento_entity.dart';
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
  List<NewParamsRequerimientoDetalle> _paramsNewRequerimientoDetalleList = [];
  final _formKey = GlobalKey<FormState>();
  final _blocNew = Modular.get<RequerimientoNewBloc>();
  final _blocRequerimiento = Modular.get<RequerimientosBloc>();


  AreaEntity? _areaEntity;
  ModalidadEntity? _modalidadEntity;
  TipoRequerimientoEntity? _tipoRequerimientoEntity;

  List<FuenteEntity> fuentes = [];
  List<MetaEntity> metas = [];
  List<AreaEntity> areas = [];
  List<ModalidadEntity> modalidades = [];
  List<TipoRequerimientoEntity> tipoRequerimientos = [];


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
      this.modalidades = (this._blocRequerimiento.state as RequerimientosLoaded).modalidades;
      this.tipoRequerimientos = (this._blocRequerimiento.state as RequerimientosLoaded).tipoRequerimientos;
   
      _areaEntity = widget.requerimientoEntity == null
          ? areas.first
          : areas.firstWhere(
              (element) => element.id == widget.requerimientoEntity?.areaId);

      _modalidadEntity = widget.requerimientoEntity == null
          ? modalidades.first
          : modalidades.firstWhere((element) =>
              element.id == widget.requerimientoEntity?.modalidadId);

      _tipoRequerimientoEntity = widget.requerimientoEntity == null ? 
        tipoRequerimientos.first : tipoRequerimientos.firstWhere((element) => element.id == widget.requerimientoEntity?.tipoRequerimientoId);

      if (widget.requerimientoEntity == null)
      {   
         paramsNewRequerimiento = NewParamsRequerimiento(anio: '2023');
      }   
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
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
                                modalidadRequerimiento(), 
                                SizedBox(width: 15), 
                                tipoRequerimiento(),
                                SizedBox(width: 15), 
                                areaRequerimiento(),                              
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                documentoPVN(),expedientePVN(), SizedBox(width: 15),fechaDoc(),
                              ],
                            ),                                                               
                            SizedBox(height: 10),                                                                                                                                    
                            Divider(color: Colors.blue),
                            SizedBox(height: 5.0),
                            Row(
                              children: [
                                fuenteDetalle(),SizedBox(width: 5.0),metaDetalle(),SizedBox(width: 5.0),areaDetalle(),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [                                                                                                                                                         
                                cantidadDetalle(),SizedBox(width: 5),cargoDetalle(),SizedBox(width: 5),montoDetalle(),SizedBox(width: 5),
                                buttonAdd()
                              ],
                            ),
                            SizedBox(height: 5),
                            SizedBox(
                              height: 280,
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  gridDetalle(),
                                  Row(
                                    children: [
                                      buttonSave()
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
            ]));
  }

  fluentUi.Expanded buttonAdd() {
    return Expanded(
                                  child: ElevatedButton(
                                      onPressed: () {
                                            _formKey.currentState!.save();                                                  
                                             //this._blocNew.add(AddRequerimientoDetalleEvent(paramsNewRequerimiento: this.paramsNewRequerimiento,                                                    paramsNewRequerimientoDetalle: this.paramsNewRequerimientoDetalle                                                   ));
                                            _paramsNewRequerimientoDetalleList.add(paramsNewRequerimientoDetalle);  
                                                                              
                                      },
                                      child: Text('Add')));
  }

  fluentUi.Expanded buttonSave() {
    return Expanded(
                                        child: ElevatedButton(
                                            onPressed: () {},
                                            child: Text('Guardar')));
  }

  fluentUi.Expanded gridDetalle() {
    return Expanded(
                                  child: DataTableNewRequerimiento(
                                    requerimientoDetalle: _paramsNewRequerimientoDetalleList,
                                    requerimientoNewBloc: this._blocNew )
                                );
  }

  fluentUi.Expanded montoDetalle() {
    return Expanded(
                                flex: 1,
                                child: fluentUi.InfoLabel(
                                  label: 'Monto',
                                  child: fluentUi.TextFormBox(                                                                                                                   
                                    maxLength: 10,
                                    maxLines: 1,
                                    textAlign: TextAlign.right,                                          
                                    keyboardType: TextInputType.number,
                                    onSaved: (value) {
                                      final num monto = num.parse(value!);
                                      paramsNewRequerimientoDetalle.monto = monto;
                                    },
                                  ),
                                ),
                              );
  }

  fluentUi.Expanded cargoDetalle() {
    return Expanded(
                                flex: 3,
                                child: fluentUi.InfoLabel(
                                  label: 'Cargo',
                                  child: fluentUi.TextFormBox(                                                                            
                                    maxLength: 50,
                                    maxLines: 1,
                                    textAlign: TextAlign.left,                                        
                                    keyboardType: TextInputType.text,
                                    onSaved: (value) {
                                      paramsNewRequerimientoDetalle.cargo = value!;
                                    },
                                  ),
                                ),
                              );
  }

  fluentUi.Expanded cantidadDetalle() {
    return Expanded(
                                flex: 1,
                                child: fluentUi.InfoLabel(
                                  label: 'Cant.',
                                  child: fluentUi.TextFormBox(                                                                                                                      
                                    maxLength: 10,
                                    maxLines: 1,
                                    textAlign: TextAlign.right,                                        
                                    keyboardType: TextInputType.number,
                                    onSaved: (value) {
                                      final int cantidad = int.parse(value!);
                                      paramsNewRequerimientoDetalle.cantidad = cantidad;
                                    },
                                  ),
                                ),
                              );
  }

  fluentUi.Expanded modalidadRequerimiento() {
    return Expanded(
                                flex: 3,                                      
                                child: fluentUi.InfoLabel(
                                  label: 'Modalidad',
                                  child: fluentUi.AutoSuggestBox<ModalidadEntity>(     
                                    autofocus: true,                                                
                                                enabled: true,
                                                items: this.modalidades
                                                    .map<fluentUi.AutoSuggestBoxItem<ModalidadEntity>>(
                                                      (modalidad) => fluentUi.AutoSuggestBoxItem<ModalidadEntity>(
                                                        value: modalidad,
                                                        label: modalidad.dsc_modalidad,
                                                      ),
                                                    )
                                                    .toList(),
                                                onSelected: (item) {
                                                  //setState(() => selectedCat = item.value);
                                                },
                                              ),
                                ),
                              );
  }

    fluentUi.Expanded tipoRequerimiento() {
    return Expanded(       
                                flex: 3,                               
                                child: fluentUi.InfoLabel(
                                  label: 'Tipo',
                                  child: fluentUi.AutoSuggestBox<TipoRequerimientoEntity>(     
                                    autofocus: true,                                                
                                                enabled: true,
                                                items: this.tipoRequerimientos
                                                    .map<fluentUi.AutoSuggestBoxItem<TipoRequerimientoEntity>>(
                                                      (tipo) => fluentUi.AutoSuggestBoxItem<TipoRequerimientoEntity>(
                                                        value: tipo,
                                                        label: tipo.descTipoRequerimiento
                                                      ),
                                                    )
                                                    .toList(),
                                                onSelected: (item) {
                                                  //setState(() => selectedCat = item.value);
                                                },
                                              ),
                                ),
                              );
  }

  fluentUi.Expanded areaRequerimiento() {
    return Expanded(      
                              flex: 6,                                    
                              child: fluentUi.InfoLabel(
                                    label: 'Area',
                                    child: fluentUi.AutoSuggestBox<AreaEntity>(                                                     
                                                  enabled: true,
                                                  items: this.areas
                                                      .map<fluentUi.AutoSuggestBoxItem<AreaEntity>>(
                                                        (area) => fluentUi.AutoSuggestBoxItem<AreaEntity>(
                                                          value: area,
                                                          label: area.descArea,                                                           
                                                        ),
                                                      )
                                                      .toList(),
                                                  onSelected: (item) {
                                                    //setState(() => selectedCat = item.value);
                                                  },
                                                ),
                                  ),
                            );
  }

  fluentUi.Expanded documentoPVN() {
    return Expanded(
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
                              );
  }

  fluentUi.Expanded expedientePVN() {
    return Expanded(
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
                              );
  }

  fluentUi.Expanded fechaDoc() {
    return Expanded(
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
                                ), );
  }

  fluentUi.Expanded fuenteDetalle() {
    return Expanded(
                                flex: 2,
                                child: fluentUi.InfoLabel(
                                        label: 'Fuente',
                                        child: fluentUi.AutoSuggestBox<FuenteEntity>(                                                     
                                                      enabled: true,
                                                      items: this.fuentes
                                                          .map<fluentUi.AutoSuggestBoxItem<FuenteEntity>>(
                                                            (fuente) => fluentUi.AutoSuggestBoxItem<FuenteEntity>(
                                                              value: fuente,
                                                              label: fuente.abvFuente,
                                                            ),
                                                          )
                                                          .toList(),
                                                      onSelected: (item) {                                                        
                                                            paramsNewRequerimientoDetalle.fuenteId = item.value!.id;
                                                            paramsNewRequerimientoDetalle.descFuente = item.value!.abvFuente;                                                            
                                                        
                                                      },
                                                    ),
                                      ),
                              );
  }

  fluentUi.Expanded metaDetalle() {
    return Expanded(
      flex: 5,
      child: fluentUi.InfoLabel(
                                        label: 'Meta',
                                        child: fluentUi.AutoSuggestBox<MetaEntity>(                                                                                                     
                                                      enabled: true,
                                                      items: this.metas
                                                          .map<fluentUi.AutoSuggestBoxItem<MetaEntity>>(
                                                            (meta) => fluentUi.AutoSuggestBoxItem<MetaEntity>(
                                                              value: meta,
                                                              label: meta.finalidad,
                                                            ),
                                                          )
                                                          .toList(),
                                                      onSelected: (item) {                                                        
                                                         paramsNewRequerimientoDetalle.metaId = item.value!.idmetaAnual;
                                                         paramsNewRequerimientoDetalle.descMeta = item.value!.finalidad;                                                                                                                  
                                                           
                                                      },
                                                    ),
                                      ),
    );
  }

  fluentUi.Expanded areaDetalle() {
    return Expanded(
                                        flex: 5,
                                        child: fluentUi.InfoLabel(
                                        label: 'Area',
                                        child: fluentUi.AutoSuggestBox<AreaEntity>(                                                                                                     
                                                      enabled: true,
                                                      items: this.areas
                                                          .map<fluentUi.AutoSuggestBoxItem<AreaEntity>>(
                                                            (areas) => fluentUi.AutoSuggestBoxItem<AreaEntity>(
                                                              value: areas,
                                                              label: areas.descArea,
                                                            ),
                                                          )
                                                          .toList(),
                                                      onSelected: (item) {                                                       
                                                         paramsNewRequerimientoDetalle.areaId = item.value!.id;
                                                              paramsNewRequerimientoDetalle.descArea = item.value!.descArea;                                                                                                                                                                                  
                                                      },
                                                    ),
                                      ),
                                      );
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
