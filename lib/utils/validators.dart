import 'package:buddy_save/utils/helpers.dart';
import 'package:buddy_save/values/regex.dart';
import 'package:buddy_save/values/strings.dart';

class BuddyValidators {
  static String? passwordValidator(String? password) {
    if (password != null && password.length >= 8) return null;

    if (password == null || password.isEmpty)
      return "Password field cannot be empty";

    return "Password cannot be less than eight characters";
  }

  static String getCleanedNumber(String text) {
    RegExp regExp = new RegExp(r"[^0-9]");
    return text.replaceAll(regExp, '');
  }

  static String? emailValidator(String email) {
    if (email.isEmpty) return "Email field cannot be empty";

    if (!_validateEmail(email)) return "Please enter valid email address";

    return null;
  }

  static String? validateCardNum(String input) {
    if (input == null || input.isEmpty) {
      return fieldReq;
    }

    input = getCleanedNumber(input);

    if (input.length < 8) {
      return numberIsInvalid;
    }

    int sum = 0;
    int length = input.length;
    for (var i = 0; i < length; i++) {
      // get digits in reverse order
      int digit = int.parse(input[length - i - 1]);

      // every 2nd number multiply with 2
      if (i % 2 == 1) {
        digit *= 2;
      }
      sum += digit > 9 ? (digit - 9) : digit;
    }

    if (sum % 10 == 0) {
      return null;
    }

    return numberIsInvalid;
  }

  static String? required(String? text) {
    if (text == null || text.isEmpty) return "This field cannot be empty";

    return null;
  }

  static String? acctNumValid(String? text) {
    return (text != null && text.isNotEmpty && text.length == 10)
        ? null
        : "Account number not completed.";
  }

  static String? nameValidator(String? name) {
    if (name != null && name.isEmpty) return "Name field cannot be empty";

    if (name != null && name.length < 2)
      return "Name cannot be less than two characters";

    return null;
  }

  static String? bvnValidator(String name) {
    if (name.isEmpty) return "BVN field cannot be empty";

    if (name.length != 11) return "BVN must be 11 digits";

    return null;
  }

  static String? phoneValidator(String? value) {
    if (value != null && value.length == 0) {
      return 'Phone field cannot be left empty';
    }
    if (value != null && value.length < 10) {
      return 'Phone number should have at least 11 digits';
    }
    if (!phoneRegex.hasMatch(value!)) {
      return 'Please enter valid mobile number';
    }

    return null;
  }

  static String? amountValidator(String? value,
      {num minAmount = 100, num? maxAmount, bool check = false}) {
    final amount = extractAmount(value);
    if (value != null && value.isEmpty) {
      return 'Amount cannot be left empty';
    } else if (amount == null || amount < minAmount) {
      return 'Please enter valid amount';
    }
    if (check) if (maxAmount == null || amount > maxAmount) {
      return 'Please enter valid amount';
    }
    return null;
  }

  static String? minLength(String? value, {int length = 1}) {
    if (value == null || (value.isEmpty)) {
      return 'This field is required';
    }
    if (value.length < length) {
      return 'The field should contain at least $length characters';
    }
    return null;
  }

  static String? minMaxLength(String value, {int length = 1, int height = 10}) {
    if (value == null || (value.isEmpty)) {
      return 'This field is required';
    }
    if (value.length < length) {
      return 'The field should contain at least $length characters';
    }
    if (value.length > height) {
      return 'The field should contain at most $height characters';
    }
    return null;
  }

  static bool _validateEmail(String value) {
    return (!mailRegEx.hasMatch(value)) ? false : true;
  }

  static String? validateCVV(String value) {
    if (value == null || value.isEmpty) {
      return fieldReq;
    }

    if (value.length < 3 || value.length > 4) {
      return "CVV is invalid";
    }
    return null;
  }

  static int convertYearTo4Digits(int year) {
    if (year < 100 && year >= 0) {
      var now = DateTime.now();
      String currentYear = now.year.toString();
      String prefix = currentYear.substring(0, currentYear.length - 2);
      year = int.parse('$prefix${year.toString().padLeft(2, '0')}');
    }
    return year;
  }

}
