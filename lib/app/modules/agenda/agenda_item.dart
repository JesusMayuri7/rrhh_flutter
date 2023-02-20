import 'package:flutter/material.dart';
import 'package:rrhh_clean/core/uitls/widgets/show_dialog_widget.dart';

import 'agenda_entity.dart';
import 'agenda_save_page.dart';

class AgendaItem extends StatelessWidget {
  const AgendaItem({
    super.key,
    required this.index,
    required this.listAgenda,
  });

  final List<AgendaEntity> listAgenda;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[200],
      shadowColor: Colors.grey,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(5)),
              child: SelectableText('${listAgenda[index].titulo}',
                  style: TextStyle(color: Colors.white, fontSize: 13)),
            ),
            SizedBox(height: 5),
            Container(
              alignment: Alignment.centerLeft,
              child: SelectableText(
                '${listAgenda[index].texto}',
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),
            ),
            Spacer(),
            Row(
              children: [
                SelectableText(
                  'Fecha: ${listAgenda[index].fecha}',
                  style: TextStyle(color: Colors.black, fontSize: 12),
                ),
                Spacer(),
                ElevatedButton.icon(
                  onPressed: () {
                    showModalDialogWidget(
                        contextDialog: context,
                        pageDetail: AgendaSavePage(
                            title: 'Editar Agenda',
                            agendaEntity: listAgenda[index]),
                        width: 350,
                        height: 300);
                  },
                  icon: Icon(Icons.edit),
                  label: Text('Edit'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
