import 'package:fluent_ui/fluent_ui.dart' as fluentUi;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rrhh_clean/app/app_service.dart';
import 'package:rrhh_clean/core/uitls/constants/menu_user.dart';
//import 'package:window_manager/window_manager.dart';


import 'package:rrhh_clean/core/presenter/logout_widget.dart';
import 'package:rrhh_clean/core/uitls/widgets/windows_buttons.dart';

import 'package:window_manager/window_manager.dart';

class StartFluent extends StatefulWidget {
  const StartFluent({Key? key}) : super(key: key);

  @override
  State<StartFluent> createState() => _StartFluentState();
}

class _StartFluentState extends State<StartFluent> with WindowListener {
  List<fluentUi.NavigationPaneItem> listPanel = [];

  final viewKey = GlobalKey();
  int index = 0;
  //final bloc = Modular.get<AuthBloc>();
  final appService = Modular.get<AppService>();

  @override
  void initState() {
    if (!kIsWeb) {
      windowManager.setFullScreen(true);
      windowManager.addListener(this);
    }
    super.initState();
  }

  @override
  void dispose() {
    if (!kIsWeb) windowManager.removeListener(this);
    super.dispose();
  }

  @override
  void onWindowClose() async {
    bool _isPreventClose = await windowManager.isPreventClose();
    if (_isPreventClose) {
      showDialog(
        context: context,
        builder: (_) {
          return fluentUi.ContentDialog(
            title: const Text('Confirmar cierre'),
            content: const Text('Estas seguro de cerrar el programa RRHH?'),
            actions: [
              fluentUi.FilledButton(
                child: const Text('Si'),
                onPressed: () {
                  Navigator.pop(context);
                  windowManager.destroy();
                },
              ),
              fluentUi.Button(
                child: const Text('No'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final String anioSelected = appService.sessionEntity!.anio;
    return fluentUi.NavigationView(
      key: viewKey,
      appBar: fluentUi.NavigationAppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: true,
        title: () {
          if (kIsWeb) return const Text('Recursos Humanos');
          return DragToMoveArea(
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text('Recursos Humanos [' + anioSelected + ']'),
            ),
          );
        }(),
        height: 27,
        leading: Align(
          alignment: AlignmentDirectional.centerStart,
          child: FlutterLogo(size: 15),
        ),
        actions: Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            LogoutWidget(),
            if (!kIsWeb) const WindowButtons(),
          ],
        ),
      ),
      pane: fluentUi.NavigationPane(
        displayMode: fluentUi.PaneDisplayMode.compact,
        //selected: index,
        onChanged: (i) {
          String menu = '/start/agenda/';
          menu = menuList[i]!['path'] ?? menu;
          Modular.to.pushNamed(menu);
        },
        header: Padding(
          padding: EdgeInsets.all(2),
          child: DefaultTextStyle(
              style: fluentUi.FluentTheme.of(context).typography.bodyStrong!,
              child: const Text('Recursos Humanos')),
        ),
        size: const fluentUi.NavigationPaneSize(
          openWidth: 200,
          openMinWidth: 200.0,
          openMaxWidth: 200.0,
        ),
        items: menuList.entries.map<fluentUi.NavigationPaneItem>((entry) {
          return fluentUi.PaneItem(
              body: RouterOutlet(),
              //icon: const Icon(Icons.balance),
              icon: Icon(IconData(entry.value['icon']['data'],
                  fontFamily: entry.value['icon']['fontFamily'],
                  fontPackage: entry.value['icon']['fontPackage'])),
              title: Text(entry.value['label'] ?? 'Error'));
        }).toList(),
      ),
    );
  }
}
