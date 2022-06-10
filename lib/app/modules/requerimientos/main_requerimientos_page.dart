import 'package:flutter/material.dart';

import 'presenter/requerimientos_list_page.dart';

class MainRequerimientosPage extends StatefulWidget {
  const MainRequerimientosPage({Key? key}) : super(key: key);

  @override
  State<MainRequerimientosPage> createState() => _MainRequerimientosPageState();
}

class _MainRequerimientosPageState extends State<MainRequerimientosPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(flex: 7, child: RequerimientosListPage()),
                Flexible(
                    flex: 3,
                    child: Container(
                      color: Colors.blue,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
