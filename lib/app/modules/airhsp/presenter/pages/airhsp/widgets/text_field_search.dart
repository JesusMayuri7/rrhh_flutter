import 'package:flutter/material.dart';

class TextFieldSearch extends StatelessWidget {
  final Function(String) search;
  final TextEditingController controller;
  final FocusNode focusNode;
  const TextFieldSearch(
      {required this.controller, required this.focusNode, required this.search})
      : super();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 5),
          labelText: "Buscar",
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0))),
        ),
        onSubmitted: this.search,
        controller: this.controller,
        focusNode: this.focusNode,
      ),
    );
  }
}
