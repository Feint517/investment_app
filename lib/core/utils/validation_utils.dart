class ValidationUtils {
  static bool isValidEmail(String email) {
    final regex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}\$');
    return regex.hasMatch(email);
  }

  // static bool isValidPassword(String password, {int minLength = 6}) {
  //   return password.length >= minLength;
  // }

  // static bool isPhoneNumber(String phone) {
  //   final regex = RegExp(r'^[0-9]{10,15}\$');
  //   return regex.hasMatch(phone);
  // }

  static String? validateEmptyText(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }

    //regular expression for email validation
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'Invalid email address';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    //check for minimus password length
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }

    //check for uppercase letters
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one upper case letter';
    }

    //check for numers
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number';
    }

    //check for special characters
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least one special character';
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }

    //regular expression for phone number validation (assuming a 10-digit US phone number format)
    final phoneRegExp = RegExp(r'^\d{10}$');

    if (!phoneRegExp.hasMatch(value)) {
      return 'Invalid phone number format (10 digits required)';
    }
    return null;
  }

  static String? validateCardNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Card number is required';
    }

    //? Remove dashes from the card number
    String sanitizedValue = value.replaceAll('-', '');

    //? Check if the sanitized card number is exactly 16 digits
    if (sanitizedValue.length != 16 ||
        !RegExp(r'^\d{16}$').hasMatch(sanitizedValue)) {
      return 'Invalid card number format';
    }

    return null; //? Valid card number
  }
}
