import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'add_certificado_page.dart';
import 'widgtes/data_certificado.dart';

import 'bloc/certificados_bloc.dart';
import 'widgtes/list_conceptos.dart';

//import 'package:flutter_examples/model/sample_view.dart';

/// Renders column type data grid
class CertificadoPage extends StatefulWidget {
  @override
  _JsonDataSourceDataGridState createState() => _JsonDataSourceDataGridState();
}

class _JsonDataSourceDataGridState extends State<CertificadoPage> {
  final bloc = Modular.get<CertificadosBloc>();

  @override
  void initState() {
    super.initState();
    if (this.bloc.state is InitialCertificadosState) {
      bloc.add(GetDataInitial());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CertificadosBloc, CertificadosState>(
        bloc: this.bloc,
        listener: (previous, current) {
          if (current is LoadedCertificadosState) {
            print(current.message);
            if (current.status == 'saved') {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.black,
                content: Text(current.message),
              ));
              this.bloc.add(GetDataInitial());
            }
          }
          if (current is ErrorCertificadoState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.red,
              content: Text(current.message),
            ));
          }
        },
        builder: (context, stateTotal) {
          if (stateTotal is LoadedCertificadosState) {
            return Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                verticalDirection: VerticalDirection.down,
                children: [
                  AddCertificadoPage(),
                  Divider(),
                  DataCertificado(),
                  ListConceptos(),
                  Divider(),
                  Container(
                    height: 30,
                    child: ElevatedButton(
                      onPressed: ((stateTotal).status == 'loaded' &&
                              stateTotal.clasificadorConcepto.length > 0)
                          ? () {
                              bloc.add(SaveEvent());
                            }
                          : null,
                      child: Text('Guardar'),
                    ),
                  ),
                ],
              ),
            );
          }
          if (stateTotal is LoadingCertificadosState) {
            return Center(child: CircularProgressIndicator());
          } else
            return Center(child: Container(child: Text('Volver a cargar')));
        });
  }
}
