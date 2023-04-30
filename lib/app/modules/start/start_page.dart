import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rrhh_clean/core/presenter/logout_widget.dart';
import 'package:rrhh_clean/app/app_service.dart';
import 'package:rrhh_clean/core/uitls/theme/theme_custon.dart';
import 'package:rrhh_clean/core/uitls/widgets/windows_buttons.dart';

import 'package:window_manager/window_manager.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> with WindowListener {
  final appService = Modular.get<AppService>();
  String? anioSelected;

  @override
  void initState() {
    super.initState();
    init();
    windowManager.addListener(this);
  }

  void init() {
    this.anioSelected = this.appService.sessionEntity!.anio;
  }

  @override
  void dispose() {
    //blocApp.close();
    windowManager.removeListener(this);
    super.dispose();
  }

  @override
  void onWindowClose() async {
    bool _isPreventClose = await windowManager.isPreventClose();
    if (_isPreventClose) {
      showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text('Salir del sistema ?'),
            actions: [
              TextButton(
                child: Text('No'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('Si'),
                onPressed: () {
                  Navigator.of(context).pop();
                  windowManager.destroy();
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
    return SafeArea(
      child: Scaffold(
        appBar: AppBarPage(anioSelected: this.anioSelected),
        body: RouterOutlet(),
        drawerEdgeDragWidth: 5,
        drawer: Container(
          width: 170,
          child: DrawerPage(),
        ),
      ),
    );
  }
}

class AppBarPage extends StatelessWidget implements PreferredSizeWidget {
  const AppBarPage({
    super.key,
    required this.anioSelected,
  });

  final String? anioSelected;

  @override
  Size get preferredSize => Size.fromHeight(40);

  @override
  Widget build(BuildContext context) {
    final ThemeCustom? theme = Theme.of(context).extension<ThemeCustom>();
    return AppBar(
      //iconTheme: IconThemeData(color: Colors.amber),
      backgroundColor: theme?.colorPrimary,
      automaticallyImplyLeading: false,
      centerTitle: true,
      //toolbarHeight: 20,
      elevation: 0,
      title: () {
        if (kIsWeb)
          return Row(
            children: [
              Text('RRHH - PROVIAS NACIONAL - ${anioSelected}',
                  style: TextStyle(fontSize: 11)),
              const Spacer(),
              LogoutWidget(),
            ],
          );
        return DragToMoveArea(
          child: Row(
            children: [
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text('Recursos Humanos [' + anioSelected! + ']',
                    style: TextStyle(fontSize: 13)),
              ),
              const Spacer(),
              LogoutWidget(),
              if (!kIsWeb) const WindowButtons(),
            ],
          ),
        );
      }(),
      leading: Builder(
        builder: (context) => Container(
          padding: EdgeInsets.only(left: 3, right: 3, top: 0, bottom: 0),
          child: new IconButton(
            padding: EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
            icon: new Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
    );
  }
}

class DrawerPage extends StatelessWidget {
  const DrawerPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            child: new DrawerHeader(
              margin: EdgeInsets.all(0),
              child: ListTile(
                title: Text(
                  "Opciones de Consulta",
                  style: TextStyle(color: Colors.white, fontSize: 25.0),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
          ),
          ListTile(
            title: Text("Agenda"),
            //trailing: Icon(Icons.arrow_forward),
            onTap: () {
              //controller.titleAppBar = 'AirHsp';
              Modular.to.navigate('/start/agenda/');
              Navigator.pop(context);
            },
          ),
          ExpansionTile(
            title: Text('AIRHSP'),
            childrenPadding: EdgeInsets.only(left: 20),
            children: [
              ListTile(
                title: Text("Personal"),
                //trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  //controller.titleAppBar = 'AirHsp';
                  Modular.to.navigate('/start/airhsp/personal');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("Presupuesto"),
                //trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  //controller.titleAppBar = 'AirHsp';
                  Modular.to.navigate('/start/airhsp/presupuesto');
                  Navigator.pop(context);
                },
              )
            ],
          ),
          ListTile(
            title: Text("Base CAP"),
            //trailing: Icon(Icons.arrow_forward),
            onTap: () {
              //controller.titleAppBar = 'AirHsp';
              Modular.to.navigate('/start/base_cap/');
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text("Base CAS"),
            //trailing: Icon(Icons.arrow_forward),
            onTap: () {
              //controller.titleAppBar = 'AirHsp';
              Modular.to.navigate('/start/base_cas/');
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text("Base PRAC"),
            //trailing: Icon(Icons.arrow_forward),
            onTap: () {
              //controller.titleAppBar = 'AirHsp';
              Modular.to.navigate('/start/base_prac/');
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text("Certificados"),
            //trailing: Icon(Icons.arrow_forward),
            onTap: () {
              //controller.titleAppBar = 'AirHsp';
              Modular.to.pushNamed('/start/certificados/');
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text("Confianza"),
            //trailing: Icon(Icons.arrow_forward),
            onTap: () {
              //controller.titleAppBar = 'AirHsp';
              Modular.to.navigate('/start/confianza/');
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text("Liquidacion"),
            //trailing: Icon(Icons.arrow_forward),
            onTap: () {
              //controller.titleAppBar = 'AirHsp';
              Modular.to.navigate('/start/liquidacion/');
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text("Subsidio"),
            //trailing: Icon(Icons.arrow_forward),
            onTap: () {
              //controller.titleAppBar = 'AirHsp';
              Modular.to.navigate('/start/subsidio/');
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text("Documentos"),
            //trailing: Icon(Icons.arrow_forward),
            onTap: () {
              //controller.titleAppBar = 'AirHsp';
              Modular.to.navigate('/start/documentos/');
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text("Judiciales"),
            //trailing: Icon(Icons.arrow_forward),
            onTap: () {
              //controller.titleAppBar = 'AirHsp';
              Modular.to.navigate('/start/judiciales/');
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text("Importar"),
            //trailing: Icon(Icons.arrow_forward),
            onTap: () {
              //controller.titleAppBar = 'AirHsp';
              Modular.to.navigate('/start/import/');
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text("Requerimientos"),
            //trailing: Icon(Icons.arrow_forward),
            onTap: () {
              //controller.titleAppBar = 'AirHsp';
              Modular.to.navigate('/start/requerimientos/');
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
