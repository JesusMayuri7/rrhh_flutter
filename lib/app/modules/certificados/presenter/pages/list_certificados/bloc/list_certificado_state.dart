import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

import 'package:rrhh_clean/app/modules/certificados/domain/entities/certificado_entity.dart';

@immutable
abstract class ListCertificadoState extends Equatable {
  const ListCertificadoState();
}

class InitialListCertificadoState extends ListCertificadoState {
  @override
  List<Object?> get props => [];
}

class LoadingListCertificadoState extends ListCertificadoState {
  @override
  List<Object?> get props => [];
}

class ListDataAllState extends ListCertificadoState {
  final List<Object> listado;

  ListDataAllState(this.listado);
  @override
  List<Object?> get props => [listado];
}

class LoadedListCertificadoState extends ListCertificadoState {
  final List<CertificadoEntity> listCertificadoOri; //state previous
  final List<CertificadoEntity> listCertificadoCur; // estado current
  final double totalCertificado;
  final double totalDevengado;
  final double totalSaldo;

  LoadedListCertificadoState copyWidth(
          {List<CertificadoEntity>? listCertificadoOri,
          List<CertificadoEntity>? listCertificadoCur,
          double? totalCertificado,
          double? totalDevengado,
          double? totalSaldo}) =>
      LoadedListCertificadoState(
          listCertificadoCur: listCertificadoCur ?? this.listCertificadoCur,
          listCertificadoOri: listCertificadoOri ?? this.listCertificadoOri,
          totalCertificado: totalCertificado ?? this.totalCertificado,
          totalDevengado: totalDevengado ?? this.totalDevengado,
          totalSaldo: totalSaldo ?? this.totalSaldo);

  LoadedListCertificadoState(
      {this.listCertificadoCur = const [],
      this.listCertificadoOri = const [],
      this.totalCertificado = 0,
      this.totalDevengado = 0,
      this.totalSaldo = 0});

  @override
  List<Object> get props => [
        this.listCertificadoCur,
        this.listCertificadoOri,
        this.totalCertificado,
        this.totalDevengado,
        this.totalSaldo
      ];
}
