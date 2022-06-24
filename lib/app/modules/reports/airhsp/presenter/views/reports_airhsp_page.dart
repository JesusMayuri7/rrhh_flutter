import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rrhh_clean/app/modules/reports/airhsp/presenter/cubit/reports_airhsp_cubit.dart';

class ReportsAirhsPage extends StatelessWidget {
  ReportsAirhsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Modular.get<ReportsAirhspCubit>();
    return ElevatedButton(
        child: Text('Download'), onPressed: () => bloc.getDownloadFile());
  }
}
