import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'agregar_certificado/certificado_page.dart';
import 'list_certificados/list_certificado_page.dart';

import 'list_certificados/bloc/list_certificado_bloc.dart';

//import 'package:flutter_examples/model/sample_view.dart';

/// Renders column type data grid
class MainCertificadoPage extends StatefulWidget {
  @override
  _MainCertificadoPage createState() => _MainCertificadoPage();
}

class _MainCertificadoPage extends State<MainCertificadoPage> {
  final bloc = Modular.get<ListCertificadoBloc>();

  @override
  Widget build(BuildContext context) {
    // Scaffold or Material same
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          verticalDirection: VerticalDirection.down,
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      //color: Colors.green,
                      width: 250,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        verticalDirection: VerticalDirection.down,
                        children: [CertificadoPage(contextUp: context)],
                      ),
                    ),
                  ),
                  Container(
                    width: 1,
                    color: Colors.blue,
                  ),
                  Expanded(
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListCertificadoPage()
                          //child: ListDataAllPage(),
                          ))
                ],
              ),
            ),
            //FooterPage()
          ]),
    );
  }
}
