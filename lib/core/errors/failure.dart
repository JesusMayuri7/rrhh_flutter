import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  // If the subclasses have some properties, they'll get passed to this constructor
  // so that Equatable can perform value comparison.

}

class ServerFailure extends Failure {
  final String message;

  ServerFailure(this.message);

  @override
  String toString() => message;

  @override
  List<Object?> get props => [message];
}

class CacheFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class InvalidSearchText extends Failure {
  @override
  List<Object> get props => [];
}

class EmptyList extends Failure {
  @override
  List<Object> get props => [];
}

class ErrorSearch extends Failure {
  @override
  List<Object> get props => [];
}

class DatasourceResultNull extends Failure {
  @override
  List<Object> get props => [];
}

class Error extends Failure {
  final String message;

  Error(this.message);

  @override
  String toString() => message;

  @override
  List<Object?> get props => [];
}
