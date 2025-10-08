/// Describes why an API call failed
class Failure {
  /// Description of what went wrong
  final String message;

  /// Category of the failure (network/server/etc.)
  final FailureType type;

  /// Optional HTTP status code returned by the API
  final int? statusCode;

  const Failure({
    required this.message,
    required this.type,
    this.statusCode,
  });
}

enum FailureType {
  /// Client cannot reach the server (timeouts, connectivity issues, etc.)
  network,

  /// Server responded with an error status
  server,

  /// Request succeeded but the body was empty
  emptyResponse,

  /// Unhandled exceptions
  unexpected,
}
