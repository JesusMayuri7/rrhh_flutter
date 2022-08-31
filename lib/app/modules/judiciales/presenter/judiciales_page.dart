import 'package:flutter/material.dart';

import 'datagrid/list_judiciales_page.dart';

class JudicialesPage extends StatefulWidget {
  const JudicialesPage({Key? key}) : super(key: key);

  @override
  State<JudicialesPage> createState() => _JudicialesPageState();
}

class _JudicialesPageState extends State<JudicialesPage> {
  @override
  Widget build(BuildContext context) {
    return ListJudicialesPage();
  }
}
