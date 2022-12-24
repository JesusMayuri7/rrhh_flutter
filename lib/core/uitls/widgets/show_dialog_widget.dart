// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

showModalDialogWidget(
    {required BuildContext contextDialog,
    required Widget pageDetail,
    required double width,
    required double height}) {
  showDialog(
      context: contextDialog,
      builder: (BuildContext _context) {
        return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(width: width, height: height, child: pageDetail));
      });
}
