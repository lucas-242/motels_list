abstract class AppError implements Exception {
  AppError(this.message, {this.trace});
  String message;
  StackTrace? trace;

  AppError copyWith({
    String? message,
    StackTrace? trace,
  });
}

class ExternalError extends AppError {
  ExternalError(super.message, {super.trace});

  @override
  ExternalError copyWith({String? message, StackTrace? trace}) =>
      ExternalError(message ?? this.message, trace: this.trace);
}

class ClientError extends AppError {
  ClientError(super.message, {super.trace});

  @override
  ClientError copyWith({String? message, StackTrace? trace}) =>
      ClientError(message ?? this.message, trace: this.trace);
}
