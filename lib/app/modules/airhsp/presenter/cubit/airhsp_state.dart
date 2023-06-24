// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'airhsp_cubit.dart';

abstract class AirhspState extends Equatable {
  AirhspState({
    required this.modalidad,
    required this.anio
  }
  );

  final List<ModalidadEntity> modalidad;
  final String anio;

  @override
  List<Object> get props => [];
}

class AirhspLoadedState extends AirhspState {
  AirhspLoadedState({super.modalidad = const [], super.anio = ''}) ;
}

class AirhspLoadingState extends AirhspState {
  AirhspLoadingState({super.modalidad = const [], super.anio = ''});
}

class AirhspErrorState extends AirhspState {
  AirhspErrorState({super.modalidad = const [], super.anio = ''});
}
