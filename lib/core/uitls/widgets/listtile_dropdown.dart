import 'package:flutter/material.dart';

class ListTileDropDown<T> extends StatelessWidget {
  final String title;
  final List<DropdownMenuItem<T>> dropdownMenuItemList;
  final ValueChanged<T?> onChanged;
  final T? value;

  const ListTileDropDown({
    required this.value,
    required this.dropdownMenuItemList,
    required this.onChanged,
    required this.title,
  });

  Widget build(BuildContext context) {
    return ListTile(
      contentPadding:
          EdgeInsets.only(left: 0.0, right: 10.0, top: 0, bottom: 0),
      dense: true,
      title: Text(
        this.title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      isThreeLine: true,
      subtitle: DropdownButtonFormField<T>(
        isDense: true,
        //itemHeight: 30,
        elevation: 16,
        isExpanded: true,
        style: TextStyle(
          color: Colors.black,
          fontSize: 10.0,
          height: 1.5,
        ),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(
            vertical: 3.0,
            horizontal: 1,
          ),
        ),
        items: this.dropdownMenuItemList,
        onChanged: this.onChanged,
        value: this.value,
      ),
    );
  }
}
