class ResultEntity {
  ResultEntity(
      {required this.status, required this.message, required this.data});

  final int status;
  final String message;
  final dynamic data;
}
