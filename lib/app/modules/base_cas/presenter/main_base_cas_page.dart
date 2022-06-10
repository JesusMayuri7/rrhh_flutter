import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'base_cas_page/base_cas_page.dart';
import 'presupuesto_page/pages/presupuesto_cas_page.dart';

import 'resumen_page/resumen_cas_page.dart';

class MainBaseCasPage extends StatefulWidget {
  const MainBaseCasPage({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<MainBaseCasPage> {
  int _selectedIndex = 0;
  final pageViewController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageViewController,
        onPageChanged: (a) => _selectedIndex,
        children: [
          BaseCasPage(),
          PresupuestoCasPage(),
          ResumenCasPage(),
          //AirhspPage(tipoPersona: '6'),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            this._selectedIndex = index;
          });
          pageViewController.jumpToPage(this._selectedIndex);
        },
        items: [
          BottomNavigationBarItem(
            icon: new Icon(MaterialIcons.person),
            label: 'BASE',
          ),
          BottomNavigationBarItem(
            icon: new Icon(MaterialIcons.person_outline),
            label: 'PRESUPUESTO',
          ),
          BottomNavigationBarItem(
            icon: new Icon(MaterialIcons.person_outline),
            label: 'RESUMEN',
          ),
        ],
      ),
    );
  }
}
