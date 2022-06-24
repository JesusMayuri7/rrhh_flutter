import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'airhsp/airhsp_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  int _selectedIndex = 0;
  final pageViewController = PageController();
  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      child: Scaffold(
        body: PageView(
          controller: pageViewController,
          onPageChanged: (a) => _selectedIndex,
          children: [
            AirhspPage(tipoPersona: '1'),
            AirhspPage(tipoPersona: '4'),
            AirhspPage(tipoPersona: '6'),
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
              label: 'CAP',
            ),
            BottomNavigationBarItem(
              icon: new Icon(MaterialIcons.person_outline),
              label: 'CAS',
            ),
            BottomNavigationBarItem(
              icon: Icon(Entypo.graduation_cap),
              label: 'FORMATIVA',
            )
          ],
        ),
      ),
    );
  }
}
