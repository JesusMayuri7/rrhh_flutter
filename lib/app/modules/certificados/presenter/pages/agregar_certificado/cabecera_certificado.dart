import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rrhh_clean/app/modules/auth/presenter/bloc/auth_bloc.dart';

import 'bloc/certificados_bloc.dart';

class CabeceraCertificado extends StatelessWidget {
  final bloc = Modular.get<CertificadosBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CertificadosBloc, CertificadosState>(
        buildWhen: (previous, current) {
          return (current is LoadedCertificadosState) ? true : false;
        },
        bloc: this.bloc,
        builder: (BuildContext ontext, CertificadosState stateAll) {
          return Container(
            //color: Colors.red,
            height: 37,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  //flex: 1,
                  child: ListTile(
                      contentPadding: EdgeInsets.only(
                          left: 0.0, right: 10.0, top: 0, bottom: 0),
                      dense: true,
                      isThreeLine: true,
                      title: Text(
                        "Año",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: (stateAll is LoadedCertificadosState)
                          ? Text(stateAll.anio)
                          : Container()),
                ),
                SizedBox(
                  width: 2,
                ),
                Expanded(
                  flex: 1,
                  child: ListTile(
                    contentPadding: EdgeInsets.only(
                        left: 0.0, right: 10.0, top: 0, bottom: 0),
                    dense: true,
                    isThreeLine: true,
                    title: Text(
                      "Modalidad",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: (stateAll is LoadedCertificadosState)
                        ? Text(stateAll.modalidad.dscModalidad)
                        : Container(),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ListTile(
                    contentPadding: EdgeInsets.only(
                        left: 0.0, right: 10.0, top: 0, bottom: 0),
                    dense: true,
                    isThreeLine: true,
                    title: Text(
                      "Certificado",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: (stateAll is LoadedCertificadosState)
                        ? Text(stateAll.certificado)
                        : Container(),
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
                Expanded(
                  //flex: 1,
                  child: ListTile(
                      contentPadding: EdgeInsets.only(
                          left: 0.0, right: 10.0, top: 0, bottom: 0),
                      dense: true,
                      isThreeLine: true,
                      title: Text(
                        "Monto",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: (stateAll is LoadedCertificadosState)
                          ? Text(stateAll.montoCertificado.toString())
                          : Container()),
                ),
                SizedBox(
                  width: 2,
                ),
              ],
            ),
          );
        });
  }
}
