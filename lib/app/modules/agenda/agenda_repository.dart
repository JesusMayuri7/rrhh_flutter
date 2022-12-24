// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:rrhh_clean/app/modules/agenda/agenda_list_datasource.dart';
import 'package:rrhh_clean/app/modules/agenda/cubit/agenda_params.dart';
import 'package:rrhh_clean/core/data/models/response_model.dart';
import 'package:rrhh_clean/core/errors/exceptions.dart';
import 'package:rrhh_clean/core/errors/failure.dart';

import 'agenda_save_datasource.dart';

abstract class IAgendaRepository {
  Future<Either<Failure, ResponseModel>> listarAgenda();
  Future<Either<Failure, ResponseModel>> saveAgenda(AgendaParams params);
}

class AgendaRepositoryImpl implements IAgendaRepository {
  final IAgendaListDatasource iAgendaListDatasource;
  final IAgendaSaveDatasource iAgendaSaveDatasource;
  AgendaRepositoryImpl({
    required this.iAgendaListDatasource,
    required this.iAgendaSaveDatasource,
  });

  @override
  Future<Either<Failure, ResponseModel>> listarAgenda() async {
    ResponseModel list;
    try {
      list = await this.iAgendaListDatasource.listarAgenda();
      return Right(list);
    } on ServerException catch (e) {
      return Left(Error(e.message));
    }
  }

  @override
  Future<Either<Failure, ResponseModel>> saveAgenda(AgendaParams params) async {
    ResponseModel response;
    try {
      response = await this.iAgendaSaveDatasource.saveAgenda(params);
      return Right(response);
    } on ServerException catch (e) {
      return Left(Error(e.message));
    }
  }
}
