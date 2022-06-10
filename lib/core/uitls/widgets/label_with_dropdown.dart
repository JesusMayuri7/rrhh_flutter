import 'package:flutter/material.dart';

class LabelWithDropDown<T> extends StatelessWidget {
  final String title;
  final List<DropdownMenuItem<T>> dropdownMenuItemList;
  final ValueChanged<T?> onChanged;
  final T? value;
  final bool isExpanded;
  final int leftPadding;
  final IconData icon;

  const LabelWithDropDown(
      {this.icon = Icons.arrow_drop_down,
      required this.value,
      required this.dropdownMenuItemList,
      required this.onChanged,
      required this.title,
      this.isExpanded = false,
      this.leftPadding = 0});

  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(left: 4),
            alignment: Alignment.centerLeft,
            child: Text(
              this.title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
            ),
          ),
          ButtonTheme(
            alignedDropdown: true,
            child: DropdownButtonFormField<T>(
              icon: Icon(icon),
              hint: Text('Seleccione'),
              isExpanded: isExpanded,
              style: TextStyle(
                color: Colors.black,
                fontSize: 11.0,
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                //isCollapsed: true,
                isDense: true,
                hintText: null,
                contentPadding: EdgeInsets.only(left: 2, top: 2, bottom: 3),
                counterText: "",
                errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                errorStyle: TextStyle(height: 0),
              ),
              items: this.dropdownMenuItemList,
              onChanged: this.onChanged,
              value: this.value,
            ),
          ),
        ]);
  }
}
