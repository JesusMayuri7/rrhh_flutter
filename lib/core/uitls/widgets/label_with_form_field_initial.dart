import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LabelWithFormFieldInitial extends StatefulWidget {
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
  final TextInputAction textInputAction;
  final int? maxLines;
  final bool readOnly;
  final bool autofocus;

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
      this.initialValue = '',
      required this.maxLines,
      this.readOnly = false,
      this.textInputAction = TextInputAction.none,
      this.autofocus = true

      // this.inputFormatter = const FilteringTextInputFormatter.,
      });

  @override
  _LabelWithFormFieldInitialState createState() => _LabelWithFormFieldInitialState();
}

class _LabelWithFormFieldInitialState extends State<LabelWithFormFieldInitial> {
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
              this.widget.title,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 11,
              ),
            ),
          ),
          TextFormField(
            readOnly: this.widget.readOnly,
            initialValue: this.widget.initialValue,
            textCapitalization: TextCapitalization.characters,
            onSaved: this.widget.onSaved,
            inputFormatters: this.widget.inputFormatters,
            maxLength: this.widget.maxLength,
            enableInteractiveSelection: true,
            textInputAction: TextInputAction.done,
            textAlignVertical: TextAlignVertical.center,
            textAlign: widget.textAlign,
            keyboardType: this.widget.keyboardType,
            validator: widget.validator,
            onFieldSubmitted: widget.onFieldSubmited,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              //isCollapsed: true,
              isDense: true,
              hintText: this.widget.hintText,
              contentPadding:
                  EdgeInsets.only(left: 4, top: 12, bottom: 0, right: 2),
              prefixIcon: this.widget.icon == null ? null : Icon(this.widget.icon),
              counterText: "",
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
              errorStyle: TextStyle(
                height: widget.heightErroStyle,
                fontSize: 10,
              ),
            ),
            style: TextStyle(fontSize: 11),
            maxLines: this.widget.maxLines,
          ),
        ]);
  }
}
