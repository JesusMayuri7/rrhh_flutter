import 'package:flutter/material.dart';
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

List<DropdownMenuItem<MetaEntity>> buildMetas(List metaModel) {
  List<DropdownMenuItem<MetaEntity>> listMeta = [];
  for (MetaEntity item in metaModel) {
    listMeta.add(DropdownMenuItem(
      value: item,
      child: Text('${item.idmetaAnual} : ${item.finalidad}'),
    ));
  }
  //_metaEntity = metaModel[0];
  return listMeta;
}

List<DropdownMenuItem<FuenteEntity>> buildFuentes(List fuenteModel) {
  List<DropdownMenuItem<FuenteEntity>> listFuente = [];
  for (FuenteEntity item in fuenteModel) {
    listFuente.add(DropdownMenuItem(
      value: item,
      child: Text('${item.id} : ${item.dscFuente}'),
    ));
  }
  //_fuenteFinanciamientoEntity = fuenteModel[0];
  return listFuente;
}
