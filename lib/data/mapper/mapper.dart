// Mapper file: converts nullable Response/DTO objects (from API/JSON)
// into clean, non-nullable domain Model objects.
// This keeps nullability handling isolated here, so the rest of the
// app (UseCases, UI) never has to deal with null-checks.

import 'package:project_on_clean_architecture/app/extensions.dart';
import 'package:project_on_clean_architecture/data/responses/responses.dart';
import 'package:project_on_clean_architecture/domain/model.dart';

// Default fallback values used when a field is null
final empty = "";
final zero = 0;

// Extension on CustomerResponse (nullable) that converts it into
// a clean, non-nullable Customer domain model.
extension CustomerResponseObject on CustomerResponse? {
  Customer toDomain() {
    return Customer(
      // Safely unwrap id: null-check on the response itself,
      // then null-check on the field, falling back to 0 if either is null
      this?.id?.orZero() ?? zero,

      // Safely unwrap name, falling back to an empty string if null
      this?.name?.orString() ?? empty,

      // Safely unwrap numberOfNotification, falling back to 0 if null
      this?.numberOfNotification?.orZero() ?? zero,
    );
  }
}

// Extension on ContactsResponse (nullable) that converts it into
// a clean, non-nullable Contacts domain model.
extension ContactResponseObject on ContactsResponse? {
  Contacts toDomain() {
    return Contacts(
      // Safely unwrap email, falling back to an empty string if null
      this?.email?.orString() ?? empty,

      // Safely unwrap link, falling back to an empty string if null
      this?.link?.orString() ?? empty,

      // Safely unwrap phoneNo, falling back to 0 if null
      this?.phoneNo?.orZero() ?? zero,
    );
  }
}

// Extension on AuthenticationResponse (nullable) that converts it into
// a clean Authentication domain model.
// This is the top-level response, so it composes the two mappers above
// to convert its nested customer/contacts fields as well.
extension AuthenticationResponseObject on AuthenticationResponse? {
  Authentication toDomain() {
    return Authentication(
      // Convert nested ContactsResponse -> Contacts using its own mapper
      this?.contacts?.toDomain(),

      // Convert nested CustomerResponse -> Customer using its own mapper
      this?.customer?.toDomain(),
    );
  }
}
