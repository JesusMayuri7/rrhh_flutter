import 'package:flutter/material.dart';
import 'package:fluent_ui/fluent_ui.dart' as f;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rrhh_clean/app/modules/judiciales/cubit/judiciales_bloc.dart';

import 'presenter/judiciales_page.dart';

class MainJudicialesPage extends StatefulWidget {
  @override
  State<MainJudicialesPage> createState() => _MainJudicialesPageState();
}

class _MainJudicialesPageState extends State<MainJudicialesPage> {
  final blocJudicial = Modular.get<JudicialesBloc>();

  @override
  void initState() {
    if (this.blocJudicial.state is JudicialesInitial) {
      this.blocJudicial.add(JudicialesLoadEvent(anio: '2022'));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocConsumer<JudicialesBloc, JudicialesState>(
                bloc: this.blocJudicial,
                listener: (context, state) {
                  print(state.toString());
                  if (state is JudicialesError)
                    f.showSnackbar(context,
                        SnackBar(content: Text('Error: ' + state.message)));
                },
                builder: (context, state) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            if (state is JudicialesLoaded)
                              Expanded(child: JudicialesPage()),
                            if (state is JudicialesError)
                              Center(child: Container(child: Text('Error'))),
                            if (state is JudicialesLoading)
                              Center(child: CircularProgressIndicator())
                          ],
                        ),
                      )
                    ],
                  );
                })));
  }
}
