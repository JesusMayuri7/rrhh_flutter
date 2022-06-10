import 'package:dartz/dartz.dart';

import 'package:rrhh_clean/app/modules/subsidio/domain/i_subsidio_repository.dart';
import 'package:rrhh_clean/app/modules/subsidio/domain/subsidio_devolucion_entity.dart';
import 'package:rrhh_clean/core/domain/use_cases/usecase.dart';
import 'package:rrhh_clean/core/errors/failure.dart';

class NewSubsidioDevolucionUseCase
    implements UseCase<SubsidioDevolucionEntity, ParamsNewSubsidio> {
  final ISubsidioRepository iSubsidioRepository;

  NewSubsidioDevolucionUseCase({required this.iSubsidioRepository});

  @override
  Future<Either<Failure, SubsidioDevolucionEntity>> call(params) async {
    return await this.iSubsidioRepository.newSubsidioDevolucion(params);
  }
}

class ParamsNewSubsidio {
  int? id;
  int? anio;
  int? modalidadId;
  int? certificadoId;
  int? fuenteId;
  int? metaId;
  String? codigoPlaza;
  String? codigoSiga;
  String? dni;
  String? nombres;
  String? expediente;
  String? fechaDevengado;
  int? clasificadorId;
  double? monto;
  String? estado;
  ParamsNewSubsidio(
      {this.id,
      this.anio,
      this.modalidadId,
      this.certificadoId,
      this.fuenteId,
      this.metaId,
      this.codigoPlaza,
      this.codigoSiga,
      this.dni,
      this.nombres,
      this.expediente,
      this.fechaDevengado,
      this.clasificadorId,
      this.monto,
      this.estado});

  @override
  String toString() {
    return 'ParamsNewSubsidio(id: $id, anio: $anio, modalidadId: $modalidadId, certificadoId: $certificadoId, fuenteId: $fuenteId, metaId: $metaId, codigoPlaza: $codigoPlaza, codigoSiga: $codigoSiga, dni: $dni, nombres: $nombres, expediente: $expediente, fechaDevengado: $fechaDevengado, clasificadorId: $clasificadorId, monto: $monto, estado: $estado)';
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'anio': anio,
      'modalidadId': modalidadId,
      'certificadoId': certificadoId,
      'fuenteId': fuenteId,
      'metaId': metaId,
      'codigoPlaza': codigoPlaza,
      'codigoSiga': codigoSiga,
      'dni': dni,
      'nombres': nombres,
      'expediente': expediente,
      'fechaDevengado': fechaDevengado,
      'clasificadorId': clasificadorId,
      'monto': monto,
      'estado': estado
    };
  }

  factory ParamsNewSubsidio.fromMap(Map<String, dynamic> map) {
    return ParamsNewSubsidio(
      id: map['id'],
      anio: map['amio'],
      modalidadId: map['modalidadId'],
      certificadoId: map['certificadoId'],
      fuenteId: map['fuenteId'],
      metaId: map['metaId'],
      codigoPlaza: map['codigoPlaza'],
      codigoSiga: map['codigoSiga'],
      dni: map['dni'],
      nombres: map['nombres'],
      expediente: map['expediente'],
      fechaDevengado: map['fechaDevengado'],
      clasificadorId: map['clasificadorId'],
      monto: map['monto'],
      estado: map['estado'],
    );
  }
}
