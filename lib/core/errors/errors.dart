abstract class AppError implements Exception {
  AppError(this.message, {this.trace});
  String message;
  StackTrace? trace;
}

class ExternalError extends AppError {
  ExternalError(super.message, {super.trace});
}
