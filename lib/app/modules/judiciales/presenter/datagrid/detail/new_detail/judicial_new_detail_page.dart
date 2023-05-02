// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rrhh_clean/app/modules/judiciales/domain/new_judicial_detail_use_case.dart';

import 'package:rrhh_clean/core/uitls/widgets/label_with_form_field.dart';
import 'package:rrhh_clean/core/uitls/widgets/label_with_form_field_initial.dart';

import '../cubit/judicial_detail_cubit.dart';

class JudicialNewDetailPage extends StatefulWidget {
  JudicialNewDetailPage({
    Key? key,
    required this.paramsNewJudicialDetail,
  }) : super(key: key);

  ParamsNewJudicialDetail? paramsNewJudicialDetail;

  @override
  State<JudicialNewDetailPage> createState() => _JudicialNewDetailPageState();
}

class _JudicialNewDetailPageState extends State<JudicialNewDetailPage> {


  @override
  void initState() {    
    super.initState();    
  }

  JudicialDetailCubit judicialDetailCubit = Modular.get<JudicialDetailCubit>();

  TextEditingController detalleController = TextEditingController();
  TextEditingController nroDocumentoController = TextEditingController();
  TextEditingController expedientePvnController = TextEditingController();
  TextEditingController fechaExpedientePvnController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        child: Column(
          children: [
          Text('Agregar seguimiento de Registro Judicial'),
          LabelWithFormFieldInitial(
              keyboardType: TextInputType.text,
              maxLength: 100,
              maxLines: 1,
              textAlign: TextAlign.end,
              title: 'Detalle',
              hintText: 'detalle',
              initialValue: this.widget.paramsNewJudicialDetail!.detalle!),
          LabelWithFormFieldInitial(
              keyboardType: TextInputType.text,
              maxLength: 100,
              maxLines: 1,
              textAlign: TextAlign.end,
              title: 'N° Expediente',
              hintText: 'N° Expediente',
              initialValue:
                  this.widget.paramsNewJudicialDetail!.expedientePvn!),
          LabelWithFormFieldInitial(
              keyboardType: TextInputType.text,
              maxLength: 100,
              maxLines: 1,
              textAlign: TextAlign.end,
              title: 'Fecha Expediente',
              hintText: 'fecha exp.',
              initialValue:
                  this.widget.paramsNewJudicialDetail!.fechaExpedientePvn!),
          LabelWithFormFieldInitial(
              keyboardType: TextInputType.text,
              maxLength: 100,
              maxLines: 1,
              textAlign: TextAlign.end,
              title: 'N° Documento',
              hintText: 'N° Documento',
              initialValue: this.widget.paramsNewJudicialDetail!.nroDocumento!),
          SizedBox(height: 10),
          Button(
              child: Text('Guardar'),
              onPressed: () {
                this.judicialDetailCubit.add(JudicialNewDetailEvent(
                    paramsNewJudicialDetail:
                        this.widget.paramsNewJudicialDetail!));
              })
        ],
      )),
    );
  }
}
