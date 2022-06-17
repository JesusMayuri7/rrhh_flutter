import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../bloc/certificados_bloc.dart';

class ListConceptos extends StatelessWidget {
  final blocListConceptos = Modular.get<CertificadosBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CertificadosBloc, CertificadosState>(
      buildWhen: (previous, current) {
        return (current is LoadedCertificadosState) ? true : false;
      },
      bloc: blocListConceptos,
      builder: (context, stateListConceptos) {
        return (stateListConceptos is LoadedCertificadosState)
            ? Expanded(
                child: ListView.builder(
                    itemCount: stateListConceptos.clasificadorConcepto.length,
                    //primary: false,
                    // shrinkWrap: true,
                    //physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              '${stateListConceptos.clasificadorConcepto[index]['concepto_id'].toString()}:  ${stateListConceptos.clasificadorConcepto[index]['concepto'].toString()}'),
                          Text(
                              '${stateListConceptos.clasificadorConcepto[index]['clasificador_id'].toString()}:  ${stateListConceptos.clasificadorConcepto[index]['clasificador'].toString()}'),
                        ],
                      );
                    }),
              )
            : Container();
      },
    );
  }
}
