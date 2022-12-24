// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DropdownFormPresupuestal<T> extends StatefulWidget {
  final Function(T?)? onChanged;
  final List<DropdownMenuItem<T>> dropDownMenuItems;
  final T value;
  final double dropdownWidth;
  final String hint;
  final String hintText;
  final String label;

  DropdownFormPresupuestal(
      {Key? key,
      required this.onChanged,
      required this.dropDownMenuItems,
      required this.value,
      required this.dropdownWidth,
      required this.hint,
      required this.label,
      required this.hintText})
      : super(key: key);

  @override
  State<DropdownFormPresupuestal<T>> createState() =>
      _DropdownFormPresupuestalState<T>();
}

class _DropdownFormPresupuestalState<T>
    extends State<DropdownFormPresupuestal<T>> {
  String? selectedValue;

  final TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.amber,
      child: DropdownButtonFormField2<T>(
        selectedItemHighlightColor: Colors.blue,
        //buttonSplashColor: Colors.amber,
        //buttonHighlightColor: Colors.red,
        buttonOverlayColor: MaterialStateProperty.all(Colors.transparent),
        buttonDecoration: BoxDecoration(
          color: Colors.transparent,
        ),
        decoration: InputDecoration(
            isDense: true,
            label: Text(widget.label,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: Colors.blueAccent)),
            contentPadding: const EdgeInsets.symmetric(horizontal: 8),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.grey))),
        buttonPadding: const EdgeInsets.fromLTRB(0, 8, 6, 6),
        buttonHeight: 30,
        hint: Text(
          widget.hint,
          style: TextStyle(fontSize: 11),
          overflow: TextOverflow.ellipsis,
        ),
        //itemHighlightColor: Colors.blue,
        itemSplashColor: Colors.blue,
        dropdownDecoration:
            BoxDecoration(color: Color.fromARGB(219, 255, 250, 250)),
        //barrierColor: Colors.red,
        dropdownMaxHeight: 350,
        dropdownWidth: widget.dropdownWidth,
        isExpanded: true,
        autofocus: true,
        itemHeight: 30,
        offset: const Offset(0, 0),
        onChanged: widget.onChanged,
        items: widget.dropDownMenuItems,
        searchController: textEditingController,
        searchInnerWidget: Padding(
          padding: const EdgeInsets.only(
            top: 8,
            bottom: 4,
            right: 8,
            left: 8,
          ),
          child: TextFormField(
            style: TextStyle(color: Colors.amber),
            controller: textEditingController,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 8,
              ),
              hintText: widget.hintText,
              hintStyle: const TextStyle(fontSize: 11),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        searchMatchFn: (item, searchValue) {
          return (item.value
              .toString()
              .toUpperCase()
              .contains(searchValue.toUpperCase()));
        },
        //This to clear the search value when you close the menu
        onMenuStateChange: (isOpen) {
          if (!isOpen) {
            textEditingController.clear();
          }
        },
        onSaved: (value) {
          selectedValue = value.toString();
        },
      ),
    );
  }
}
