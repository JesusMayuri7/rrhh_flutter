import 'package:dartz/dartz.dart';
import 'package:rrhh_clean/core/data/datasource/i_areas_datasource_app.dart';

import '../datasource/get_confianza_datasource.dart';
import '../datasource/post_confianza_datasource..dart';
import '../models/confianza_model.dart';

import '../../domain/repository/confianza_respository.dart';

import '../../../../../core/domain/entities/response_entity.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failure.dart';

class ConfianzaRepositoryImpl implements IConfianzaRepository {
  final IListConfianzaDataSource confianzaDataSource;
  final IAreasDatasourceApp areaDataSource;
  final IPostConfianzaDataSource postConfianzaDataSource;

  ConfianzaRepositoryImpl(this.confianzaDataSource, this.areaDataSource,
      this.postConfianzaDataSource);

  @override
  Future<Either<Failure, ResponseEntity>> getListConfianza(String anio) async {
    try {
      final result = await this.confianzaDataSource.getListConfianza(anio);
      return Right(result);
    } on ServerException catch (e) {
      return Left(Error(e.message));
    }
  }

  @override
  Future<Either<Failure, ResponseEntity>> getListAreas() async {
    try {
      final result = await this.areaDataSource.getAreas();
      return Right(result);
    } on ServerException catch (e) {
      return Left(Error(e.message));
    }
  }

  @override
  Future<Either<Failure, ResponseEntity>> postConfianza(
      {
      required int id,
      required String anio,
      required String cargo,
      required String detalle,
      required String direccion,
      required String dni,
      required String docCese,
      required String docDesignacion,
      required String fin,
      required String inicio,
      required String modalidad,
      required String nombres,
      required int orgAreaId,
      required String plaza,
      required String plazaOrigen,
      required String nroCap,
      required String tipo,
      required int trabajadorId,
      required String estado}) async {
    try {
      final result =
          await this.postConfianzaDataSource.postConfianza(ConfianzaModel(
                id: id,
                anio: anio,
                descArea: '',
                cargo: cargo,
                dni: dni,
                nombres: nombres,
                inicio: inicio,
                fin: fin,
                docDesignacion: docDesignacion,
                docCese: docCese,
                direccion: direccion,
                modalidad: modalidad,
                area_id: orgAreaId,
                trabajadorId: trabajadorId,
                detalle: detalle,
                tipo: tipo,
                plaza: plaza,
                plazaOrigen: plazaOrigen,
                nroCap: nroCap,
                estado: '',
              ));
      return Right(result);
    } on ServerException catch (e) {
      return Left(Error(e.message));
    }
  }
}
