import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:rrhh_clean/core/uitls/widgets/show_toast_dialog.dart';

import 'add_certificado_page.dart';
import 'widgtes/data_certificado.dart';

import 'bloc/certificados_bloc.dart';
import 'widgtes/list_conceptos.dart';

//import 'package:flutter_examples/model/sample_view.dart';

/// Renders column type data grid
class CertificadoPage extends StatefulWidget {
  const CertificadoPage({super.key, required this.contextUp});

  @override
  _JsonDataSourceDataGridState createState() => _JsonDataSourceDataGridState();

  final BuildContext contextUp;
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
            if (current.status == 'saved') {
              showToastSuccess(context, current.message);
              this.bloc.add(GetDataInitial());
            }
          }
          if (current is ErrorCertificadoState) {
            MotionToast(
              height: 60,
              width: 280,
              primaryColor: Colors.black,
              icon: Icons.error,
              description: Flexible(
                child: Text(current.message,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              ),
              position: MotionToastPosition.top,
              animationType: AnimationType.fromTop,
            ).show(context);
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

  Widget toast(String message, bool isError) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.greenAccent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(isError ? Icons.error : Icons.check),
          SizedBox(
            width: 12.0,
          ),
          Text(message),
        ],
      ),
    );
  }
}
