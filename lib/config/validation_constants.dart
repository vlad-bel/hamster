class ValidationConstants {
  static const int kMinimalPasswordLength = 10;

  static final nameSurnameRegexp = RegExp(r"^[a-z ,.\'-]+$", caseSensitive: false);
}
