// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:rrhh_clean/app/modules/airhsp/domain/repositories/i_airhsp_respository.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';
import 'package:rrhh_clean/core/domain/use_cases/usecase.dart';
import 'package:rrhh_clean/core/errors/failure.dart';

class SaveCodigoUseCase implements UseCase<ResponseModel, ParamsAirhspCodigo> {
  final IAirhspRepository repository;

  SaveCodigoUseCase(this.repository);

  @override
  Future<Either<Failure, ResponseModel>> call(ParamsAirhspCodigo paramsAirhspCodigo) async {
    return await repository.saveCodigo(paramsAirhspCodigo);
  }
}

class ParamsAirhspCodigo {
  final int id;
  final int modalidadId;  
  final String anio;
  final String codigo;
  final String descCodigo;
  final String descAbreviatura;
  final String modalidadEntrega;
  final String frecuenciaEntrega;
  final String frecuenciaMes;
  final String tipoCodigo;
  final int afecto;
  final int estado;

  ParamsAirhspCodigo({
    this.id = 0,
    required this.modalidadId,    
    required this.anio,
    required this.codigo,
    required this.descCodigo,
    required this.descAbreviatura,
    required this.modalidadEntrega,
    required this.frecuenciaEntrega,
    required this.frecuenciaMes,
    required this.tipoCodigo,
    required this.afecto,
    required this.estado,
  });

  factory ParamsAirhspCodigo.empty({required String anio,required int modalidadId}){
    return ParamsAirhspCodigo(
    id : 0,
    modalidadId :modalidadId,
    anio : anio,
    codigo : '',
    descCodigo : '',
    descAbreviatura : '',
    modalidadEntrega : 'PERMANENTE',
    frecuenciaEntrega : 'MENSUAL',
    frecuenciaMes : 'NINGUNO',
    tipoCodigo : 'INGRESO',
    afecto : 0,
    estado : 0,
    );
  }
}
