import 'package:crick_cup/utilities/utility.dart';

class CustomException implements Exception {
  final _message;
  final _prefix;

  CustomException([this._message, this._prefix]) {
    var result = Utility.getResMessage(_message);
    Utility.toastMessage(Utility.nullCheckString(result) ? result : _prefix);
  }

  @override
  String toString() {
    return "$_prefix $_message";
  }
}

class FetchDataException extends CustomException {
  FetchDataException([String? message])
      : super(message, "oops looks like server down");
}

class TimeOutException extends CustomException {
  TimeOutException([String? message])
      : super(message, "server is taking much time to respond");
}

class BadRequestException extends CustomException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends CustomException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class InvalidInputException extends CustomException {
  InvalidInputException([String? message]) : super(message, "");
}
