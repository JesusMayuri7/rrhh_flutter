import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'agregar_certificado/certificado_page.dart';
import 'footer_page.dart';
import 'list_certificados/list_certificado_page.dart';

import 'list_certificados/bloc/list_certificado_bloc.dart';
import 'list_certificados/bloc/list_certificado_event.dart';
import 'list_certificados/bloc/list_certificado_state.dart';

//import 'package:flutter_examples/model/sample_view.dart';

/// Renders column type data grid
class MainCertificadoPage extends StatefulWidget {
  @override
  _MainCertificadoPage createState() => _MainCertificadoPage();
}

class _MainCertificadoPage extends State<MainCertificadoPage> {
  final bloc = Modular.get<ListCertificadoBloc>();

  @override
  void initState() {
    super.initState();
    bloc.add(GetListCertificadoEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
          BlocBuilder<ListCertificadoBloc, ListCertificadoState>(
        /*  listener: (context, state) {
                if (state is List<CertificadoEntity>)
                    generateExcel(state as List<CertificadoEntity>);
                },*/
        bloc: this.bloc,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: FloatingActionButton(
                elevation: 0.0,
                child: new Icon(Icons.refresh),
                backgroundColor: Colors.blue[800],
                onPressed: () {
                  this.bloc.add(GetListCertificadoEvent());
                }),
          );
          /*
          return Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: FloatingActionButton(
                elevation: 0.0,
                child: new Icon(Icons.refresh),
                backgroundColor: Colors.blue[800],
                onPressed: () {
                  // if (state is LoadedListCertificadoState)
                  // generateExcel(state.listBaseCas);
                  //openFile();
                }),
          );*/
        },
      ),
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
                        children: [CertificadoPage()],
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
            FooterPage()
          ]),
    );
  }

  static Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "currentUser": 1,
      "winX": 2,
      "winY": 3,
      "winWidth": 4,
      "winHeight": 5,
      "enableTouchMode": 6,
    };
  }
}
