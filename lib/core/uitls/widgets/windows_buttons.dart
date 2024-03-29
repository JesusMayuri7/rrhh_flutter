import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:window_manager/window_manager.dart';

class WindowButtons extends StatelessWidget {
  const WindowButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FluentThemeData theme = FluentTheme.of(context);

    return SizedBox(
      width: 138,
      height: 25,
      child: !kIsWeb
          ? WindowCaption(
              brightness: theme.brightness,
              backgroundColor: Colors.transparent,
            )
          : Container(),
    );
  }
}
