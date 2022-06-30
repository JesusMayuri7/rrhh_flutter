import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rrhh_clean/app/modules/airhsp/presenter/bloc/air_bloc/airhsp_bloc.dart';
import 'package:rrhh_clean/app/modules/airhsp/presenter/bloc/conceptos_bloc/conceptos_bloc.dart';

import 'widgets/text_field_search.dart';
import '../conceptos/conceptos_page.dart';
import '../conceptos/item_concepto_widget.dart';

import '../widgets/text_field_total_plaza.dart';

import 'widgets/lista_widget.dart';

class AirhspPage extends StatefulWidget {
  final String tipoPersona;
  const AirhspPage({required this.tipoPersona}) : super(); //

  @override
  _AirhspPageState createState() => _AirhspPageState();
}

class _AirhspPageState extends State<AirhspPage>
    with AutomaticKeepAliveClientMixin {
  final bloc = Modular.get<AirhspBloc>();
  final blocConcepto = Modular.get<ConceptosBloc>();
  //final blocStart = Modular.get<StartBloc>();
  final _controller = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    this
        .bloc
        .add(ListarEvent(ejecutora: '1078', tipoPersona: widget.tipoPersona));
    this._focusNode.addListener(() {
      if (this._focusNode.hasFocus) {
        this._controller.selection = TextSelection(
            baseOffset: 0, extentOffset: this._controller.text.length);
      }
    });
    // listar();
  }

  @override
  dispose() {
    bloc.close();
    super.dispose();
  }

/*   listar() {
    this
        .bloc
        .add(ListarEvent(ejecutora: '1078', tipoPersona: widget.tipoPersona));
    //bloc.add(SelectedItemEvent(ejecutora: '1078',codPlaza: '000411', tipoPersona: widget.tipoPersona));
  } */

  Widget screenConceptos(
      {required String codPlaza,
      required String nombres,
      required String tipoPersona}) {
    print('entrando conceptos');
    return Expanded(
      child: ConceptosPage(
          codPlaza: codPlaza, nombres: nombres, tipoPersona: tipoPersona),
    );
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    /*return BlocConsumer<AirhspBloc, AirhspState>(
        listener: (context, _state) {
          print('listener ' + _state.runtimeType.toString());
          if (_state is ErrorAirhspState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.black,
                content: Text(_state.message),
              ),
            );
          }
        },
        bloc: this.bloc,
        builder: (context, state) {*/

    return BlocListener<AirhspBloc, AirhspState>(
      bloc: this.bloc,
      listener: (context, state) {
        if (state is ErrorAirhspState) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.black,
              content: Text(state.message),
            ),
          );
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BlocBuilder<AirhspBloc, AirhspState>(
            bloc: this.bloc,
            builder: (context, state) {
              return Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                    /*   ElevatedButton(
                      onPressed: () {
                        this.bloc.add(SelectedItemEvent(
                            ejecutora: '1078',
                            codPlaza: '000003',
                            tipoPersona: '1',
                            nombres: 'NOMBRES'));
                      },
                      child: Text('hola')),*/
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Expanded(
                          child: TextFieldSearch(
                              controller: this._controller,
                              focusNode: this._focusNode,
                              search: (value) => {
                                    this.bloc.add(SearchEvent(criterio: value)),
                                  })),
                      TextFieldTotalPlazas(bloc.totalPlazas),
                      ElevatedButton.icon(
                        onPressed: () {
                          this.bloc.add(DownloadFileEvent(
                              tipoPersona: widget.tipoPersona));
                        },
                        icon: Icon(
                          Icons.download,
                          size: 22.0,
                        ),
                        label: Text('Descargar'),
                      ),
                    ]),
                    Expanded(
                      child: Column(children: [
                        if (state is LoadingAirhspState)
                          Expanded(
                              child:
                                  Center(child: CircularProgressIndicator())),
                        if (state is LoadedAirhspState)
                          ListaPage(this.blocConcepto, state.listado,
                              widget.tipoPersona, ValueKey(widget.tipoPersona)),
                      ]),
                    ),
                  ]));
            },
          ),

          /*  BlocBuilder<AirhspBloc, AirhspState>(
                bloc: this.bloc,
                builder: (context, _state) {
                  return Expanded(
                    child: Column(
                      children: [
                        if (_state is LoadingAirhspState)
                          Expanded(
                              child: Center(child: CircularProgressIndicator())),
                        if (_state is LoadedAirhspState)
                          itemConceptoPage(_state.conceptos, '00000', 'NOMBRES')
                      ],
                    ),
                  );
                })
    
                */

          BlocBuilder<ConceptosBloc, ConceptosState>(
              bloc: this.blocConcepto,
              builder: (context, _state) {
                print('estados conceptos $_state');
                return Expanded(
                  child: Column(
                    children: [
                      if (_state is ConceptosLoadingState)
                        Expanded(
                            child: Center(child: CircularProgressIndicator())),
                      if (_state is ConceptosLoadedState)
                        ItemConceptoPage(
                            conceptos: _state.conceptos,
                            codPlaza: '00000',
                            nombres: 'NOMBRES')
                    ],
                  ),
                );
              })
        ],
      ),
    );
  }
}
