import 'package:flutter/material.dart';
import 'package:rrhh_clean/app/modules/airhsp/domain/entities/concepto_entity.dart';

//final oCcy = NumberFormat("#,##0.00", "en_US");

class ItemConceptoPage extends StatelessWidget {
  ItemConceptoPage(
      {required this.conceptos, required this.codPlaza, required this.nombres});

  final List<ConceptoEntity> conceptos;
  final String codPlaza;
  final String nombres;

  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = ScrollController();
    return Expanded(
      child: Column(
        children: [
          Divider(),
          Text('Plaza => ' + codPlaza + ' - ' + nombres),
          Divider(),
          Row(
            children: [
              Expanded(
                flex: 1, // 20%
                child: Text('Concepto',
                    style: TextStyle(color: Color.fromRGBO(0, 0, 255, 1))),
              ),
              Expanded(
                flex: 3, // 60%
                child: Center(
                    child: Text('Descripcion',
                        style: TextStyle(color: Color.fromRGBO(0, 0, 255, 1)))),
              ),
              Expanded(
                flex: 1, // 20%
                child: Center(
                    child: Text('Monto',
                        style: TextStyle(color: Color.fromRGBO(0, 0, 255, 1)))),
              ),
              Expanded(
                flex: 1, // 20%
                child: Center(
                    child: Text('Fuente',
                        style: TextStyle(color: Color.fromRGBO(0, 0, 255, 1)))),
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: conceptos.length,
              itemBuilder: (context, i) {
                return Column(
                  children: <Widget>[
                    Card(
                        child: Table(
                      border:
                          TableBorder.all(color: Color.fromRGBO(0, 0, 255, 1)),
                      columnWidths: {
                        0: FlexColumnWidth(0.6),
                        1: FlexColumnWidth(1.9),
                        2: FlexColumnWidth(0.7),
                        3: FlexColumnWidth(0.6),
                      },
                      children: [
                        TableRow(children: [
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Center(child: Text(conceptos[i].concepto)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Text(' ' + conceptos[i].descripcion,
                                textAlign: TextAlign.left),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Text(conceptos[i].monto,
                                textAlign: TextAlign.right),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Center(child: Text(conceptos[i].fuente)),
                          ),
                        ]),
                      ],
                    )),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
