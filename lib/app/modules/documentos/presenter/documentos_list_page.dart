import 'package:flutter/material.dart';

import 'datagrid/list_documentos_page.dart';

class DocumentosListPage extends StatefulWidget {
  const DocumentosListPage({Key? key}) : super(key: key);

  @override
  State<DocumentosListPage> createState() => _DocumentosListPageState();
}

class _DocumentosListPageState extends State<DocumentosListPage> {
  @override
  Widget build(BuildContext context) {
    return ListDocumentosPage();
  }
}
