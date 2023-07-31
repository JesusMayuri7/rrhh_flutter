import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:rrhh_clean/app/modules/airhsp/presenter/pages/codigo/airhsp_list_codigo_page.dart';
import '../cubit/airhsp_cubit.dart';
import 'codigo/airhsp_codigo_detalle_page.dart';

class MainCodigoPage extends StatelessWidget {
 MainCodigoPage(){
  this.blocAirhsp.loadedModalidades('2023');
 }
 final blocAirhsp = Modular.get<AirhspCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AirhspCubit, AirhspState>(
      bloc: this.blocAirhsp,
      builder: (context, state) {
        if(state is AirhspLoadedState)
        {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 7, child: AirhspListCodigoPage()),
              Expanded(
                  flex: 3,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: AirhspCodigoDetalle(modalidades: state.modalidad,airhspCodigo: null,),
                  ))
            ]);
        }
        if(state is AirhspLoadingState)
          return Center(child: CircularProgressIndicator());
        else
          return Container(child: Text('Error al cargar datos'));
      },
    );
  }
}
