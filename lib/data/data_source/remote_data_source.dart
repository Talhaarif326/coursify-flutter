import 'package:project_on_clean_architecture/data/network/app_api.dart';
import 'package:project_on_clean_architecture/data/request/login_request.dart';
import 'package:project_on_clean_architecture/data/responses/responses.dart';

// Abstract contract: defines what the remote data source can do.
// Only responsible for fetching raw data from the network —
// no error handling, no Either, no domain conversion here.
abstract class RemoteDataSource {
  Future<AuthenticationResponse> login(LoginRequest loginRequest);
}

// Concrete implementation: delegates directly to AppClient (Retrofit/Dio).
// Acts as a thin pass-through between AppClient and Repository.
class RemoteDataSourceImplement implements RemoteDataSource {
  RemoteDataSourceImplement(this._appClient);
  final AppClient _appClient;

  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) async {
    // Unpacks LoginRequest into individual @Field params expected
    // by AppClient.login(email, password).
    // Any exception thrown here (bad network, non-2xx, etc.)
    // propagates up uncaught — Repository is what catches it.
    return await _appClient.login(loginRequest.email, loginRequest.password);
  }
}
