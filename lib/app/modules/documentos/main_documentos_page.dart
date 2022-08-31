import 'package:flutter/material.dart';

import 'presenter/documentos_list_page.dart';

class MainDocumentosPage extends StatefulWidget {
  const MainDocumentosPage({Key? key}) : super(key: key);

  @override
  State<MainDocumentosPage> createState() => _MainDocumentosPageState();
}

class _MainDocumentosPageState extends State<MainDocumentosPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(flex: 7, child: DocumentosListPage()),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
