import 'package:flutter/material.dart';
import '../../../domain/entities/concepto_entity.dart';

//final oCcy = NumberFormat("#,##0.00", "en_US");

Widget itemConceptoPage(
    List<ConceptoEntity> _conceptos, String _codPlaza, String _nombres) {
  return Expanded(
    child: Column(
      children: [
        Divider(),
        Text('Plaza => ' + _codPlaza + ' - ' + _nombres),
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
            scrollDirection: Axis.vertical,
            itemCount: _conceptos.length,
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
                          child: Center(child: Text(_conceptos[i].concepto)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(' ' + _conceptos[i].descripcion,
                              textAlign: TextAlign.left),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(_conceptos[i].monto,
                              textAlign: TextAlign.right),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Center(child: Text(_conceptos[i].fuente)),
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
