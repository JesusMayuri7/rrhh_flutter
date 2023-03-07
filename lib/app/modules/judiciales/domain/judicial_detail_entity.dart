// ignore_for_file: public_member_api_docs, sort_constructors_first

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
  List<Object?> get props => [id,judicialId,expedientePvn,fechaExpedientePvn,nroDocumento,detalle,createdAt,updatedAt];
}
