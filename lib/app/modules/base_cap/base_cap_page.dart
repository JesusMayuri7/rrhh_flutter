import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'presenter/cap/cap_page.dart';

class BaseCapPage extends StatefulWidget {
  final String title;
  const BaseCapPage({Key? key, this.title = "BaseCap"}) : super(key: key);

  @override
  _BaseCapPageState createState() => _BaseCapPageState();
}

class _BaseCapPageState extends State<BaseCapPage> {
  int _selectedIndex = 0;
  final pageViewController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageViewController,
        onPageChanged: (a) => _selectedIndex,
        children: [CapPage()],
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
