// Defines the API client interface for authentication-related endpoints.
// Retrofit reads the annotations below and generates the actual
// networking implementation (see app_api.g.dart) that uses Dio
// to perform the real HTTP calls.

import 'package:dio/dio.dart';
import 'package:project_on_clean_architecture/app/constant.dart';
import 'package:project_on_clean_architecture/data/responses/responses.dart';
import 'package:retrofit/retrofit.dart';

// Links this file to its generated counterpart (app_api.g.dart),
// which contains the actual Retrofit-generated implementation.
part 'app_api.g.dart';

// Marks this class as a Retrofit REST API client and sets the
// default base URL for all requests made through it.
@RestApi(baseUrl: Constant.baseUrl)
abstract class AppClient {
  // Factory constructor - delegates to the generated _AppClient class,
  // passing in the Dio instance that will actually perform the requests.
  // baseUrl can optionally be overridden here instead of using the default.
  factory AppClient(Dio dio, {String baseUrl}) = _AppClient;

  // Declares a POST request to /Customers/Login.
  // Retrofit generates the code to send this request and automatically
  // convert the JSON response into an AuthenticationResponse object
  // (via AuthenticationResponse.fromJson).
  @POST("/Customers/Login")
  Future<AuthenticationResponse> login();
}
