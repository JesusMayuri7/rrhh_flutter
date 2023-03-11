// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:equatable/equatable.dart';

class JudicialDetailEntity extends Equatable {
   final int id;
   final int judicialId;
   final String expedientePvn;
   final String fechaExpedientePvn;
   final String nroDocumento;
   final String detalle;
   final String createdAt;
   final String updatedAt;
   
  JudicialDetailEntity({
    required this.id,
    required this.judicialId,
    required this.expedientePvn,
    required this.fechaExpedientePvn,
    required this.nroDocumento,
    required this.detalle,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object> get props {
    return [
      id,
      judicialId,
      expedientePvn,
      fechaExpedientePvn,
      nroDocumento,
      detalle,
      createdAt,
      updatedAt,
    ];
  }

  JudicialDetailEntity copyWith({
    int? id,
    int? judicialId,
    String? expedientePvn,
    String? fechaExpedientePvn,
    String? nroDocumento,
    String? detalle,
    String? createdAt,
    String? updatedAt,
  }) {
    return JudicialDetailEntity(
      id: id ?? this.id,
      judicialId: judicialId ?? this.judicialId,
      expedientePvn: expedientePvn ?? this.expedientePvn,
      fechaExpedientePvn: fechaExpedientePvn ?? this.fechaExpedientePvn,
      nroDocumento: nroDocumento ?? this.nroDocumento,
      detalle: detalle ?? this.detalle,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'judicialId': judicialId,
      'expedientePvn': expedientePvn,
      'fechaExpedientePvn': fechaExpedientePvn,
      'nroDocumento': nroDocumento,
      'detalle': detalle,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }


}
