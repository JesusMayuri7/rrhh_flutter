import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rrhh_clean/app/modules/auth/presenter/bloc/auth_bloc.dart';
import '../../../domain/entities/certificado_entity.dart';

import 'package:rrhh_clean/core/uitls/universal_file/save_file_mobile.dart'
    if (dart.library.html) 'package:rrhh_clean/core/uitls/universal_file/save_file_web.dart';

import 'package:syncfusion_flutter_xlsio/xlsio.dart' hide Row;

import 'bloc/list_certificado_bloc.dart';
import 'bloc/list_certificado_event.dart';
import 'bloc/list_certificado_state.dart';

class CabeceraPage extends StatefulWidget {
  @override
  _CabeceraPageState createState() => _CabeceraPageState();
}

class _CabeceraPageState extends State<CabeceraPage> {
  TextEditingController textCertificado = TextEditingController();
  final bloc = Modular.get<ListCertificadoBloc>();
  final blocAuth = Modular.get<AuthBloc>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: SizedBox(
        height: 40,
        child: Row(
            //crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: 200,
                    child: TextFormField(
                        controller: textCertificado,
                        textAlign: TextAlign.right,
                        keyboardType: TextInputType.text,
                        onFieldSubmitted: (value) {
                          this.bloc.add(
                              FiltrarListCertificadosEvent(certificado: value));
                        },
                        decoration: InputDecoration(
                          hintText: 'Buscar',
                          prefixIcon: Icon(Icons.search_outlined),
                          // set the prefix icon constraints
                          prefixIconConstraints: BoxConstraints(
                            minWidth: 25,
                            minHeight: 25,
                          ),
                          border: OutlineInputBorder(),
                          isDense: true, // Added this
                          contentPadding: EdgeInsets.only(
                              left: 5, top: 12, bottom: 0), // Added this
                        )),
                    /*LabelWithFormField(
                        onFieldSubmited: (_) {
                          this.bloc.add(FiltrarListCertificadosEvent(
                              certificado: textCertificado.text));
                        },
                        maxLength: 20,
                        title: 'Criterio',
                        textAlign: TextAlign.right,
                        textController: textCertificado,
                        keyboardType: TextInputType.text,
                        validator: (String? value) =>
                            (value!.isEmpty) ? '' : null),*/
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  /*   ElevatedButton(
                      onPressed: () => this.bloc.add(
                          FiltrarListCertificadosEvent(
                              certificado: textCertificado.text)),
                      child: Text('Filtrar'))
                      */
                ],
              ),
              BlocBuilder<ListCertificadoBloc, ListCertificadoState>(
                bloc: this.bloc,
                builder: (context, state) {
                  return ElevatedButton(
                      onPressed: () => this.bloc.add(GetListCertificadoEvent(anio: this.blocAuth.state.loginResponseEntity!.anio )),
                      child: Text('Actualizar'));
                },
              ),
              BlocBuilder<ListCertificadoBloc, ListCertificadoState>(
                bloc: this.bloc,
                builder: (context, state) {
                  return ElevatedButton(
                      onPressed: () => (state is LoadedListCertificadoState)
                          ? generateExcel(state.listCertificadoCur)
                          : null,
                      child: Text('Exportar'));
                },
              )
            ]),
      ),
    );
  }

  Future<void> generateExcel(List<CertificadoEntity> listCertificados) async {
// Create a new Excel Document.
    final Workbook workbook = Workbook();

// Accessing sheet via index.
    final Worksheet sheet = workbook.worksheets[0];

//Initialize the list
    //List<Object> listToExcel = [];
    for (int index = 0; index < listCertificados.length; index++) {
      final List<Object> row =
          List.from(listCertificados[index].toMap().values.toList());

      final List<Object> heading =
          List.from(listCertificados[index].toMap().keys.toList());
      //if (listCertificados[index].toMap().keys.toString() != 'certificado_id')
      {
        if (index == 0) sheet.importList(heading, 1, 1, false);
      }

      sheet.importList(row, index + 2, 1, false);
    }

// Save and dispose workbook.
    final List<int> bytes = workbook.saveAsStream();
    workbook.dispose();
    await FileSaveHelper.saveAndLaunchFile(bytes, 'ListadodeCertificados.xlsx');
  }
}
