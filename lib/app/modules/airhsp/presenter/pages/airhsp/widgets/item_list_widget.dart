import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rrhh_clean/app/modules/airhsp/domain/entities/airhsp_entity.dart';
import 'package:rrhh_clean/app/modules/airhsp/presenter/bloc/conceptos_bloc/conceptos_bloc.dart';

import '../../conceptos/conceptos_page.dart';
import '../../../../../../../core/uitls/device_info.dart';

class ItemListPage extends StatelessWidget {
  final ConceptosBloc blocConceptos;
  //final blocConceptos = Modular.get<ConceptosBloc>();
  final String tipoPersona;
  final AirhspEntity item;
  ItemListPage(this.blocConceptos, this.item, this.tipoPersona);

  @override
  Widget build(BuildContext context) {
    Color colorEstado = (item.estado == 'O')
        ? Colors.blueAccent
        : (item.estado == 'V')
            ? Colors.yellow
            : Colors.orange;
    return Card(
      shape: RoundedRectangleBorder(
          side: new BorderSide(color: Colors.blue, width: 2.0),
          borderRadius: BorderRadius.circular(10.0)),
      // color: Colors.indigo,
      child: ListTile(
          leading: CircleAvatar(
            child: Text(
              item.estado,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            backgroundColor: colorEstado,
          ),
          title: Row(
            children: <Widget>[
              Text(' ' + (item.plaza) + '' + ' ',
                  style: TextStyle(
                      backgroundColor: Colors.blueAccent, color: Colors.white)),
              Text(' - '),
              Expanded(child: Text((item.nombres))),
            ],
          ),
          subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(item.cargo),
                Text(item.dependencia),
                Text(item.establecimiento),
              ]),
          dense: true,
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            if (DeviceInfo.isMobile) {
              Modular.to.push(new MaterialPageRoute(
                  builder: (BuildContext context) {
                    return new ConceptosPage(
                      codPlaza: item.plaza,
                      nombres: item.nombres,
                      tipoPersona: this.tipoPersona,
                    );
                  },
                  fullscreenDialog: true));
            } else {
              print('click desktop');
              // Acuerdate que este bloc no es singleton, por lo tanto tiene que ser la misma instancia de la pagina principal, por eso viene como parametro
              this.blocConceptos.add(ConceptosLoadEvent(
                    ejecutora: '1078',
                    nombres: 'nombres',
                    codPlaza: item.plaza,
                    tipoPersona: this.tipoPersona,
                  ));
              //}
            }
          }),
    );
  }
}
