import 'package:flutter/material.dart';
import 'package:rrhh_clean/core/domain/entities/area_entity.dart';
import 'package:rrhh_clean/core/domain/entities/certificado_entity.dart';
import 'package:rrhh_clean/core/domain/entities/clasificador_entity.dart';
import 'package:rrhh_clean/core/domain/entities/fuente_entity.dart';
import 'package:rrhh_clean/core/domain/entities/meta_enttity.dart';

List<DropdownMenuItem<ClasificadorEntity>> buildClasificadores(
    List clasificadorModel) {
  List<DropdownMenuItem<ClasificadorEntity>> listClasificador = [];
  for (ClasificadorEntity item in clasificadorModel) {
    listClasificador.add(DropdownMenuItem(
      value: item,
      child: Text('${item.id} : ${item.dscClasificador}'),
    ));
  }
  //_clasificadorEntity = certificadoModel[0];
  return listClasificador;
}

List<DropdownMenuItem<CertificadoEntity>> buildCertificados(
    List certificadoModel) {
  List<DropdownMenuItem<CertificadoEntity>> listCertificado = [];
  for (CertificadoEntity item in certificadoModel) {
    listCertificado.add(DropdownMenuItem(
      value: item,
      child: Text('${item.id} : ${item.dscCertificado}'),
    ));
  }

  return listCertificado;
}

List<DropdownMenuItem<int>> buildMetas(List metaModel) {
  List<DropdownMenuItem<int>> listMeta = [];
  for (MetaEntity item in metaModel) {
    listMeta.add(DropdownMenuItem(
      value: item.idmetaAnual,
      child: Text('${item.idmetaAnual} : ${item.finalidad}'),
    ));
  }
  //_metaEntity = metaModel[0];
  return listMeta;
}

List<DropdownMenuItem<int>> buildAreas(List areaModel) {
  List<DropdownMenuItem<int>> listArea = [];
  for (AreaEntity item in areaModel) {
    listArea.add(DropdownMenuItem(
      value: item.orgAreaId,
      child: Text('${item.orgAreaId} : ${item.descArea}'),
    ));
  }
  //_metaEntity = metaModel[0];
  return listArea;
}

List<DropdownMenuItem<int>> buildFuentes(List fuenteModel) {
  List<DropdownMenuItem<int>> listFuente = [];
  for (FuenteEntity item in fuenteModel) {
    listFuente.add(DropdownMenuItem(
      value: item.id,
      child: Text('${item.id} : ${item.dscFuente}'),
    ));
  }

  return listFuente;
}
