import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rrhh_clean/app/app_service.dart';
import 'package:rrhh_clean/core/uitls/widgets/show_toast_dialog.dart';

import 'bloc/parameter_cap_bloc.dart';

class ParameterCapPage extends StatelessWidget {
  ParameterCapPage({Key? key}) : super(key: key);

  final blocParameter = Modular.get<ParameterCapBloc>();
  final List<TextEditingController>? _controller = [];
  final String? anioSelected = Modular.get<AppService>().sessionEntity!.anio;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: BlocConsumer<ParameterCapBloc, ParameterCapState>(
          listener: (context, state) {
            if (state is CapLoadedState) {
              if (state.statusCap == StatusCap.error)
                showToastError(context, state.toString());
            }
          },
          bloc: this.blocParameter,
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildButtonsParameters(),
                if (state is CapLoadedState) _buildListParameters(state),
                if (state is CapLoadedState &&
                    state.statusCap == StatusCap.parameterLoading)
                  CircularProgressIndicator()
              ],
            );

            //return CircularProgressIndicator();
          }),
    );
  }

  Row _buildButtonsParameters() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ElevatedButton(
            onPressed: () => this
                .blocParameter
                .add(LoadParameterEvent(anio: this.anioSelected!)),
            child: Text("Parametros"),
          ),
          ElevatedButton(onPressed: null, child: Text('Calcular')),
          SizedBox(width: 10),
        ]);
  }

  Expanded _buildListParameters(CapLoadedState state) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: ListView.builder(
          itemCount: state.parameterBaseCap.length,
          itemBuilder: (context, index) {
            _controller?.add(TextEditingController(
                text: state.parameterBaseCap[index].valor.toString()));
            return Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      '${state.parameterBaseCap[index].abreviatura}',
                      style: TextStyle(fontSize: 11),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      style: TextStyle(fontSize: 11),
                      textAlign: TextAlign.end,
                      controller: _controller?[index],
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        //isCollapsed: true,
                        isDense: true,
                        hintText: '',
                        contentPadding:
                            EdgeInsets.only(left: 2, top: 12, bottom: 0),
                        counterText: "",
                        errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        errorStyle: TextStyle(height: 0, fontSize: 10),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      '${state.parameterBaseCap[index].frecuencia.substring(0, 3)}',
                      style: TextStyle(fontSize: 11),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      '${state.parameterBaseCap[index].modalidadEntrega}',
                      style: TextStyle(fontSize: 11),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
