import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:window_manager/window_manager.dart';
import 'app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/app_widget.dart';
import 'core/uitls/device_info.dart';
import 'simple_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await WindowManager.instance.ensureInitialized();
  if (DeviceInfo.isDesktop) {
    windowManager.waitUntilReadyToShow().then((_) async {
      await windowManager.setTitleBarStyle(
        TitleBarStyle.hidden,
        windowButtonVisibility: false,
      );
      //await windowManager.setMinimumSize(const Size(800, 600));
      //await windowManager.setFullScreen(true);
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

  BlocOverrides.runZoned(
      () => runApp(ModularApp(
            module: AppModule(),
            child: AppWidget(),
          )),
      blocObserver: SimpleBlocOBserver());
}
