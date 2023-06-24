// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'airhsp_codigo_bloc.dart';

enum StatusCodigo {loading,loaded,error,saved}

abstract class AirhspCodigoState extends Equatable {
  const AirhspCodigoState({
    required this.codigos,
    required this.statusCodigo,
    required this.codigoSeleted,
  });

  final List<AirhspCodigo> codigos;
  final StatusCodigo statusCodigo;
  final AirhspCodigo? codigoSeleted;
}

class AirhspCodigoLoaded extends AirhspCodigoState {
  AirhspCodigoLoaded({super.codigos = const [], super.statusCodigo = StatusCodigo.loading, super.codigoSeleted = null});
  
   AirhspCodigoLoaded copyWith({
   List<AirhspCodigo>? codigos,
   StatusCodigo? statusCodigo,
   AirhspCodigo? codigoSeleted
  }) {
    return AirhspCodigoLoaded(
      codigos: codigos ?? this.codigos,
      statusCodigo: statusCodigo ?? this.statusCodigo,
      codigoSeleted: codigoSeleted ?? this.codigoSeleted
    );
  }

  @override  
  List<Object?> get props => [this.codigos,this.statusCodigo,this.codigoSeleted];
}
