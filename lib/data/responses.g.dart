// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseRespone _$BaseResponeFromJson(Map<String, dynamic> json) => BaseRespone()
  ..status = json['status'] as String?
  ..statusCode = (json['statusCode'] as num?)?.toInt();

Map<String, dynamic> _$BaseResponeToJson(BaseRespone instance) =>
    <String, dynamic>{
      'status': instance.status,
      'statusCode': instance.statusCode,
    };

CustomerResponse _$CustomerResponseFromJson(Map<String, dynamic> json) =>
    CustomerResponse(
      (json['id'] as num?)?.toInt(),
      json['name'] as String?,
      (json['numberOfNotification'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CustomerResponseToJson(CustomerResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'numberOfNotification': instance.numberOfNotification,
    };

ContactsResponse _$ContactsResponseFromJson(Map<String, dynamic> json) =>
    ContactsResponse(
      json['email'] as String?,
      json['link'] as String?,
      (json['phoneNo'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ContactsResponseToJson(ContactsResponse instance) =>
    <String, dynamic>{
      'phoneNo': instance.phoneNo,
      'email': instance.email,
      'link': instance.link,
    };

AuthenticationResponse _$AuthenticationResponseFromJson(
  Map<String, dynamic> json,
) =>
    AuthenticationResponse(
        json['contacts'] == null
            ? null
            : ContactsResponse.fromJson(
                json['contacts'] as Map<String, dynamic>,
              ),
        json['customer'] == null
            ? null
            : CustomerResponse.fromJson(
                json['customer'] as Map<String, dynamic>,
              ),
      )
      ..status = json['status'] as String?
      ..statusCode = (json['statusCode'] as num?)?.toInt();

Map<String, dynamic> _$AuthenticationResponseToJson(
  AuthenticationResponse instance,
) => <String, dynamic>{
  'status': instance.status,
  'statusCode': instance.statusCode,
  'customer': instance.customer,
  'contacts': instance.contacts,
};
