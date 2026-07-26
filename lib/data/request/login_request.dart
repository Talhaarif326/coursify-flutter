// Data-layer model representing the outgoing login payload.
// This is what gets sent to the API (via @Field in AppClient.login),
// not what comes back from it.
class LoginRequest {
  String email;
  String password;

  LoginRequest(this.email, this.password);
}
