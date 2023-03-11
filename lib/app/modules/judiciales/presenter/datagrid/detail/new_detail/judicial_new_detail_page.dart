// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fluent_ui/fluent_ui.dart';


import 'package:rrhh_clean/core/uitls/widgets/label_with_form_field.dart';

import '../cubit/judicial_detail_cubit.dart';

class JudicialNewDetailPage extends StatefulWidget {
  const JudicialNewDetailPage({
    Key? key,
    this.judicialId = 0,
    required this.judicialDetailCubit,
  }) : super(key: key);

  final int judicialId;
  final JudicialDetailCubit judicialDetailCubit;

  @override
  State<JudicialNewDetailPage> createState() => _JudicialNewDetailPageState();
}

class _JudicialNewDetailPageState extends State<JudicialNewDetailPage> {

  TextEditingController detalleController = TextEditingController();
  TextEditingController nroDocumentoController = TextEditingController();
  TextEditingController expedientePvnController = TextEditingController();
  TextEditingController fechaExpedientePvnController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(child: 
      Column(children: [        
        Text('Agregar seguimiento de Registro Judicial'),
        LabelWithFormField(
          keyboardType: TextInputType.text,
          maxLength: 100,
          textAlign: TextAlign.end,
          title: 'Detalle',
          hintText: 'detalle',
          textController:  detalleController),      
                LabelWithFormField(
          keyboardType: TextInputType.text,
          maxLength: 100,
          textAlign: TextAlign.end,
          title: 'N° Expediente',
          hintText: 'N° Expediente',
          textController:  expedientePvnController),      
                  LabelWithFormField(
          keyboardType: TextInputType.text,
          maxLength: 100,
          textAlign: TextAlign.end,
          title: 'Fecha Expediente',
          hintText: 'fecha exp.',
          textController:  fechaExpedientePvnController), 
                LabelWithFormField(
          keyboardType: TextInputType.text,
          maxLength: 100,
          textAlign: TextAlign.end,
          title: 'N° Documento',
          hintText: 'N° Documento',
          textController:  nroDocumentoController),
          SizedBox(height: 10),
          Button(child: Text('Guardar'), onPressed: () {            
            this.widget.judicialDetailCubit.add(JudicialNewDetailEvent(detalle: this.detalleController.text,
            expedientePvn: this.expedientePvnController.text,fechaExpedientePvn: this.fechaExpedientePvnController.text,
            nroDocumento: this.nroDocumentoController.text,judicialId: this.widget.judicialId));
          })        
      ],)),
    );
  }
}