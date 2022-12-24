import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

showToastSuccess(BuildContext _context, String message) {
  MotionToast.success(
    title: const Text(
      'Exito',
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
    description: Text(message),
    animationType: AnimationType.fromLeft,
    position: MotionToastPosition.top,
    barrierColor: Colors.black.withOpacity(0.3),
    width: 300,
    height: 80,
    dismissable: false,
  ).show(_context);
}

showToastError(BuildContext _context, String message) {
  MotionToast.error(
    title: const Text(
      'Error',
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
    description: Text(message),
    animationType: AnimationType.fromLeft,
    position: MotionToastPosition.top,
    barrierColor: Colors.black.withOpacity(0.3),
    width: 300,
    height: 80,
    dismissable: false,
  ).show(_context);
}
