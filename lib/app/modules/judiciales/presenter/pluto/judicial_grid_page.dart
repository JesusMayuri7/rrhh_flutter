import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:rrhh_clean/core/uitls/widgets/show_toast_dialog.dart';

import '../bloc/list/judiciales_list_bloc.dart';
import 'get_columns_grid.dart';
import 'get_rows_grid.dart';

class JudicialGridPage extends StatefulWidget {
  JudicialGridPage({Key? key}) : super(key: key);

  @override
  State<JudicialGridPage> createState() => _JudicialGridPageState();
}

class _JudicialGridPageState extends State<JudicialGridPage> {
  final blocList = Modular.get<JudicialesListBloc>();
  List<PlutoRow> rowList = [];
  late PlutoGridStateManager stateManager;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<JudicialesListBloc, JudicialesListState>(
        bloc: this.blocList,
        listener: (context, state) {
          if (state is JudicialesListError) {
            showToastError(context, state.message);
          }
        },
        builder: (context, state) {
          if (state is JudicialesListLoaded) {
            rowList.addAll(getRowsGrid(state.judicialesListOriginal));
            //stateManager.notifyListeners();
            //stateManager.removeAllRows();
            WidgetsBinding.instance.addPostFrameCallback((_) {
              stateManager.appendRows([
                PlutoRow(cells: {
                  "id": PlutoCell(value: 'e.id'),
                  "anio": PlutoCell(value: 'e.anio'),
                  "asunto": PlutoCell(value: 'e.asunto'),
                  "expediente": PlutoCell(value: 'e.expediente'),
                  "tipo": PlutoCell(value: 'e.tipo'),
                  "fecha": PlutoCell(value: 'e.fecha'),
                  "numero": PlutoCell(value: 'e.numero'),
                  "destino": PlutoCell(value: 'e.destino'),
                })
              ]);
              stateManager.notifyListeners();
            });
          }
          return Column(
            children: [
              Row(
                children: [
                  Button(
                      child: Text('Actualizar'),
                      onPressed: () {
                        //this.blocList.add(JudicialesListLoad(anio: '2022'));
                      })
                ],
              ),
              Expanded(
                  child: PlutoGrid(
                      configuration: PlutoGridConfiguration(),
                      columns: columns,
                      rows: rowList,
                      onChanged: (PlutoGridOnChangedEvent event) {},
                      onLoaded: (PlutoGridOnLoadedEvent event) =>
                          stateManager = event.stateManager)),
            ],
          );
        });
  }
}
