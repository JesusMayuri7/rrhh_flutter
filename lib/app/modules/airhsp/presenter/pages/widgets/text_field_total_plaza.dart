import 'package:flutter/material.dart';

class TextFieldTotalPlazas extends StatelessWidget {
  final String _totalPlazas;
  const TextFieldTotalPlazas(this._totalPlazas) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              child: Text(_totalPlazas),
            )));
  }
}
