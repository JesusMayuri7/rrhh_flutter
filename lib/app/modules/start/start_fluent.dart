import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:window_manager/window_manager.dart';

class StartFluent extends StatefulWidget {
  const StartFluent({Key? key}) : super(key: key);

  @override
  State<StartFluent> createState() => _StartFluentState();
}

class _StartFluentState extends State<StartFluent> with WindowListener {
  final viewKey = GlobalKey();
  int index = 0;

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  @override
  void initState() {
    windowManager.addListener(this);
    super.initState();
  }

  @override
  void onWindowClose() async {
    bool _isPreventClose = await windowManager.isPreventClose();
    if (_isPreventClose) {
      showDialog(
        context: context,
        builder: (_) {
          return ContentDialog(
            title: const Text('Confirmar cierre'),
            content: const Text('Estas seguro de cerrar el programa RRHH?'),
            actions: [
              FilledButton(
                child: const Text('Si'),
                onPressed: () {
                  Navigator.pop(context);
                  windowManager.destroy();
                },
              ),
              Button(
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
    return NavigationView(
        key: viewKey,
        appBar: NavigationAppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: true,
          title: () {
            if (kIsWeb) return const Text('Recursos Humanos');
            return const DragToMoveArea(
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text('Recursos Humanos'),
              ),
            );
          }(),
          height: 25,
          leading: Align(
            alignment: AlignmentDirectional.centerStart,
            child: FlutterLogo(size: 15),
          ),
          actions: Row(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              if (!kIsWeb) const WindowButtons(),
            ],
          ),
        ),
        pane: NavigationPane(
          displayMode: PaneDisplayMode.compact,
          selected: index,
          onChanged: (i) {
            setState(() => index = i);
            switch (i) {
              case 0:
                Modular.to.pushNamed('/start/home/');
                break;
              case 1:
                Modular.to.pushNamed('/start/airhsp/');
                break;
              case 2:
                Modular.to.pushNamed('/start/base_cap/');
                break;
              case 3:
                Modular.to.pushNamed('/start/base_cas/');
                break;
              case 4:
                Modular.to.pushNamed('/start/base_prac/');
                break;
              case 5:
                Modular.to.pushNamed('/start/certificados/');
                break;
              case 6:
                Modular.to.pushNamed('/start/confianza/');
                break;
              case 7:
                Modular.to.pushNamed('/start/liquidacion/');
                break;
              case 8:
                Modular.to.pushNamed('/start/subsidio/');
                break;
              case 9:
                Modular.to.pushNamed('/start/requerimientos/');
                break;
              case 10:
                Modular.to.pushNamed('/start/import/');
                break;
              default:
            }
          },
          header: Padding(
            padding: EdgeInsets.all(2),
            child: DefaultTextStyle(
                style: FluentTheme.of(context).typography.bodyStrong!,
                child: const Text('Recursos Humanos')),
          ),
          size: const NavigationPaneSize(
            openWidth: 200,
            openMinWidth: 200.0,
            openMaxWidth: 200.0,
          ),
          items: [
            // It doesn't look good when resizing from compact to open
            // PaneItemHeader(header: Text('User Interaction')),
            PaneItem(
              icon: const Icon(FluentIcons.home),
              title: const Text('Inicio'),
            ),
            PaneItemSeparator(),
            PaneItem(
              icon: const Icon(FluentIcons.bank),
              title: const Text('AIRHSP'),
            ),
            PaneItem(
              icon: const Icon(MaterialIcons.person),
              title: const Text('Base CAP'),
            ),
            PaneItem(
              icon: const Icon(MaterialIcons.person_outline),
              title: const Text('Base CAS'),
            ),
            PaneItem(
              title: const Text('Base PRAC'),
              icon: const Icon(Entypo.graduation_cap),
            ),
            PaneItem(
              icon: const Icon(FluentIcons.check_list_text),
              title: const Text('Certificados'),
            ),
            PaneItem(
              icon: const Icon(FluentIcons.employee_self_service),
              title: const Text('Confianza'),
            ),
            PaneItem(
              icon: const Icon(FluentIcons.clipboard_list),
              title: const Text('Liquidacion'),
            ),
            PaneItem(
              icon: const Icon(MaterialIcons.money_off),
              title: const Text('Devolucion'),
            ),
            PaneItem(
              icon: const Icon(FluentIcons.folder_list),
              title: const Text('Requerimientos'),
            ),
            PaneItem(
              icon: const Icon(FluentIcons.cloud_import_export),
              title: const Text('Importar'),
            ),
            PaneItemSeparator(),
          ],
        ),
        content: RouterOutlet());
  }
}

class WindowButtons extends StatelessWidget {
  const WindowButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = FluentTheme.of(context);

    return SizedBox(
      width: 138,
      height: 50,
      child: WindowCaption(
        brightness: theme.brightness,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
