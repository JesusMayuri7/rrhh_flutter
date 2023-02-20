// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:rrhh_clean/app/modules/agenda/agenda_entity.dart';
import 'package:rrhh_clean/app/modules/agenda/cubit/agenda_params.dart';
import 'package:rrhh_clean/core/uitls/widgets/label_with_form_field_initial.dart';

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
  final _formKey = GlobalKey<FormState>();
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
    return BlocConsumer<AgendaListCubit, AgendaListState>(
      listener: (context, state) {
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
                LabelWithFormFieldInitial(
                  initialValue: agendaParams!.titulo,
                  maxLength: 100,
                  textAlign: TextAlign.left,
                  title: 'Titulo',
                  keyboardType: TextInputType.text,
                  onSaved: (value) {
                    agendaParams!.titulo = value!;
                  },
                ),
                SizedBox(height: 5),
                LabelWithFormFieldInitial(
                  initialValue: agendaParams!.texto,
                  maxLines: 8,
                  maxLength: 800,
                  textAlign: TextAlign.left,
                  title: 'Texto',
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  onSaved: (value) {
                    agendaParams!.texto = value!;
                  },
                ),
                SizedBox(height: 5),
                LabelWithFormFieldInitial(
                    initialValue: agendaParams!.fecha,
                    maxLength: 50,
                    textAlign: TextAlign.left,
                    title: 'Fecha',
                    keyboardType: TextInputType.text,
                    onSaved: (value) {
                      agendaParams!.fecha = value!;
                    }),
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
    );
  }
}
