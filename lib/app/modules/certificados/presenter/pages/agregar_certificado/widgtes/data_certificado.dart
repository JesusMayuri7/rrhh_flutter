import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../../../../core/domain/entities/clasificador_entity.dart';
import '../../../../domain/entities/concepto_entity.dart';
import '../../../../../../../core/uitls/widgets/label_with_dropdown.dart';

import '../bloc/certificados_bloc.dart';

class DataCertificado extends StatefulWidget {
  @override
  _DataCertificadoState createState() => _DataCertificadoState();
}

class _DataCertificadoState extends State<DataCertificado> {
  final bloc = Modular.get<CertificadosBloc>();
  ConceptoEntity? _conceptoValue;
  ClasificadorEntity? _clasificadorValue;
  List<Map<String, dynamic>> listado = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 50,
          // color: Colors.amber,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<CertificadosBloc, CertificadosState>(
                  buildWhen: (previous, current) {
                    return (current is LoadedCertificadosState) ? true : false;
                  },
                  bloc: this.bloc,
                  builder: (context, stateConcepto) {
                    return Expanded(
                      //flex: 3,
                      child: Container(
                        // color: Colors.green,
                        child: LabelWithDropDown<ConceptoEntity>(
                          isExpanded: true,
                          title: 'Concepto',
                          dropdownMenuItemList: (stateConcepto
                                  is LoadedCertificadosState)
                              ? stateConcepto.conceptoList.isNotEmpty == true
                                  ? _buildListConcepto(
                                      stateConcepto.conceptoList)
                                  : []
                              : [],
                          onChanged: (ConceptoEntity? value) {
                            _conceptoValue = value;
                          },
                          value: _conceptoValue,
                        ),
                      ),
                    );
                    //else
                    //return Center(child: Text('Modalidad'));
                  }),
              SizedBox(
                width: 10,
              ),
              BlocBuilder<CertificadosBloc, CertificadosState>(
                  buildWhen: (previous, current) {
                    return (current is LoadedCertificadosState) ? true : false;
                  },
                  bloc: this.bloc,
                  builder: (context, stateClasificador) {
                    return Expanded(
                      //flex: 3,
                      child: LabelWithDropDown<ClasificadorEntity>(
                        isExpanded: true,
                        title: 'Clasificador',
                        dropdownMenuItemList: (stateClasificador
                                is LoadedCertificadosState)
                            ? stateClasificador.clasificadorList.isNotEmpty ==
                                    true
                                ? _buildListClasificador(
                                    stateClasificador.clasificadorList)
                                : []
                            : [],
                        onChanged: (ClasificadorEntity? value) {
                          _clasificadorValue = value;
                        },
                        value: _clasificadorValue,
                      ),
                    );
                    //else
                    //return Center(child: Text('Modalidad'));
                  }),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<CertificadosBloc, CertificadosState>(
              bloc: bloc,
              builder: (context, stateAgregar) {
                return Expanded(
                  child: ElevatedButton(
                      onPressed: ((stateAgregar as LoadedCertificadosState)
                                      .status ==
                                  'valid') ||
                              (stateAgregar.clasificadorConcepto.length > 0)
                          ? () {
                              this.bloc.add(AgregarClasificadorEvent(
                                  listado: stateAgregar.clasificadorConcepto,
                                  concepto: _conceptoValue!,
                                  clasificador: _clasificadorValue!));
                            }
                          : null,
                      child: Text('Agregar')),
                );
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget getTextWidgets(List<String> strings, context) {
    return Flexible(
      child: ListView.builder(
          itemCount: strings.length,
          //primary: false,
          shrinkWrap: true,
          //physics: NeverScrollableScrollPhysics(),
          itemBuilder: (ctx, index) {
            return Text(strings[index].toString());
          }),
    );
  }

  Widget getTextWidgets2(List<String> strings, context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          //mainAxisSize: MainAxisSize.max,
          children: strings.map<Widget>((e) => Text(e.toString())).toList(),
        ),
      ),
    );
  }

  List<DropdownMenuItem<ConceptoEntity>> _buildListConcepto(
      List conceptoModel) {
    List<DropdownMenuItem<ConceptoEntity>> listConcepto = [];
    for (ConceptoEntity item in conceptoModel) {
      listConcepto.add(DropdownMenuItem(
        value: item,
        child: Text('${item.id}:  ${item.dscConcepto}'),
      ));
    }
    _conceptoValue = conceptoModel[0];
    return listConcepto;
  }

  List<DropdownMenuItem<ClasificadorEntity>> _buildListClasificador(
      List clasificadorModel) {
    List<DropdownMenuItem<ClasificadorEntity>> listClasificador = [];
    for (ClasificadorEntity item in clasificadorModel) {
      listClasificador.add(DropdownMenuItem(
        value: item,
        child: Text('${item.id}:  ${item.dscClasificador}'),
      ));
    }
    _clasificadorValue = clasificadorModel[0];
    return listClasificador;
  }
}

//  Limitar el tamaño del List.Builder a 300 como maximo
Widget getTextWidgets3(List<String> strings, contexto) {
  return LimitedBox(
    maxHeight: 300,
    //constraints: BoxConstraints(maxHeight: 300),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: ListView.builder(
              itemCount: strings.length,
              //primary: false,
              shrinkWrap: true,
              //physics: NeverScrollableScrollPhysics(),
              itemBuilder: (ctx, index) {
                return Text(strings[index].toString());
              }),
        ),
      ],
    ),
  );
}

Widget getTextWidgets4(List<String> strings, contexto) {
  return LayoutBuilder(builder: (_, constraints) {
    double viewSize = MediaQuery.of(contexto).size.height - 50 * 0.5;
    return Material(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: viewSize,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: ListView.builder(
                  itemCount: strings.length,
                  //primary: false,
                  shrinkWrap: true,
                  //physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (ctx, index) {
                    return Text(strings[index].toString());
                  }),
            ),
          ],
        ),
      ),
    );
  });
}

Widget getTextWidgets5(List<Map<String, dynamic>> strings, contexto) {
  return Expanded(
    child: ListView.builder(
        itemCount: strings.length,
        //primary: false,
        // shrinkWrap: true,
        //physics: NeverScrollableScrollPhysics(),
        itemBuilder: (ctx, index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(strings[index]['concepto'].toString()),
              Text(strings[index]['clasificador'].toString()),
            ],
          );
        }),
  );
}
