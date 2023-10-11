

import 'package:character/core/errors/base_error.dart';

class AppError extends BaseError {
  @override
  final String message;

  AppError(this.message) : super(message);
}
