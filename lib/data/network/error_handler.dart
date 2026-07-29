import 'package:dio/dio.dart';
import 'package:project_on_clean_architecture/data/network/failure.dart';

enum Status {
  success,
  noInternet,
  noContent,
  badRequest,
  notFound,
  tooManyRequest,
  connectionTimeOut,
  unknown,
}

class ResponseCode {
  static const int success = 200;
  static const int noInternet = 0;
  static const int noContent = 204;
  static const int badRequest = 400;
  static const int notFound = 404;
  static const int tooManyRequest = 429;
  static const int connectionTimeOut =
      504; // NOTE: 504 is Gateway Timeout (server-side). We're reusing it
  // for client-side Dio timeouts too — fine for internal use, but
  // don't treat this as a real HTTP status code if logged/analyzed.
  static const int unknown = -1;
}

class ResponseMessage {
  // API status codes
  static const String success = "success"; // success with data
  static const String noContent =
      "success with no content"; // success with no content
  static const String badRequest =
      "Bad request, try again later"; // failure, api rejected the request
  static const String notFound =
      "Url is not found, try again later"; // failure, api url is not correct and not found

  // local status code
  static const String unknown = "some thing went wrong, try again later";
  static const String connectionTimeOut = "time out error, try again later";
  static const String noInternet = "Please check your internet connection";
  static const String tooManyRequest =
      "Too many Request please try agian later";
}

extension StatusExtension on Status {
  // Maps each Status to its corresponding Failure (message + code).
  // NOTE: notFound and toManyRequest are currently unreachable from
  // ErrorHandler below, since DioExceptionType.badResponse (the case
  // that would carry a real server status code like 404/429) isn't
  // handled yet in _handleError. Revisit once server error parsing
  // is added.
  Failure getFailureStatus() {
    switch (this) {
      case Status.success:
        return Failure(ResponseMessage.success, ResponseCode.success);
      case Status.noInternet:
        return Failure(ResponseMessage.noInternet, ResponseCode.noInternet);
      case Status.noContent:
        return Failure(ResponseMessage.noContent, ResponseCode.noContent);
      case Status.badRequest:
        return Failure(ResponseMessage.badRequest, ResponseCode.badRequest);
      case Status.notFound:
        return Failure(ResponseMessage.notFound, ResponseCode.notFound);
      case Status.tooManyRequest:
        return Failure(
          ResponseMessage.tooManyRequest,
          ResponseCode.tooManyRequest,
        );
      case Status.connectionTimeOut:
        return Failure(
          ResponseMessage.connectionTimeOut,
          ResponseCode.connectionTimeOut,
        );
      default:
        return Failure(ResponseMessage.unknown, ResponseCode.unknown);
    }
  }
}

class ErrorHandler implements Exception {
  late Failure failure;

  // FIXED: previously had a redundant `if (error.type is DioException)`
  // check that always evaluated false (error.type is a DioExceptionType,
  // never a DioException), causing every error to be misclassified as
  // unknown. Now calls _handleError directly.
  ErrorHandler.handle(DioException error) {
    failure = _handleError(error);
  }

  Failure _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        // All three timeout variants share the same user-facing failure.
        return Status.connectionTimeOut.getFailureStatus();

      case DioExceptionType.badCertificate:
        // NOTE: mapped to badRequest for now, but this is really a
        // security/connection issue (invalid/expired SSL cert), not
        // a malformed request. Consider a dedicated Status + message
        // (e.g. "Secure connection failed") for clearer UX.
        return Status.badRequest.getFailureStatus();

      case DioExceptionType.unknown:
        return Status.unknown.getFailureStatus();

      // TODO: DioExceptionType.badResponse is not explicitly handled.
      // This is the case that carries the actual server status code
      // (error.response?.statusCode), so 404/429/etc. from the server
      // currently fall through to `default` -> unknown instead of
      // being mapped to Status.notFound / Status.toManyRequest.
      // TODO: DioExceptionType.cancel and DioExceptionType.connectionError
      // also fall through to default. Cancelled requests probably
      // shouldn't surface an error message to the user at all —
      // worth handling separately.
      default:
        return Status.unknown.getFailureStatus();
    }
  }
}
