import 'package:business_terminal/dependency_injection/di.dart';
import 'package:business_terminal/domain/model/errors/api_failure_response.dart';

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
  final ApiFailureResponse response;

  ApiFailure(
    this.response,
    String methodName,
  ) : super(response, methodName);
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
