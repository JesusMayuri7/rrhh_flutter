part of 'import_bloc.dart';

abstract class ImportState extends Equatable {
  const ImportState();

  @override
  List<Object> get props => [];
}

class ImportInitial extends ImportState {}

class ImportFileLoading extends ImportState {}

class ImportListLoaded extends ImportState {
  final List<List<Object>> list;
  ImportListLoaded({
    required this.list,
  });
}

class ImportFileLoaded extends ImportState {
  final String message;
  ImportFileLoaded({
    required this.message,
  });
}

class ImportLoadError extends ImportState {
  final String message;
  ImportLoadError({
    required this.message,
  });
}

class ImportLoadedDocumento extends ImportState {
  final List<List<Object>> list;
  ImportLoadedDocumento({
    required this.list,
  });
}
