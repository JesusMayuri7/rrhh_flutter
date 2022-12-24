import 'package:fluent_ui/fluent_ui.dart' as fluentUi hide Colors;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rrhh_clean/core/uitls/widgets/show_toast_dialog.dart';

import 'presenter/bloc/requerimientos_bloc.dart';
import 'presenter/list/requerimientos_list_page.dart';

class MainDocumentosPage extends StatefulWidget {
  const MainDocumentosPage({Key? key}) : super(key: key);

  @override
  State<MainDocumentosPage> createState() => _MainDocumentosPageState();
}

class _MainDocumentosPageState extends State<MainDocumentosPage> {
  final RequerimientosBloc requerimientosBloc =
      Modular.get<RequerimientosBloc>();

  @override
  void initState() {
    super.initState();
    if (requerimientosBloc.state is RequerimientosInitial) {
      this.requerimientosBloc.add(RequerimientosLoadEvent(anio: '2022'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocConsumer<RequerimientosBloc, RequerimientosState>(
          listener: (context, state) {
            if (state is RequerimientosError) {
              showToastSuccess(context, state.message);
            }
          },
          bloc: this.requerimientosBloc,
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (state is RequerimientosLoaded)
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(child: RequerimientosListPage()),
                      ],
                    ),
                  ),
                if (state is RequerimientosLoading)
                  Center(child: fluentUi.ProgressRing()),
                if (state is RequerimientosError)
                  Center(
                      child: fluentUi.FilledButton(
                    child: Text('Reintentar'),
                    onPressed: () => this
                        .requerimientosBloc
                        .add(RequerimientosLoadEvent(anio: '2022')),
                  )),
              ],
            );
          },
        ),
      ),
    );
  }
}
