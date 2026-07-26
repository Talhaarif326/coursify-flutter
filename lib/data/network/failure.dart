// Represents a failed API/network call.
// Used as the "Left" side of Either<Failure, T> across the app.
// Lives in data/network since it's tied to network-originated errors
// (Dio exceptions, non-2xx responses, etc.) caught in RepositoryImpl.
class Failure {
  String errorMessage; // human-readable error message, shown to user/logs
  int statusCode; // HTTP status code returned by the server (or custom code)

  Failure(this.errorMessage, this.statusCode);
}
