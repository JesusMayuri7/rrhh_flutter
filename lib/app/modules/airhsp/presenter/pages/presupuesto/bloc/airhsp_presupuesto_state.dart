// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'airhsp_presupuesto_bloc.dart';

sealed class AirshpPresupuestoState extends Equatable {  
     T when<T>({  
     required T Function() init,
     T Function(AirhspPresupuestoLoading state)? loading,
     T Function(AirhspPresupuestoExported state)? exported,
     T Function(AirhspPresupuestoLoadedExt state)? exportedExt,
     T Function(AirhspPresupuestoLoaded state)? loaded,
     T Function(AirhspPresupuestoError state)? error,
  }) {
    return switch (this) {
    AirhspPresupuestoInit() => init(),  
    AirhspPresupuestoLoading s => loading?.call(s) ?? init(),
    AirhspPresupuestoExported s => exported?.call(s) ?? init(),
    AirhspPresupuestoLoadedExt s => exportedExt?.call(s) ?? init(),
    AirhspPresupuestoLoaded s => loaded?.call(s) ?? init(),
    AirhspPresupuestoError s => error?.call(s) ?? init(),
    };
  }
}

class AirhspPresupuestoInit extends AirshpPresupuestoState {
  @override
  List<Object> get props => [];
}

class AirhspPresupuestoLoading extends AirshpPresupuestoState {
  @override
  List<Object> get props => [];
}



class AirhspPresupuestoExported extends AirshpPresupuestoState {
  @override
  List<Object> get props => [];
}

class AirhspPresupuestoLoadedExt extends AirshpPresupuestoState {
  final List<AirhspExtEntity> listAirhspExtEntity;  
  
  AirhspPresupuestoLoadedExt({
    this.listAirhspExtEntity = const [],
  
  });

  @override
  List<Object> get props => [this.listAirhspExtEntity];

  AirhspPresupuestoLoadedExt copyWith({
    List<AirhspExtEntity>? listAirhspExtEntity,
    bool? cts,
    bool? gratificacion,
    bool? bonificacion,
  }) {
    return AirhspPresupuestoLoadedExt(
      listAirhspExtEntity: listAirhspExtEntity ?? this.listAirhspExtEntity,      
    );
  }
}

class AirhspPresupuestoLoaded extends AirshpPresupuestoState {
  final List<AirhspPresupuestoEntity> listPracticanteFiltered;  
      final bool cts;
  final bool gratificacion;
  final bool bonificacion;

  AirhspPresupuestoLoaded({
    this.listPracticanteFiltered = const [],
    required this.cts,
    required this.gratificacion,
    required this.bonificacion,
  });

  @override
  List<Object> get props => [this.listPracticanteFiltered,this.cts,this.gratificacion,this.bonificacion];

  AirhspPresupuestoLoaded copyWith({
    List<AirhspPresupuestoEntity>? listPracticanteFiltered,
    bool? cts,
    bool? gratificacion,
    bool? bonificacion,
  }) {
    return AirhspPresupuestoLoaded(
      listPracticanteFiltered: listPracticanteFiltered ?? this.listPracticanteFiltered,
      cts: cts ?? this.cts,
      gratificacion: gratificacion ?? this.gratificacion,
      bonificacion: bonificacion ?? this.bonificacion,
    );
  }
}

class AirhspPresupuestoError extends AirshpPresupuestoState {

  final String message;

  AirhspPresupuestoError({
    required this.message,
  });

  @override
  List<Object> get props => [this.message];
}
