import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';

extension StringX on String {
  String get lastRemoved {
    return substring(0, length - 1);
  }

  String get regExpAmount {
    return replaceAll(RegExp(r'\B(?=(\d{2})+(?!\d))'), ",");
  }

  String get formatDate {
    DateTime dateTime = DateTime.parse(this);
    DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
    return formatter.format(dateTime);
  }

  bool get isValidEmail {
    final emailRegExp = RegExp(
      r'^[a-zA-Z0-9]+([._%+-]?[a-zA-Z0-9]+)*@[a-zA-Z0-9]+([.-]?[a-zA-Z0-9]+)*(\.[a-zA-Z]{2,})+$',
    );
    return emailRegExp.hasMatch(this);
  }

  bool get isValidFullName {
    final nameRegExp = RegExp(
      r'^[a-zA-ZÇŞÜÖĞƏçşüöğəİı\s]+$',
    );
    return nameRegExp.hasMatch(this);
  }

  String get formatMoney {
    final formatter = NumberFormat.currency(
      locale: "az_AZ",
      decimalDigits: 2,
    );
    final value = double.tryParse(replaceAll(',', '.'));
    return formatter.format((value ?? 0) / 100);
  }
}

extension PasswordValidation on String {
  bool get hasUppercase => contains(RegExp(r'[A-Z]'));
  bool get hasLowercase => contains(RegExp(r'[a-z]'));
  bool get hasDigit => contains(RegExp(r'\d'));
  bool get hasSymbol => contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  bool get hasMinLength => length >= 6;
  bool get hasNoThreeConsecutiveDigits => !contains(RegExp(r'(\d)\1\1'));

  bool containsUsername(String username) => username.isNotEmpty && contains(username);
  bool containsMobileNumber(String mobileNumber) => mobileNumber.isNotEmpty && contains(mobileNumber.replaceAll(' ', ''));
}

String? validatePassword(String password, String username, String mobile) {
  if (password.isEmpty) return "Password cannot be empty";
  if (!password.hasUppercase || !password.hasLowercase || !password.hasDigit || !password.hasSymbol || !password.hasMinLength) {
    return "Password must contain an uppercase, lowercase, digit, symbol and at least 6 characters";
  }
  if (!password.hasNoThreeConsecutiveDigits) return "Password must not contain three consecutive digits";
  if (password.containsUsername(username) || password.containsMobileNumber(mobile)) {
    return "Password must not contain username or mobile number";
  }
  return null;
}

extension EitherX<L, T> on Either<L, T> {
  T asRight() => (this as Right).value;
  L asLeft() => (this as Left).value;
}
