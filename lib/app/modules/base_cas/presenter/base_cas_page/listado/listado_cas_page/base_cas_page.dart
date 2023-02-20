//import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rrhh_clean/core/uitls/widgets/show_toast_dialog.dart';

import 'listado_cas_page.dart';
import 'parameters_page/bloc/headparameters_bloc.dart';
import 'parameters_page/parameters_page.dart';


//import 'package:pluto_grid/pluto_grid.dart';
//import 'package:pluto_grid/pluto_grid.dart';

//import 'my_data.dart';

class BaseCasPage extends StatefulWidget {
  BaseCasPage() : super();

  @override
  _BaseCasPageState createState() => _BaseCasPageState();
}

class _BaseCasPageState extends State<BaseCasPage> //with AfterLayoutMixin
{
  final bloc = Modular.get<HeadParametersBloc>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: 
      Column(children: [
        ParametersPage(),        
         BlocConsumer<HeadParametersBloc, HeadParametersState>(
            listener: (context, state) {
              if (state is HeadParametersSuccessState &&
                  state.status == StatusCas.failure) {
                 showToastError(context,state.message);                  
              }
            },
            bloc: this.bloc,
            builder: (context, state) { 
            //  Container(color: Colors.amber)
               if (state is HeadParametersSuccessState &&
                  (state.status == StatusCas.loadedList ||
                      state.status == StatusCas.exportingList))
                return ListadoCasPage(
                    listadoCas: state.listadoCas);
              if (state is HeadParametersSuccessState &&
                  (state.status == StatusCas.loadingList))
                return Center(child: CircularProgressIndicator());
              return ListadoCasPage(listadoCas: []); 
            })
      ]),
    );
  }
}
