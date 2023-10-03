import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final Object e;

  Failure(this.e);

  @override
  List<Object?> get props => [e];
}

class ServerFailure extends Failure {
  ServerFailure(Object e) : super(e);
}

class CacheFailure extends Failure {
  CacheFailure(Object e) : super(e);
}

class NetworkFailure extends Failure {
  NetworkFailure(Object e) : super(e);
}
