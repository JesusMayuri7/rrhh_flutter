import 'package:fluent_ui/fluent_ui.dart' as f;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:window_manager/window_manager.dart';

import 'package:rrhh_clean/app/modules/auth/presenter/bloc/auth_bloc.dart';

import 'package:rrhh_clean/core/presenter/logou_widget.dart';
import 'package:rrhh_clean/core/uitls/widgets/windows_buttons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StartFluent extends StatefulWidget {
  const StartFluent({Key? key}) : super(key: key);

  @override
  State<StartFluent> createState() => _StartFluentState();
}

class _StartFluentState extends State<StartFluent> with WindowListener {
  final viewKey = GlobalKey();
  int index = 0;
  final bloc = Modular.get<AuthBloc>();
  final SharedPreferences preferences = Modular.get<SharedPreferences>();

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    windowManager.addListener(this);
  }

  @override
  void onWindowClose() async {
    bool _isPreventClose = await windowManager.isPreventClose();
    if (_isPreventClose) {
      showDialog(
        context: context,
        builder: (_) {
          return f.ContentDialog(
            title: const Text('Confirmar cierre'),
            content: const Text('Estas seguro de cerrar el programa RRHH?'),
            actions: [
              f.FilledButton(
                child: const Text('Si'),
                onPressed: () {
                  Navigator.pop(context);
                  windowManager.destroy();
                },
              ),
              f.Button(
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
    return BlocListener<AuthBloc, AuthState>(
      bloc: this.bloc,
      listener: (context, state) {
        if (state is AuthInitial) {
          preferences.clear();
          Modular.to.pushNamedAndRemoveUntil('/login', (p0) => false);
        }
      },
      child: f.NavigationView(
        key: viewKey,
        appBar: f.NavigationAppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: true,
          title: () {
            if (kIsWeb) return const Text('Recursos Humanos');
            return const DragToMoveArea(
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text('Recursos Humanos '),
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
        pane: f.NavigationPane(
          displayMode: f.PaneDisplayMode.compact,
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
                Modular.to.pushNamed('/start/documentos/');
                break;
              case 10:
                Modular.to.pushNamed('/start/judiciales/');
                break;
              case 11:
                Modular.to.pushNamed('/start/requerimientos/');
                break;
              case 12:
                Modular.to.pushNamed('/start/import/');
                break;
              case 13:
                Modular.to.pushNamed('/start/reports/');
                break;

              default:
            }
          },
          header: Padding(
            padding: EdgeInsets.all(2),
            child: DefaultTextStyle(
                style: f.FluentTheme.of(context).typography.bodyStrong!,
                child: const Text('Recursos Humanos')),
          ),
          size: const f.NavigationPaneSize(
            openWidth: 200,
            openMinWidth: 200.0,
            openMaxWidth: 200.0,
          ),
          items: [
            // It doesn't look good when resizing from compact to open
            // PaneItemHeader(header: Text('User Interaction')),
            f.PaneItem(
              icon: const Icon(f.FluentIcons.home),
              title: const Text('Inicio'),
            ),
            f.PaneItemSeparator(),
            f.PaneItem(
              icon: const Icon(f.FluentIcons.bank),
              title: const Text('AIRHSP'),
            ),
            f.PaneItem(
              icon: const Icon(MaterialIcons.person),
              title: const Text('Base CAP'),
            ),
            f.PaneItem(
              icon: const Icon(MaterialIcons.person_outline),
              title: const Text('Base CAS'),
            ),
            f.PaneItem(
              title: const Text('Base PRAC'),
              icon: const Icon(Entypo.graduation_cap),
            ),
            f.PaneItem(
              icon: const Icon(f.FluentIcons.check_list_text),
              title: const Text('Certificados'),
            ),
            f.PaneItem(
              icon: const Icon(f.FluentIcons.employee_self_service),
              title: const Text('Confianza'),
            ),
            f.PaneItem(
              icon: const Icon(f.FluentIcons.clipboard_list),
              title: const Text('Liquidacion'),
            ),
            f.PaneItem(
              icon: const Icon(MaterialIcons.money_off),
              title: const Text('Devolucion'),
            ),
            f.PaneItem(
              icon: const Icon(f.FluentIcons.document_management),
              title: const Text('Documentos'),
            ),
            f.PaneItem(
              icon: const Icon(Icons.balance),
              title: const Text('Judiciales'),
            ),
            f.PaneItemSeparator(),
            f.PaneItem(
              icon: const Icon(f.FluentIcons.folder_list),
              title: const Text('Requerimientos'),
            ),
            f.PaneItem(
              icon: const Icon(f.FluentIcons.cloud_import_export),
              title: const Text('Importar'),
            ),

            f.PaneItem(
              icon: const Icon(f.FluentIcons.cloud_import_export),
              title: const Text('Reports'),
            ),
          ],
        ),
        content: RouterOutlet(),
      ),
    );
  }
}
