class Failure {
  final String message;
  final FailureType type;
  final int? statusCode;

  const Failure({
    required this.message,
    required this.type,
    this.statusCode,
  });
}

enum FailureType {
  network,
  server,
  emptyResponse,
  unexpected,
}
