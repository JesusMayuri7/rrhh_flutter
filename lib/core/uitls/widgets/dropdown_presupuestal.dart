// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DropdownPresupuestal<T> extends StatefulWidget {
  final Function(T?)? onChanged;
  final List<DropdownMenuItem<T>> dropDownMenuItems;
  final T? value;
  final double dropdownWidth;
  final String hint;

  DropdownPresupuestal({
    Key? key,
    required this.onChanged,
    required this.dropDownMenuItems,
    required this.value,
    required this.dropdownWidth,
    required this.hint,
  }) : super(key: key);

  @override
  State<DropdownPresupuestal<T>> createState() =>
      _DropdownPresupuestalState<T>();
}

class _DropdownPresupuestalState<T> extends State<DropdownPresupuestal<T>> {
  String? selectedValue;

  final TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('build ' + widget.dropDownMenuItems.first.value.toString());

    return Container(
      //color: Colors.amber,
      child: DropdownButton2<T>(
        hint: Text(widget.hint,
            style: TextStyle(fontSize: 11), overflow: TextOverflow.ellipsis),
        //itemHighlightColor: Colors.blue,
        //itemSplashColor: Colors.blue,
        //dropdownDecoration:            BoxDecoration(color: Color.fromARGB(219, 255, 250, 250)),
        //barrierColor: Colors.red,
        //dropdownMaxHeight: 350,
        //dropdownWidth: widget.dropdownWidth,
        isExpanded: true,
        autofocus: true,
        //itemHeight: 30,
        value: widget.value,
        //offset: const Offset(0, 0),
        onChanged: widget.onChanged,
        items: widget.dropDownMenuItems,
        //searchController: textEditingController,
        //value: widget.value,
dropdownSearchData: DropdownSearchData(
            searchController: textEditingController,
            searchInnerWidgetHeight: 50,
            searchInnerWidget: Container(
              height: 50,
              padding: const EdgeInsets.only(
                top: 8,
                bottom: 4,
                right: 8,
                left: 8,
              ),
              child: TextFormField(
                expands: true,
                maxLines: null,
                controller: textEditingController,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8,
                  ),
                  hintText: 'Search for an item...',
                  hintStyle: const TextStyle(fontSize: 12),
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

      ),
      onMenuStateChange: (isOpen) {
            if (!isOpen) {
              textEditingController.clear();
            }
          },
    ));
  }
}
