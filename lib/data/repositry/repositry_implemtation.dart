import 'package:dartz/dartz.dart';
import 'package:project_on_clean_architecture/data/data_source/remote_data_source.dart';
import 'package:project_on_clean_architecture/data/mapper/mapper.dart';
import 'package:project_on_clean_architecture/data/network/failure.dart';
import 'package:project_on_clean_architecture/data/network/network_info.dart';
import 'package:project_on_clean_architecture/data/request/login_request.dart';
import 'package:project_on_clean_architecture/domain/model.dart';
import 'package:project_on_clean_architecture/domain/repositry.dart';

/// Concrete implementation of the domain Repository contract.
/// This is the "data" layer's job: talk to the network/local sources,
/// and translate the result into something the domain layer understands
/// (Either<Failure, Success> — no raw API models leak past this point).
class RepositryImplemtation extends Repositry {
  // Used to check if the device currently has internet access
  final NetworkInfo _hasConnection;

  // Actual API caller (e.g. Dio/Retrofit client wrapper)
  final RemoteDataSource _remoteDataSource;

  RepositryImplemtation(this._hasConnection, this._remoteDataSource);

  @override
  Future<Either<Failure, Authentication>> login(
    LoginRequest loginRequest,
  ) async {
    // Step 1: check connectivity before wasting a network call
    if (await _hasConnection.isConnected) {
      // Step 2: safe to call the API now
      final response = await _remoteDataSource.login(loginRequest);

      // Step 3: statusCode == 0 is THIS mock API's convention for "success"
      // (defined in Postman mock, not a real HTTP status)
      if (response.statusCode == 0) {
        // API call successful -> map response DTO to domain model,
        // wrap in Right (the "success" side of Either)
        return Right(response.toDomain());
      } else {
        // API responded but with a business/logic error
        // -> wrap in Left (the "failure" side of Either)
        return Left(
          Failure(
            response.status ?? "there is some business logic error ",
            409,
          ),
        );
      }
    } else {
      // Step 4: no internet at all, never even hit the API
      // -> also returns Left, but this is a connectivity failure,
      // not a business logic failure (worth using a different code later)
      return Left(Failure("check you internet connection", 409));
    }
  }
}
