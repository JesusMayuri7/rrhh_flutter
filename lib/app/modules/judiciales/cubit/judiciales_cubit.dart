/* // ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:rrhh_clean/core/domain/entities/area_entity.dart';
import 'package:rrhh_clean/core/domain/entities/fuente_entity.dart';
import 'package:rrhh_clean/core/domain/entities/meta_enttity.dart';

import '../domain/get_judiciales_initial_usecase.dart';

//part 'judiciales_state.dart';

class JudicialesCubit extends Cubit<JudicialesState> {
  JudicialesCubit({required this.getJudicialesInitialUseCase})
      : super(JudicialesInitial());

  final GetJudicialesInitialUseCase getJudicialesInitialUseCase;

  void getInitial(String anio) async {
    var result = await this.getJudicialesInitialUseCase(anio);
    emit(result.fold(
        (l) => JudicialesError(),
        (r) => JudicialesLoaded(
            areas: r[0].data, metas: r[1].data, fuentes: r[2].data)));
  }
}
 */