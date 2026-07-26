import 'package:dartz/dartz.dart';
import 'package:project_on_clean_architecture/data/network/failure.dart';
import 'package:project_on_clean_architecture/data/request/login_request.dart';
import 'package:project_on_clean_architecture/domain/model.dart';

// Domain-layer contract for authentication actions.
// This is an interface only — no implementation here.
// The actual logic (calling RemoteDataSource, catching errors,
// converting to Left/Right) lives in RepositoryImpl (data layer).
abstract class Repositry {
  // Returns Either<Failure, Authentication>:
  // - Left(Failure)  -> login failed (network/server error)
  // - Right(Authentication) -> login succeeded, clean domain model returned
  // Presentation/UseCase layers only ever talk to this abstract type,
  // never to LoginRequest, AuthenticationResponse, or Dio directly.
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest);
}
