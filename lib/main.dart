import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:window_manager/window_manager.dart';
import 'app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/app_widget.dart';
import 'core/uitls/device_info.dart';

void main() async {
  usePathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  if (DeviceInfo.isDesktop) {
    await WindowManager.instance.ensureInitialized();
    windowManager.waitUntilReadyToShow().then((_) async {
      await windowManager.setTitleBarStyle(
        TitleBarStyle.hidden,
        windowButtonVisibility: false,
      );
      //await windowManager.setSize(const Size(800, 600));
      await windowManager.setMinimumSize(const Size(600, 800));
      // await windowManager.setFullScreen(true);
      await windowManager.center();
      await windowManager.show();
      await windowManager.setPreventClose(true);
      await windowManager.setSkipTaskbar(false);
    });
  }
  await dotenv.load(fileName: ".env");

/*
  final appModule = AppModule();
  Modular.init(appModule);

  final blocApp = Modular.get<AppBloc>();
  */

  runApp(ModularApp(
    module: AppModule(),
    child: AppWidget(),
  ));
}
