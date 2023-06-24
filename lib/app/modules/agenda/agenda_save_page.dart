// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:rrhh_clean/app/modules/agenda/agenda_entity.dart';
import 'package:rrhh_clean/app/modules/agenda/cubit/agenda_params.dart';
import 'package:rrhh_clean/core/uitls/constants/constants.dart';
import 'package:rrhh_clean/core/uitls/widgets/show_toast_dialog.dart';

import 'cubit/agenda_list_cubit.dart';

class AgendaSavePage extends StatefulWidget {
  final AgendaEntity? agendaEntity;
  final String title;

  AgendaSavePage({
    Key? key,
    this.agendaEntity,
    required this.title,
  }) : super(key: key);

  @override
  State<AgendaSavePage> createState() => _AgendaSavePageState();
}

class _AgendaSavePageState extends State<AgendaSavePage> {
  AgendaParams? agendaParams;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final blocListAgenda = Modular.get<AgendaListCubit>();

  @override
  void initState() {
    if (widget.agendaEntity == null) {
      agendaParams = AgendaParams(titulo: '', texto: '', fecha: '');
    } else {
      agendaParams = AgendaParams(
          idtodo: widget.agendaEntity!.idtodo,
          titulo: widget.agendaEntity!.titulo,
          texto: widget.agendaEntity!.texto,
          fecha: widget.agendaEntity!.fecha);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      content: BlocConsumer<AgendaListCubit, AgendaListState>(
        listener: (context, state) {
          if ((state is AgendaListError)) {
            showToastError(context, state.message);
          }
          if ((state is AgendaListLoaded)) {
            Navigator.pop(context);
          }
        },
        bloc: this.blocListAgenda,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                children: [
                  Container(child: Text(widget.title)),
                  SizedBox(height: 10),
                  InfoLabel(
                    label: 'Ingrese el título:',
                    child: TextFormBox(
                        placeholder: 'Título',
                        expands: false,
                        initialValue: agendaParams!.titulo,
                        onSaved: (value) => agendaParams!.titulo = value!),
                  ),
                  SizedBox(height: 10),
                  InfoLabel(
                    label: 'Ingrese la descricpion:',
                    child: TextFormBox(
                        placeholder: 'Descripcion',
                        expands: false,
                        initialValue: agendaParams!.texto,
                        maxLines: 13,
                        onSaved: (value) => agendaParams!.texto = value!),
                  ),
                  SizedBox(height: 10),
                  InfoLabel(
                    label: 'Ingrese la fecha:',
                    child: TextFormBox(
                        placeholder: 'Fecha',
                        maxLength: 10,
                        expands: false,
                        initialValue: agendaParams!.fecha,
                        inputFormatters: [dateLongInputFormatter],
                        onSaved: (value) => agendaParams!.fecha = value!),
                  ),
                  Spacer(),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          this.blocListAgenda.save(agendaParams!);
                        }
                      },
                      child: Text('Guardar')),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
