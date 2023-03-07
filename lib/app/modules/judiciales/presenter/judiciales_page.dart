import 'package:flutter/material.dart';

import 'datagrid/detail/judicial_detail_page.dart';
import 'datagrid/list_judiciales_page.dart';

class JudicialesPage extends StatefulWidget {
  const JudicialesPage({Key? key}) : super(key: key);

  @override
  State<JudicialesPage> createState() => _JudicialesPageState();
}

class _JudicialesPageState extends State<JudicialesPage> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [                
        Expanded(          
          child:ListJudicialesPage()),
        SizedBox(
          width: 500,
          child:Column(
            children: [
              Text('Detalle de Reposicion Judicial'),
              JudicialDetailPage(),
            ],
          ))
      ],
    );
  }
}
