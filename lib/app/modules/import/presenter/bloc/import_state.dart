part of 'import_bloc.dart';

abstract class ImportState extends Equatable {
  const ImportState();

  @override
  List<Object> get props => [];
}

class ImportInitial extends ImportState {}

class ImportLoaded extends ImportState {
  final List<List<Object>> list;
  ImportLoaded({
    required this.list,
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
