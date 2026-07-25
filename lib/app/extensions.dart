// extension of String

extension NoNullString on String? {
  String orString() {
    if (this == null) {
      return "";
    } else {
      return this!;
    }
  }
}

// extension on Int

extension NoNullInteger on int? {
  int orZero() {
    if (this == null) {
      return 0;
    } else {
      return this!;
    }
  }
}
