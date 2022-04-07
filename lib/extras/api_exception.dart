class ApiException implements Exception{
  // ignore: prefer_typing_uninitialized_variables
  final prefix;
  // ignore: prefer_typing_uninitialized_variables
  final message;

  ApiException([this.prefix, this.message]);

  @override
  String toString() {
    return "$prefix: $message";
  }
}
class ResponseException extends ApiException {
  ResponseException([message]) : super("Error in response", message);
}

class BadRequestException extends ApiException {
  BadRequestException([message]) : super("Invalid request", message);
}

class UnauthorisedException extends ApiException {
  UnauthorisedException([message]) : super("Unauthorised", message);
}

class InvalidInputException extends ApiException {
  InvalidInputException([message]) : super("Invalid input", message);
}
