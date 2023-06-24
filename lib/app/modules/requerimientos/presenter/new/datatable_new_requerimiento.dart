// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fluent_ui/fluent_ui.dart' as fluentUi;
import 'package:flutter/material.dart';
import 'bloc/requerimiento_new_bloc.dart';

class DataTableNewRequerimiento extends fluentUi.StatefulWidget {

  final List<NewParamsRequerimientoDetalle> requerimientoDetalle;
  final RequerimientoNewBloc requerimientoNewBloc;

  const DataTableNewRequerimiento({
    Key? key,
    required this.requerimientoDetalle,
    required this.requerimientoNewBloc,
  }) : super(key: key);

  @override
  fluentUi.State<DataTableNewRequerimiento> createState() => _DataTableNewRequerimientoState();
}

class _DataTableNewRequerimientoState extends fluentUi.State<DataTableNewRequerimiento> {
  @override
  Widget build(BuildContext context) {        

    return SingleChildScrollView(
      child: DataTable(
        columnSpacing: 5,
          horizontalMargin: 0,
          columns: [
          DataColumn(
          label: Container(
                alignment: Alignment.center,
                width: 70,
                child: Text('Fuente')),
          numeric: true,          
       ),
              DataColumn(
                
          label: Container(
            alignment: Alignment.center,
             width: 200,
            child: Text("Meta")),
          numeric: false,
         ),
       DataColumn(
          label: Container(
            alignment: Alignment.center,
             width: 200,
            child: Text("Area")),
          numeric: false,
         ),

               DataColumn(
          label: Container(
            alignment: Alignment.center,
             width: 70,
            child: Text("Cant.")),
          numeric: true,
       ),
         DataColumn(
          label: Container(
            alignment: Alignment.center,
             width: 250,
            child: Text("Cargo")),
          numeric: false,
         ),
         DataColumn(
          label: Container(
            alignment: Alignment.center,
             width: 70,
            child: Text("Monto")),
          numeric: true,
         ),
                  DataColumn(                     
          label: Container(
            alignment: Alignment.center,
            width: 70,
            child: Text("Accion")),
          numeric: false,
         ),
       ],
       rows:widget.requerimientoDetalle
    .map(
      (detalle) => DataRow(
          //selected: selectedAvengers.contains(avenger),
          cells: [
              DataCell(
              fluentUi.Container(
                alignment: Alignment.centerLeft,
                child: Text(detalle.descFuente)),
            ),
              DataCell(
              Text(detalle.descArea),
            ),
                          DataCell(
              Text(detalle.descMeta),
            ),
                        DataCell(                                        
              fluentUi.Container(
                alignment: Alignment.center,
                child: Text(detalle.cantidad.toString())),             
            ),
            DataCell(
              Text(detalle.cargo),
            ),
              DataCell(
              Text(detalle.monto.toString()),
            ),
             DataCell(
              fluentUi.Button(child: Container(
                alignment: Alignment.center,
                color: Colors.red,
                child: Text('Del',style: TextStyle(color: Colors.white),)),
              onPressed: () {
                //this.requerimientoNewBloc.add(DelRequerimientoDetalleEvent(deleteItemRequerimiento: detalle.id));
              })),            
          ]),
    )
    .toList(),
                                              ),
    );
  }
}
