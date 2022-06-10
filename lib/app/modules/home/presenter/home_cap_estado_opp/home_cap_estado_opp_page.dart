import 'package:fluent_ui/fluent_ui.dart';

import 'package:rrhh_clean/app/modules/home/domain/cap_estado_opp_entity.dart';
import 'package:rrhh_clean/app/modules/home/presenter/home_cap_estado_opp/getColumnsCapEstadoOpp.dart';
import 'package:rrhh_clean/app/modules/home/presenter/home_cap_estado_opp/home_cap_estado_datasource.dart';

import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'package:syncfusion_flutter_core/theme.dart';

class HomeCapEstadoOppPage extends StatefulWidget {
  HomeCapEstadoOppPage({Key? key, this.capEstadoOppEntity = const []})
      : super(key: key);

  final List<CapEstadoOppEntity> capEstadoOppEntity;

  @override
  _HomeCapEstadoOppPageState createState() => _HomeCapEstadoOppPageState();
}

class _HomeCapEstadoOppPageState extends State<HomeCapEstadoOppPage> {
  late HomeCapEstadoOppDataSource capEstadoOppDataSource;
  var _estados = ['CONCURSO', 'CONFIANZA'];
  String estadoSelected = 'CONCURSO';

  @override
  void initState() {
    print(widget.capEstadoOppEntity.toString());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(estadoSelected);
    List<CapEstadoOppEntity> sumList = List.from(widget.capEstadoOppEntity);

    this.capEstadoOppDataSource = HomeCapEstadoOppDataSource(
        capEstadoOppList: sumCapEstadoOpp(sumList
            .where((element) => element.modalidad == estadoSelected)
            .toList()));
    this.capEstadoOppDataSource.buildDataGridRows();
    return Expanded(
      child: Column(
        children: [
          Container(
              alignment: Alignment.centerLeft,
              child: Combobox<String>(
                placeholder: Text('Tipo'),
                items: _estados.map<ComboboxItem<String>>((String value) {
                  return ComboboxItem<String>(
                    value: value,
                    child: Container(
                        width: 80,
                        child: Text(value, style: TextStyle(fontSize: 10))),
                  );
                }).toList(),
                value: estadoSelected,
                onChanged: (value) {
                  setState(() {
                    estadoSelected = value!;
                  });
                  // this.blocApp.add(AppAnioSelectEvent(_anioSelected));
                },
              )),
          SfDataGridTheme(
            data: SfDataGridThemeData(
              brightness: FluentTheme.of(context).brightness,
              headerHoverColor: Colors.white.withOpacity(0.3),
              headerColor: Colors.blue,
            ),
            child: SfDataGrid(
              key: UniqueKey(),
              allowEditing: true,
              footerFrozenRowsCount: 1,
              editingGestureType: EditingGestureType.tap,
              navigationMode: GridNavigationMode.cell,
              source: capEstadoOppDataSource,
              columns: getColumnsCapEstadoOpp(),
              headerRowHeight: 20,
              rowHeight: 20,
              isScrollbarAlwaysShown: true,
              gridLinesVisibility: GridLinesVisibility.both,
              headerGridLinesVisibility: GridLinesVisibility.both,
            ),
          ),
        ],
      ),
    );
  }

  Widget normalChildButton() {
    return SizedBox(
      width: 93,
      height: 20,
      child: Padding(
        padding: const EdgeInsets.only(left: 5, right: 11),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
                child: Text(
              estadoSelected,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 10),
            )),
            const SizedBox(
              width: 12,
              height: 17,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Icon(
                  FluentIcons.dropdown,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  sumCapEstadoOpp(List<CapEstadoOppEntity> params) {
    int ocupado = 0;
    int vacante = 0;
    int reservado = 0;

    for (var item in params) {
      ocupado += item.ocupado;
      vacante += item.vacante;
      reservado += item.reservado;
    }
    params.add(CapEstadoOppEntity(
        descUnidad: 'Totales',
        modalidad: '',
        ocupado: ocupado,
        vacante: vacante,
        reservado: reservado,
        orgUId: 0));

    return params;
  }
}
