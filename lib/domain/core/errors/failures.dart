import 'package:business_terminal/domain/dependency_injection/di.dart';

abstract class Failure implements Exception {
  Failure(this.exception, this.methodName) {
    logger.e('Caught in $methodName. Error: ${exception?.toString()}');
  }

  final dynamic exception;

  final String methodName;
}

///ApiFailure represents error caused by API (endpoints). Those failures are
///mainly server based and they are not ours fault.
class ApiFailure extends Failure {
  ApiFailure(dynamic exception, String methodName)
      : super(exception, methodName);
}

///ConnectionFailure represents error caused by unsuccessful attempts
///to connect to the internet.
class ConnectionFailure extends Failure {
  ConnectionFailure(dynamic exception, String methodName)
      : super(exception, methodName);
}

//If we don't know what happened
class UndefinedFailure extends Failure {
  UndefinedFailure(dynamic exception, String methodName)
      : super(exception, methodName);
}
