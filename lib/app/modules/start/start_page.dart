import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:window_manager/window_manager.dart';
import '../../bloc/app_bloc.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> with WindowListener {
  var blocApp = Modular.get<AppBloc>();

  @override
  void dispose() {
    blocApp.close();
    windowManager.removeListener(this);
    super.dispose();
  }

  @override
  void initState() {
    windowManager.addListener(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
        bloc: blocApp,
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                iconTheme: IconThemeData(),
                automaticallyImplyLeading: false,
                centerTitle: true,
                toolbarHeight: 30,
                //title: Text(
                // 'RRHH - PROVIAS NACIONAL - ${(this.blocApp.state as AppAnioSelectedState).anioSelected}',
                //    style: TextStyle(fontSize: 12)),
                leading: Builder(
                  builder: (context) => Container(
                    padding:
                        EdgeInsets.only(left: 3, right: 3, top: 0, bottom: 0),
                    child: new IconButton(
                      padding:
                          EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
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
              ),
              body: RouterOutlet(),
              drawerEdgeDragWidth: 5,
              drawer: Container(
                width: 180,
                child: Drawer(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: <Widget>[
                      Container(
                        child: new DrawerHeader(
                          margin: EdgeInsets.all(0),
                          child: ListTile(
                            title: Text(
                              "Opciones de Consulta",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 25.0),
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text("Inicio"),
                        //trailing: Icon(Icons.arrow_forward),
                        onTap: () {
                          //controller.titleAppBar = 'AirHsp';
                          Modular.to.navigate('/start/home/');
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        title: Text("AirHsp"),
                        //trailing: Icon(Icons.arrow_forward),
                        onTap: () {
                          //controller.titleAppBar = 'AirHsp';
                          Modular.to.navigate('/start/airhsp/');
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
                        title: Text("Base CAS"),
                        //trailing: Icon(Icons.arrow_forward),
                        onTap: () {
                          //controller.titleAppBar = 'AirHsp';
                          Modular.to.navigate('/start/base_cas/');
                          Navigator.pop(context);
                        },
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
                        title: Text("Requerimientos"),
                        //trailing: Icon(Icons.arrow_forward),
                        onTap: () {
                          //controller.titleAppBar = 'AirHsp';
                          Modular.to.navigate('/start/requerimientos/');
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
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
