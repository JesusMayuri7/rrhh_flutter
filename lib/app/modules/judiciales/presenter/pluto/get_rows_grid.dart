import 'package:pluto_grid/pluto_grid.dart';
import 'package:rrhh_clean/app/modules/judiciales/domain/judicial_entity.dart';

List<PlutoRow> getRowsGrid(List<JudicialEntity> judicialesEntity) {
  List<PlutoRow> rows = judicialesEntity
      .map((e) => PlutoRow(cells: {
            "id": PlutoCell(value: e.id),
            "anio": PlutoCell(value: e.anio),
            "asunto": PlutoCell(value: e.nombres),
            "expediente": PlutoCell(value: e.dni),
            "tipo": PlutoCell(value: e.descArea),
            "fecha": PlutoCell(value: e.fechaIngreso),
            "monto": PlutoCell(value: e.montoJudicial),
            "destino": PlutoCell(value: e.detalle),
          }))
      .toList();
  return rows;
}
