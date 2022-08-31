import 'package:flutter/material.dart';

import 'presenter/requerimientos_list_page.dart';

class MainDocumentosPage extends StatefulWidget {
  const MainDocumentosPage({Key? key}) : super(key: key);

  @override
  State<MainDocumentosPage> createState() => _MainDocumentosPageState();
}

class _MainDocumentosPageState extends State<MainDocumentosPage> {
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
