import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:rrhh_clean/app/modules/requerimientos/presenter/get_columns_grid.dart';

class RequerimientosListPage extends StatefulWidget {
  const RequerimientosListPage({Key? key}) : super(key: key);

  @override
  State<RequerimientosListPage> createState() => _RequerimientosListPageState();
}

class _RequerimientosListPageState extends State<RequerimientosListPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: PlutoGrid(
            configuration: PlutoGridConfiguration(
              rowHeight: 25,
            ),
            columns: columns,
            rows: rows,
            onChanged: (PlutoGridOnChangedEvent event) {
              print(event);
            },
            onLoaded: (PlutoGridOnLoadedEvent event) {
              print(event);
            }));
  }
}
