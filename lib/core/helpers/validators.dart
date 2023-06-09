// ignore_for_file: leading_newlines_in_multiline_strings

class Validators {
  static final RegExp _emailRegExp = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  );

  static final RegExp _phoneRegExp = RegExp(
    r'''(9[976]\d|8[987530]\d|6[987]\d|5[90]\d|42\d|3[875]\d|
2[98654321]\d|9[8543210]|8[6421]|6[6543210]|5[87654321]|
4[987654310]|3[9643210]|2[70]|7|1)\d{6,14}$''',
  );

  static bool nameValidator(String text) {
    RegExp exp = RegExp("^[a-zA-Z0-9]+((_|-|\\.)?[a-zA-Z0-9])*\$");
    if (!exp.hasMatch(text) && text.isNotEmpty) {
      return false;
    } else {
      return true;
    }
  }

  static final RegExp _postCodeRegExp = RegExp(r'^[0-9]{5}(?:-[0-9]{4})?$');

  static bool isValidEmail(String email) {
    return _emailRegExp.hasMatch(email);
  }

  static bool isValidPassword(String password) {
    if (password.length > 6) {
      return true;
    } else {
      return false;
    }
  }

  static bool isValidPhoneNumber(String phone) {
    return _phoneRegExp.hasMatch(phone);
  }

  static bool isValidPostalCode(String code) {
    return _postCodeRegExp.hasMatch(code);
  }

  static bool isTextNonNull(String text, {int limit = 0}) {
    return text.isNotEmpty && text.length > limit;
  }
}
