import 'package:equatable/equatable.dart';

// Base Failure class
abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

// Common failure types
class ServerFailure extends Failure {
  const ServerFailure([super.message = 'Server Failure']);
}

class NetworkFailure extends Failure {
  const NetworkFailure([super.message = 'No Internet Connection']);
}

class UnknownFailure extends Failure {
  const UnknownFailure([super.message = 'Unknown Failure']);
}

class ApiFailure extends Failure {
  final int statusCode;

  const ApiFailure(this.statusCode, [String message = 'API Failure'])
      : super(message);

  @override
  List<Object> get props => [statusCode, message];
}
