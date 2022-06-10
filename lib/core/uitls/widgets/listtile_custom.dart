import 'package:flutter/material.dart';

class ListTileCustom extends StatelessWidget {
  final TextEditingController textController;
  final String title;
  final TextInputType keyboardType;
  final TextAlign textAlign;
  final FormFieldValidator<String?>? validator;
  final int maxLength;

  const ListTileCustom(
      {required this.maxLength,
      this.validator,
      required this.textAlign,
      required this.title,
      required this.textController,
      required this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding:
          EdgeInsets.only(left: 0.0, right: 10.0, top: 0, bottom: 0),
      dense: true,
      title: Text(
        this.title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
      ),
      isThreeLine: true,
      subtitle: TextFormField(
        maxLength: this.maxLength,
        enableInteractiveSelection: true,
        textInputAction: TextInputAction.done,
        textAlignVertical: TextAlignVertical.bottom,
        textAlign: textAlign,
        keyboardType: this.keyboardType,
        controller: this.textController,
        validator: validator,
        decoration: const InputDecoration(
          counterText: "",
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          errorStyle: TextStyle(height: 0),
        ),
        //maxLines: 1,
      ),
    );
  }
}
