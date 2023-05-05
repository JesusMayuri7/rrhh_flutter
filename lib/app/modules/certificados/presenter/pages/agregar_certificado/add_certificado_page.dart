import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rrhh_clean/app/app_service.dart';
import 'package:rrhh_clean/app/bloc/app_bloc.dart';
import 'package:rrhh_clean/app/modules/auth/presenter/bloc/auth_bloc.dart';
import '../../../domain/entities/modalidad_entity.dart';
import '../../../../../../core/uitls/widgets/label_with_dropdown.dart';
import '../../../../../../core/uitls/widgets/label_with_form_field.dart';

import 'bloc/certificados_bloc.dart';

class AddCertificadoPage extends StatefulWidget {
  @override
  _AddCertificadoPageState createState() => _AddCertificadoPageState();
}

class _AddCertificadoPageState extends State<AddCertificadoPage> {
  final blocAddCertificado = Modular.get<CertificadosBloc>();

  ModalidadEntity? _modalidadValue;

  final keyFormAdd = GlobalKey<FormState>();

  final textCertificado = TextEditingController();

  final textMonto = TextEditingController();

  final textDetalle = TextEditingController();

  String? _tipoValue;

  ModalidadEntity? modalidad;

  String _anioValue = Modular.get<AppService>().sessionEntity!.anio;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: keyFormAdd,
      child: Container(
        //color: Colors.red,
        width: double.infinity,
        height: 210,
        child: Container(
          child: Column(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    BlocConsumer<CertificadosBloc, CertificadosState>(
                        listener: (previous, current) {},
                        buildWhen: (previous, current) {
                          return (current is LoadedCertificadosState)
                              ? true
                              : false;
                        },
                        bloc: this.blocAddCertificado,
                        builder: (context, stateAdd) {
                          return Expanded(
                            //flex: 3,
                            child: LabelWithDropDown<ModalidadEntity>(
                              title: 'Modalidad',
                              dropdownMenuItemList: (stateAdd
                                      is LoadedCertificadosState)
                                  ? stateAdd.modalidadList.isNotEmpty == true
                                      ? _buildListModalidad(
                                          stateAdd.modalidadList)
                                      : []
                                  : [],
                              onChanged: (ModalidadEntity? value) {
                                _modalidadValue = value;
                              },
                              value: _modalidadValue,
                            ),
                          );
                          //else
                          //return Center(child: Text('Modalidad'));
                        }),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      //flex: 3,
                      child: LabelWithFormField(
                          maxLength: 10,
                          title: 'Certificado',
                          textAlign: TextAlign.right,
                          textController: textCertificado,
                          keyboardType: TextInputType.number,
                          validator: (String? value) =>
                              (value!.isEmpty) ? '' : null),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      //flex: 3,
                      child: LabelWithFormField(
                          maxLength: 15,
                          title: 'Monto',
                          textAlign: TextAlign.right,
                          textController: textMonto,
                          keyboardType: TextInputType.number,
                          validator: (String? value) =>
                              (value!.isEmpty) ? '' : null),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                //flex: 3,
                child: LabelWithDropDown<String>(
                  title: 'Tipo',
                  dropdownMenuItemList: _buildLisTipo([
                    'LIQUIDACION',
                    'DIFERENCIAL',
                    'PLANILLA',
                    'COMPLEMENTARIA',
                    'UNIFORMES',
                    'SEGUROS',
                    'CAPACITACION',
                    'VALES',
                    'OTROS'
                  ]),
                  onChanged: (String? value) {
                    _tipoValue = value;
                  },
                  value: _tipoValue,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      //flex: 3,
                      child: LabelWithFormField(
                          maxLength: 60,
                          title: 'Detalle',
                          textAlign: TextAlign.left,
                          textController: textDetalle,
                          keyboardType: TextInputType.text,
                          validator: (String? value) =>
                              (value!.isEmpty) ? '' : null),
                    ),
                  ],
                ),
              ),
              BlocBuilder<CertificadosBloc, CertificadosState>(
                bloc: this.blocAddCertificado,
                builder: (context, state) {
                  return Expanded(
                    child: Row(children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            if (keyFormAdd.currentState!.validate()) {
                              if ((state as LoadedCertificadosState).status ==
                                  'loaded') {}
                              this.blocAddCertificado.add(
                                  ValidarCertificadoEvent(
                                      detalle: textDetalle.text,
                                      tipo: _tipoValue ?? '',
                                      modalidad: _modalidadValue ??
                                          ModalidadEntity(
                                              id: 1, dscModalidad: 'CAS'),
                                      certificado: textCertificado.text,
                                      anio: _anioValue,
                                      montoCertificado:
                                          double.parse(textMonto.text)));
                            }
                          },
                          child: Text('Agregar'),
                        ),
                      ),
                    ]),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<DropdownMenuItem<ModalidadEntity>> _buildListModalidad(
      List modalidadModel) {
    List<DropdownMenuItem<ModalidadEntity>> listModalidad = [];
    for (ModalidadEntity item in modalidadModel) {
      listModalidad.add(DropdownMenuItem(
        value: item,
        child: Text(item.dscModalidad),
      ));
    }
    _modalidadValue = modalidadModel[0];
    return listModalidad;
  }

  List<DropdownMenuItem<String>> _buildListAnio(List anioModel) {
    List<DropdownMenuItem<String>> listAnio = [];
    for (String item in anioModel) {
      listAnio.add(DropdownMenuItem(
        value: item,
        child: Text(item),
      ));
    }
    _anioValue = anioModel[0];
    return listAnio;
  }

  List<DropdownMenuItem<String>> _buildLisTipo(List tipoModel) {
    List<DropdownMenuItem<String>> listtipo = [];
    for (String item in tipoModel) {
      listtipo.add(DropdownMenuItem(
        value: item,
        child: Text(item),
      ));
    }
    _tipoValue = tipoModel[0];
    return listtipo;
  }
}
