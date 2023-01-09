// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:rrhh_clean/app/modules/base_prac/domain/export_prac_use_case.dart';
import 'package:rrhh_clean/app/modules/base_prac/domain/listar_prac_use_case.dart';
import 'package:rrhh_clean/app/modules/base_prac/domain/practicante_entity.dart';
import 'package:rrhh_clean/app/modules/base_prac/domain/updated_prac_use_case.dart';
import 'package:rrhh_clean/app/modules/base_prac/presenter/alta_baja/bloc/alta_baja_prac_bloc.dart';

part 'list_prac_event.dart';
part 'list_prac_state.dart';

class ListPracBloc extends Bloc<ListarPracEvent, ListPracState> {
  final ListarPracUseCase listarPracUseCase;
  final ExportPracUseCase exportPracUseCase;
  final AltaBajaPracBloc altaBajaPracBloc;
  late StreamSubscription altaBajaSubscripcion;
  final UpdatedPracUseCase updatedPracUseCase;

  ListPracBloc({
    required this.listarPracUseCase,
    required this.exportPracUseCase,
    required this.altaBajaPracBloc,
    required this.updatedPracUseCase,
  }) : super(ListPracLoaded()) {
    this.altaBajaSubscripcion = altaBajaPracBloc.stream.listen((_state) {
      if (_state is AltaBajaPracLoaded) {
        if (state is ListPracLoaded) {
          List<PracticanteEntity> list = [];
          for (var item in (state as ListPracLoaded).listPracticanteFiltered) {
            if (item.id != _state.practicanteBajaId) list.add(item);
          }
          if (list.isEmpty)
            list.add(_state.practicanteEntity);
          else
            list.insert(0, _state.practicanteEntity);
          add(AltaBajaListEvent(
              listPracticanteFiltered: list,
              listPracticanteOriginal:
                  (state as ListPracLoaded).listPracticanteOriginal));
        }
      }
    });
    on<AltaBajaListEvent>(_onAltaBajaEventToState);
    on<ExportPracEvent>(_onExportPracEventToState);
    on<ListPracEvent>(_onListarPracEventToState);
    on<FilterPracEvent>(_onFilterPracEventToState);
    on<UpdatedPracEvent>(_onUpdatedPracEventToState);
  }

  FutureOr<void> _onExportPracEventToState(
      ExportPracEvent event, Emitter<ListPracState> emit) async {
    List<PracticanteEntity> listPracticante = [];
    if (state is ListPracLoaded) {
      listPracticante = (state as ListPracLoaded).listPracticanteOriginal;
    }
    emit(ListPracLoading());
    var result = await this.exportPracUseCase(event.paramsPracCalcular);
    emit(result.fold((l) => ErrorPracLoaded(message: l.toString()), (r) {
      return r
          ? ListPracLoaded(
              listPracticanteFiltered: listPracticante,
              listPracticanteOriginal: listPracticante)
          : ErrorPracLoaded(message: 'Error al exportar');
    }));
  }

  FutureOr<void> _onAltaBajaEventToState(
      AltaBajaListEvent event, Emitter<ListPracState> emit) async {
    emit(ListPracLoaded(
        listPracticanteFiltered: event.listPracticanteFiltered,
        listPracticanteOriginal: event.listPracticanteOriginal));
  }

  FutureOr<void> _onFilterPracEventToState(
      FilterPracEvent event, Emitter<ListPracState> emit) async {
    if (state is ListPracLoaded) {
      if (event.textFilter.isEmpty) {
        emit((state as ListPracLoaded).copyWith(
            listPracticanteFiltered:
                (state as ListPracLoaded).listPracticanteOriginal));
      } else {
        List<PracticanteEntity> listFiltered = List.from(
            (state as ListPracLoaded).listPracticanteOriginal.where((element) {
          return (element.codigoPlaza.endsWith(event.textFilter) ||
              element.nombres
                  .toUpperCase()
                  .contains(event.textFilter.toUpperCase()) ||
              element.descArea
                  .toUpperCase()
                  .contains(event.textFilter.toUpperCase()));
        }).toList());
        emit((state as ListPracLoaded)
            .copyWith(listPracticanteFiltered: listFiltered));
      }
    }
  }

  FutureOr<void> _onListarPracEventToState(
      ListPracEvent event, Emitter<ListPracState> emit) async {
    emit(ListPracLoading());
    var result = await this.listarPracUseCase(event.anio);
    emit(result.fold((l) => ErrorPracLoaded(message: l.toString()), (r) {
      return ListPracLoaded(
          listPracticanteFiltered: r, listPracticanteOriginal: r);
    }));
  }

  FutureOr<void> _onUpdatedPracEventToState(
      UpdatedPracEvent event, Emitter<ListPracState> emit) async {
    var updateLiquidacion = await this.updatedPracUseCase(UpdatedPracParams(
        campo: event.campo,
        valor: event.valor,
        practicanteId: event.practicanteId));

    emit(updateLiquidacion.fold((l) {
      return ErrorPracLoaded(message: l.toString());
    }, (r) {
      PracticanteEntity practicanteEntity = r.data;
      return ListPracLoaded(listPracticanteFiltered: [
        for (var item in (state as ListPracLoaded).listPracticanteFiltered)
          if (item.id == practicanteEntity.id)
            item.copyWith(
              metaId: practicanteEntity.metaId,
              finalidad: practicanteEntity.finalidad,
              codigoPlaza: practicanteEntity.codigoPlaza,
              dni: practicanteEntity.dni,
              fechaAlta: practicanteEntity.fechaAlta,
              fechaBaja: practicanteEntity.fechaBaja,
              detalle: practicanteEntity.detalle,
              nombres: practicanteEntity.nombres,
            )
          else
            item
      ]);
    }));
  }

  @override
  Future<void> close() {
    altaBajaSubscripcion.cancel();
    return super.close();
  }
}
