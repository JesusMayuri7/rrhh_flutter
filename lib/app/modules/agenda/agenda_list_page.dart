import 'package:flutter/material.dart';
import 'package:fluent_ui/fluent_ui.dart' as fluentUi;
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:rrhh_clean/app/modules/agenda/agenda_save_page.dart';
import 'package:rrhh_clean/app/modules/agenda/agenda_entity.dart';
import 'package:rrhh_clean/app/modules/agenda/cubit/agenda_list_cubit.dart';
import 'package:rrhh_clean/app/app_service.dart';
import 'package:rrhh_clean/core/uitls/theme/theme_custon.dart';
import 'package:rrhh_clean/core/uitls/widgets/show_dialog_widget.dart';

const cellRed = Color(0xffc73232);
const cellMustard = Color(0xffd7aa22);
const cellGrey = Color(0xffcfd4e0);
const cellBlue = Color(0xff1553be);
const background = Color(0xff242830);

class AgendaListPage extends StatefulWidget {
  final String title;
  const AgendaListPage({Key? key, this.title = 'ListAgendaPage'})
      : super(key: key);
  @override
  AgendaListPageState createState() => AgendaListPageState();
}

class AgendaListPageState extends State<AgendaListPage> {
  final appService = Modular.get<AppService>();
  final blocListAgenda = Modular.get<AgendaListCubit>();
  String? anioSelected;
  List<AgendaEntity> listAgenda = [];
  final int crossAxisCount = 2;
  FocusNode? myFocusNode;

  @override
  void initState() {
    super.initState();
    init();
    if (this.blocListAgenda.state is AgendaListInitial) {
      this.blocListAgenda.loaded(anioSelected!);
    }
    myFocusNode = FocusNode();
  }

  void init() {
    anioSelected = appService.sessionEntity!.anio;
  }

  @override
  Widget build(BuildContext context) {
    final ThemeCustom? theme = Theme.of(context).extension<ThemeCustom>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                  onPressed: () {
                    this.blocListAgenda.loaded(anioSelected!);
                  },
                  child: Text('Actualizar')),
              Spacer(),
              SizedBox(
                width: 500,
                child: fluentUi.TextFormBox(
                    placeholder: 'Buscar',
                    focusNode: myFocusNode,
                    autocorrect: false,
                    autofocus: true,
                    onFieldSubmitted: (value) {
                      this.blocListAgenda.filtered(value);
                      FocusScope.of(context).requestFocus(myFocusNode);
                    }),
              ),
              Spacer(),
              ElevatedButton(
                  onPressed: () {
                    showModalDialogWidget(
                        contextDialog: context,
                        pageDetail: AgendaSavePage(title: 'Nueva Agenda'),
                        width: 450,
                        height: 450);
                  },
                  child: Text('Nuevo')),
            ],
          ),
        ),
        Expanded(
          child: BlocConsumer<AgendaListCubit, AgendaListState>(
            bloc: this.blocListAgenda,
            listener: (context, state) {
              if (state is AgendaListError) {
                print(state.message);
              }
            },
            builder: (context, state) {
              if (state is AgendaListLoaded) {
                if (state.listAgendaFiltered.isNotEmpty) {
                  listAgenda = state.listAgendaFiltered;
                  final rowSizes = listAgenda.length > 4
                      ? List.generate(
                          listAgenda.length ~/ crossAxisCount, (_) => auto)
                      : [auto];
                  return Column(
                    children: [
                      Expanded(
                        child: CustomScrollView(
                          slivers: [
                            SliverToBoxAdapter(
                              child: LayoutGrid(
                                columnGap: 5,
                                rowGap: 2,
                                columnSizes: [1.fr, 1.fr, 1.fr, 1.fr],
                                rowSizes: rowSizes,
                                children:
                                    List.generate(listAgenda.length, (index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Card(
                                      color: theme!.colorBackground,
                                      shadowColor: Colors.grey,
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: double.infinity,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 5),
                                              decoration: BoxDecoration(
                                                  color: Colors.blueAccent,
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: SelectableText(
                                                  '${listAgenda[index].titulo}',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 13)),
                                            ),
                                            SizedBox(height: 5),
                                            Container(
                                              alignment: Alignment.centerLeft,
                                              child: SelectableText(
                                                '${listAgenda[index].texto}',
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12),
                                              ),
                                            ),
                                            Spacer(),
                                            Row(
                                              children: [
                                                SelectableText(
                                                  'Fecha: ${listAgenda[index].fecha}',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12),
                                                ),
                                                Spacer(),
                                                ElevatedButton.icon(
                                                  onPressed: () {
                                                    showModalDialogWidget(
                                                        contextDialog: context,
                                                        pageDetail: AgendaSavePage(
                                                            title:
                                                                'Editar Agenda',
                                                            agendaEntity:
                                                                listAgenda[
                                                                    index]),
                                                        width: 450,
                                                        height: 530);
                                                  },
                                                  icon: Icon(Icons.edit),
                                                  label: Text('Edit'),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }
              }
              if (state is AgendaListLoading) {
                return Center(child: CircularProgressIndicator());
              }
              return Center(child: Text('Sin datos para el año actual'));
            },
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    // Limpia el nodo focus cuando se haga dispose al formulario
    myFocusNode?.dispose();

    super.dispose();
  }
}
