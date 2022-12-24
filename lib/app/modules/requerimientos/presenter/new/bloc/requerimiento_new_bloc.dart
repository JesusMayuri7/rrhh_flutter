// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:rrhh_clean/core/domain/entities/area_entity.dart';
import 'package:rrhh_clean/core/domain/entities/fuente_entity.dart';
import 'package:rrhh_clean/core/domain/entities/meta_enttity.dart';
import 'package:rrhh_clean/core/domain/entities/modalidad_entity.dart';

part 'requerimiento_new_event.dart';
part 'requerimiento_new_state.dart';

class RequerimientoNewBloc
    extends Bloc<RequerimientoNewEvent, RequerimientoNewState> {
  RequerimientoNewBloc() : super(RequerimientoNewInitial()) {
    on<RequerimientoNewEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

class NewParamsRequerimiento {
  int id = 0;
  String anio;
  String? expedientePvn;
  String? documentoPvn;
  String? fechaDocumento;
  AreaEntity? orgArea;
  MetaEntity? meta;
  FuenteEntity? fuente;
  ModalidadEntity? modalidad;

  NewParamsRequerimiento({
    required this.anio,
    this.expedientePvn = '',
    this.documentoPvn = '',
    this.fechaDocumento = '',
    this.orgArea,
    this.meta,
    this.fuente,
    this.modalidad,
  });

  @override
  String toString() {
    return 'NewParamsRequerimiento(id: $id, anio: $anio, expedientePvn: $expedientePvn, documentoPvn: $documentoPvn, fechaDocumento: $fechaDocumento, orgArea: $orgArea, meta: $meta, fuente: $fuente, modalidad: $modalidad)';
  }
}
