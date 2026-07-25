import 'package:json_annotation/json_annotation.dart';

// Links this file to the generated code (responses.g.dart),
// which will contain the actual fromJson/toJson implementations.
part 'responses.g.dart';

/// Base response model — common fields shared across API responses.
@JsonSerializable()
class BaseRespone {
  // Maps the "status" key from the JSON response to this field
  @JsonKey(name: "status")
  String? status;

  // Maps the "statusCode" key from the JSON response to this field
  @JsonKey(name: "statusCode")
  int? statusCode;
}

/// Represents customer data returned from the API.
@JsonSerializable()
class CustomerResponse {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "numberOfNotification")
  int? numberOfNotification;

  CustomerResponse(this.id, this.name, this.numberOfNotification);

  // Converts incoming JSON (Map) into a CustomerResponse object
  factory CustomerResponse.fromJson(Map<String, dynamic> json) =>
      _$CustomerResponseFromJson(json);

  // Converts a CustomerResponse object back into JSON (Map),
  // used when sending data to an API
  Map<String, dynamic> toJson() => _$CustomerResponseToJson(this);
}

/// Represents contact details returned from the API.
@JsonSerializable()
class ContactsResponse {
  @JsonKey(name: "phoneNo")
  int? phoneNo;

  @JsonKey(name: "email")
  String? email;

  @JsonKey(name: "link")
  String? link;

  ContactsResponse(this.email, this.link, this.phoneNo);

  factory ContactsResponse.fromJson(Map<String, dynamic> json) =>
      _$ContactsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ContactsResponseToJson(this);
}

/// Top-level authentication response — combines base status info
/// with nested customer and contact data.
@JsonSerializable()
class AuthenticationResponse extends BaseRespone {
  @JsonKey(name: "customer")
  CustomerResponse? customer;

  @JsonKey(name: 'contacts')
  ContactsResponse? contacts;

  AuthenticationResponse(this.contacts, this.customer);

  factory AuthenticationResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthenticationResponseToJson(this);
}
