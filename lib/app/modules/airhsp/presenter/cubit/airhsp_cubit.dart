// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rrhh_clean/app/modules/airhsp/domain/use_cases/get_modalidad_use_case.dart';
import 'package:rrhh_clean/core/domain/entities/modalidad_entity.dart';

part 'airhsp_state.dart';

class AirhspCubit extends Cubit<AirhspState> {
  AirhspCubit({
    required this.getModalidadUseCase}
  ) : super(AirhspLoadedState());

  final GetModalidadUseCase getModalidadUseCase;

  loadedModalidades(String anio) async{
      emit(AirhspLoadingState());
      var result = await this.getModalidadUseCase(anio);

     emit(result.fold((l) =>  
      AirhspErrorState(modalidad: []), (r) {      
      return AirhspLoadedState(modalidad: r.data,anio: anio);
    }));
  }

}
