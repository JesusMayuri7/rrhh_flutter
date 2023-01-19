import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rrhh_clean/app/modules/agenda/agenda_save_page.dart';
import 'package:rrhh_clean/app/modules/agenda/agenda_entity.dart';
import 'package:rrhh_clean/app/modules/agenda/cubit/agenda_list_cubit.dart';
import 'package:rrhh_clean/core/uitls/widgets/show_dialog_widget.dart';

import '../auth/presenter/bloc/auth_bloc.dart';

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
  final blocListAgenda = Modular.get<AgendaListCubit>();
  final blocAuth = Modular.get<AuthBloc>().state as SuccessAuthState;
  List<AgendaEntity> listAgenda = [];
  final int crossAxisCount = 3;

  @override
  void initState() {
    if (this.blocListAgenda.state is AgendaListInitial) {
      this.blocListAgenda.loaded(blocAuth.loginResponseEntity.anio);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                    this
                        .blocListAgenda
                        .loaded(blocAuth.loginResponseEntity.anio);
                  },
                  child: Text('Actualizar')),
              Spacer(),
              ElevatedButton(
                  onPressed: () {
                    showModalDialogWidget(
                        contextDialog: context,
                        pageDetail: AgendaSavePage(title: 'Nueva Agenda'),
                        width: 350,
                        height: 300);
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
                  final rowSizes = listAgenda.length>=4? List.generate(
                      listAgenda.length  ~/ crossAxisCount, (_) => auto) : [auto];
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
                                      color: Colors.grey[200],
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
                                              child: Text(
                                                  '${listAgenda[index].titulo}',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 13)),
                                            ),
                                            SizedBox(height: 5),
                                            Container(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
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
                                                Text(
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
              return Center(child: Text('Sin datos para el año actual'));
            },
          ),
        ),
      ],
    );
  }
}
