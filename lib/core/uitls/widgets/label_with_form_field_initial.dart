import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LabelWithFormFieldInitial extends StatelessWidget {
  final String title;
  final TextInputType keyboardType;
  final TextAlign textAlign;
  final FormFieldValidator<String?>? validator;
  final int maxLength;
  final Function(String)? onFieldSubmited;
  final Function(String?)? onSaved;
  final IconData? icon;
  final double heightErroStyle;
  final List<TextInputFormatter>? inputFormatters;
  final String hintText;
  final String initialValue;

  const LabelWithFormFieldInitial(
      {required this.maxLength,
      this.validator,
      required this.textAlign,
      required this.title,
      required this.keyboardType,
      this.onFieldSubmited,
      this.onSaved,
      this.heightErroStyle = 0,
      this.icon,
      this.inputFormatters = const [],
      this.hintText = '',
      this.initialValue = ''

      // this.inputFormatter = const FilteringTextInputFormatter.,
      });

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 4),
            alignment: Alignment.centerLeft,
            child: Text(
              this.title,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 11,
              ),
            ),
          ),
          TextFormField(
            initialValue: this.initialValue,
            textCapitalization: TextCapitalization.characters,
            onSaved: this.onSaved,
            inputFormatters: this.inputFormatters,
            maxLength: this.maxLength,
            enableInteractiveSelection: true,
            textInputAction: TextInputAction.done,
            textAlignVertical: TextAlignVertical.center,
            textAlign: textAlign,
            keyboardType: this.keyboardType,
            validator: validator,
            onFieldSubmitted: onFieldSubmited,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              //isCollapsed: true,
              isDense: true,
              hintText: this.hintText,
              contentPadding: EdgeInsets.only(left: 2, top: 12, bottom: 0),
              prefixIcon: this.icon == null ? null : Icon(this.icon),
              counterText: "",
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
              errorStyle: TextStyle(
                height: heightErroStyle,
                fontSize: 10,
              ),
            ),
            style: TextStyle(fontSize: 11),
            maxLines: 1,
          ),
        ]);
  }
}
