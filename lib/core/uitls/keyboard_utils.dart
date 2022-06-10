import 'package:flutter/services.dart';
import 'package:universal_platform/universal_platform.dart';

class KeyboardUtils {
  static bool get isShiftDown =>
      isKeyDown([LogicalKeyboardKey.shiftLeft, LogicalKeyboardKey.shiftRight]);
  static bool get isControlDown => isKeyDown(
      [LogicalKeyboardKey.controlLeft, LogicalKeyboardKey.controlRight]);
  static bool get isMetaDown =>
      isKeyDown([LogicalKeyboardKey.metaLeft, LogicalKeyboardKey.metaRight]);
  static bool get isWindowsDown => isMetaDown;
  static bool get isCommandDown => isMetaDown;

  static bool isKeyDown(List<LogicalKeyboardKey> keys) {
    Set<LogicalKeyboardKey> pressed = RawKeyboard.instance.keysPressed;
    for (var i = keys.length; i-- > 0;) {
      if (pressed.contains(keys[i])) {
        return true;
      }
    }
    return false;
  }

  static bool get isCommandOrControlDown {
    bool isDown = false;
    // If shift is not down, look for Command on Mac, and Control on Windows/Linux
    if (UniversalPlatform.isMacOS) {
      isDown = KeyboardUtils.isCommandDown;
    } else {
      isDown = KeyboardUtils.isControlDown;
    }
    return isDown;
  }
}
