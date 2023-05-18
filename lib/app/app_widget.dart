import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rrhh_clean/core/uitls/theme/theme_custon.dart';


class AppWidget extends StatefulWidget {
  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //await Modular.getAsync<AppModule>();
  }

  @override
  Widget build(BuildContext context) {
    //Modular.setObservers([asuka.asukaHeroController]);

    Modular.setInitialRoute('/');

    return FluentApp.router(
      debugShowCheckedModeBanner: false,
      theme: FluentThemeData.light().copyWith(
        //accentColor: appTheme.color,
        visualDensity: VisualDensity.standard,
        extensions: <ThemeExtension<dynamic>>[
          ThemeCustom(
            colorBackground: Color.fromARGB(255, 217, 217, 217),
            //colorPrimary: Color.fromARGB(255, 189, 71, 2),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              color: Color.fromARGB(239, 255, 142, 142),
            ),
          ),
        ],
      ),
      title: 'RRHH',
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      color: Colors.blue,
    );
  }
}
