import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../bloc/confianza_bloc.dart';
import '../../../../../core/domain/entities/area_entity.dart';
import '../../domain/entities/confianza_entity.dart';
import '../../../../../core/uitls/widgets/label_with_dropdown.dart';
import '../../../../../core/uitls/widgets/label_with_form_field.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'bloc/edti_confianza_bloc.dart';

class EditConfianzaPage extends StatefulWidget {
  EditConfianzaPage({Key? key, required this.confianzaEntity})
      : super(key: key);

  final ConfianzaEntity confianzaEntity;

  @override
  _EditConfianzaPageState createState() => _EditConfianzaPageState();
}

class _EditConfianzaPageState extends State<EditConfianzaPage> {
  TextEditingController dniController = TextEditingController();
  TextEditingController nombresController = TextEditingController();
  TextEditingController inicioController = TextEditingController();
  TextEditingController finController = TextEditingController();
  TextEditingController docAltaController = TextEditingController();
  TextEditingController docBajaController = TextEditingController();
  TextEditingController modalidadController = TextEditingController();
  TextEditingController tipoController = TextEditingController();
  TextEditingController cargoController = TextEditingController();
  TextEditingController plazaController = TextEditingController();
  TextEditingController direccionController = TextEditingController();
  List<DropdownMenuItem<AreaEntity>>? listDropDownItemAreas;
  int? _area;
  final _formKey = GlobalKey<FormState>();
  late ConfianzaEntity dataForm;
  final blocEdit = Modular.get<EditConfianzaBloc>();
  final blocApp = Modular.get<ConfianzaBloc>();
  List<AreaEntity> listAreas = [];
  var maskDateFormatter = new MaskTextInputFormatter(
      mask: '####-##-##', filter: {"#": RegExp(r'[0-9]')});

  @override
  void initState() {
    super.initState();
    this.dniController.text = widget.confianzaEntity.dni;
    this.nombresController.text = widget.confianzaEntity.nombres;
    this.cargoController.text = widget.confianzaEntity.cargo;
    this.inicioController.text = widget.confianzaEntity.inicio;
    this.finController.text = widget.confianzaEntity.fin;
    this.docAltaController.text = widget.confianzaEntity.docDesignacion;
    this.docBajaController.text = widget.confianzaEntity.docCese;
    this.modalidadController.text = widget.confianzaEntity.modalidad;
    this.direccionController.text = widget.confianzaEntity.direccion;
    this.tipoController.text = widget.confianzaEntity.tipo;
    this.plazaController.text = widget.confianzaEntity.plaza;
    if (blocApp.state is ConfianzaAreaStateLoaded)
      listAreas = (blocApp.state as ConfianzaAreaStateLoaded).listAreas;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditConfianzaBloc, EdtiConfianzaState>(
        buildWhen: (previous, current) =>
            previous.runtimeType != current.runtimeType,
        bloc: this.blocEdit,
        listener: (context, state) {
          if (state is EdtiConfianzaError)
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.black,
              content: Text(state.message),
            ));
          if (state is EdtiConfianzaSaved) Navigator.pop(context);
          if (state is EditConfianzaCreated) Navigator.pop(context);
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              //mainAxisSize: MainAxisSize.max,
              children: [
                Text('Personal de Confianza'),
                Expanded(
                  child: Scrollbar(
                    isAlwaysShown: true,
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
                              Divider(),
                              LabelWithDropDown(
                                  value: modalidadController.text,
                                  dropdownMenuItemList:
                                      _buildModalidad(['CAP', 'CAS']),
                                  onChanged: (String? value) {
                                    this.modalidadController.text = value!;
                                  },
                                  title: 'Modalidad'),
                              SizedBox(
                                height: 5,
                              ),
                              LabelWithFormField(
                                heightErroStyle: 0.5,
                                maxLength: 6,
                                textAlign: TextAlign.left,
                                title: 'Codigo AIRHSP',
                                textController: plazaController,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                /*
                                validator: (value) {
                                  if (value == '000000' || value!.isEmpty)
                                    return 'codigo airhsp requerido';
                                },*/
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              LabelWithDropDown(
                                  value: tipoController.text,
                                  dropdownMenuItemList: _buildTipo(
                                      ['DESIGNACION', 'ENCARGATURA']),
                                  onChanged: (String? value) {
                                    tipoController.text = value!;
                                  },
                                  title: 'Tipo'),
                              SizedBox(
                                height: 10,
                              ),
                              LabelWithDropDown<int>(
                                  isExpanded: true,
                                  dropdownMenuItemList: _buildAreas(listAreas),
                                  value: this._area,
                                  onChanged: (int? value) {
                                    print('onChanged: ' + value.toString());
                                    this._area = value;
                                  },
                                  title: 'Area'),
                              SizedBox(
                                height: 5,
                              ),
                              LabelWithFormField(
                                onSaved: (value) {
                                  //dataForm.copyWith(cargo: value);
                                },
                                heightErroStyle: 0.5,
                                maxLength: 80,
                                textAlign: TextAlign.left,
                                title: 'Cargo',
                                textController: cargoController,
                                keyboardType: TextInputType.text,
                                validator: (value) {
                                  if (value!.length < 6 || value.isEmpty)
                                    return 'cargo requerido';
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
                                textController: dniController,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                keyboardType: TextInputType.text,
                                validator: (value) {
                                  if (value?.length != 8 || value!.isEmpty)
                                    return 'dni invalido';
                                },
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              LabelWithFormField(
                                heightErroStyle: 0.5,
                                maxLength: 80,
                                textAlign: TextAlign.left,
                                title: 'Apellidos y Nombres',
                                textController: nombresController,
                                keyboardType: TextInputType.text,
                                validator: (value) {
                                  if (value!.length < 8 || value.isEmpty)
                                    return 'nombre invalido';
                                },
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              LabelWithFormField(
                                heightErroStyle: 0.5,
                                hintText: '2022-01-01',
                                maxLength: 20,
                                textAlign: TextAlign.left,
                                title: 'Inicio',
                                textController: inicioController,
                                keyboardType: TextInputType.datetime,
                                inputFormatters: [
                                  maskDateFormatter //set the number limit including slash
                                ],
                                validator: (value) {
                                  if (value?.length != 10 || value!.isEmpty)
                                    return 'fecha invalida';
                                },
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              LabelWithFormField(
                                heightErroStyle: 0.5,
                                hintText: '2022-01-01',
                                maxLength: 20,
                                textAlign: TextAlign.left,
                                title: 'Fin',
                                textController: finController,
                                keyboardType: TextInputType.text,
                                inputFormatters: [
                                  maskDateFormatter //set the number limit including slash
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              LabelWithFormField(
                                  maxLength: 50,
                                  textAlign: TextAlign.left,
                                  title: 'Doc. Alta',
                                  textController: docAltaController,
                                  keyboardType: TextInputType.text),
                              SizedBox(
                                height: 5,
                              ),
                              LabelWithFormField(
                                  maxLength: 50,
                                  textAlign: TextAlign.left,
                                  title: 'Doc. Baja',
                                  textController: docBajaController,
                                  keyboardType: TextInputType.text),
                              SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: (this.blocEdit.state
                                  is EditConfianzaSaving)
                              ? null
                              : () => {
                                    if (_formKey.currentState!.validate())
                                      {
                                        this.blocEdit.add(EditConfianzaEventPost(
                                            confianza: ConfianzaEntity(
                                                id: widget.confianzaEntity.id,
                                                cargo: cargoController.text
                                                    .toUpperCase(),
                                                descArea: widget
                                                    .confianzaEntity.descArea,
                                                detalle: widget
                                                    .confianzaEntity.detalle
                                                    .toUpperCase(),
                                                direccion: direccionController
                                                    .text
                                                    .toUpperCase(),
                                                dni: dniController.text,
                                                docCese: docBajaController.text
                                                    .toUpperCase(),
                                                docDesignacion:
                                                    docAltaController.text
                                                        .toUpperCase(),
                                                inicio: inicioController.text,
                                                fin: finController.text,
                                                modalidad:
                                                    modalidadController.text,
                                                nombres: nombresController.text
                                                    .toUpperCase(),
                                                orgAreaId: this._area!,
                                                plaza: plazaController.text,
                                                tipo: tipoController.text,
                                                trabajadorId: 0,
                                                estado: '')))
                                      }
                                  },
                          child: (this.blocEdit.state is EditConfianzaSaving)
                              ? Center(
                                  heightFactor: 1,
                                  widthFactor: 1,
                                  child: SizedBox(
                                    height: 16,
                                    width: 16,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Colors.blue),
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
                              onPressed: () => Navigator.pop(context),
                              child: Text('Cancelar')))
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }

  List<DropdownMenuItem<String>> _buildModalidad(List<String> modalidad) {
    List<DropdownMenuItem<String>> listModalidad = [];
    modalidad
        .asMap()
        .entries
        .map((e) => listModalidad.add(DropdownMenuItem(
              value: e.value,
              child: Text(e.value.toString()),
            )))
        .toList();

    return listModalidad;
  }

  List<DropdownMenuItem<String>> _buildTipo(List<String> tipo) {
    List<DropdownMenuItem<String>> listTipo = [];
    tipo
        .asMap()
        .entries
        .map((e) => listTipo.add(DropdownMenuItem(
              value: e.value,
              child: Text(e.value.toString()),
            )))
        .toList();
    return listTipo;
  }

  List<DropdownMenuItem<int>> _buildAreas(List<AreaEntity> areas) {
    List<DropdownMenuItem<int>> listDropDownItemAreas = [];
    for (AreaEntity item in areas) {
      listDropDownItemAreas.add(DropdownMenuItem(
        value: item.orgAreaId,
        child: Text(
          '${item.descArea}',
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ));
    }
    if (widget.confianzaEntity.orgAreaId == 0)
      this._area = listDropDownItemAreas[0].value;
    else
      this._area = widget.confianzaEntity.orgAreaId;
    return listDropDownItemAreas;
  }
}
