class Validator {
  //^ indicate beginning of pattern
  /*[a-zA-Z0-9._%+-]+ Matches the local part of the email address (before the @ symbol)
      a-z: Lowercase letters
      A-Z: Uppercase letters
      0-9: Digits
      .: Period (dot)
      _: Underscore
      %: Percent sign
      +: Plus sign
      -: Hyphen
    */
  //@ -> Matches the @ symbol, which separates the local and domain part of the email address.
  //[a-zA-Z0-9.-]+\ ->Matches the domain part of the email address between @ and .
  //[a-zA-Z]{2,} -> Matches the top-level domain, after .
  //{2,} indicates at least 2 or more letters eg. com,org,uk,in,tech,
  //$ indicate end of pattern
  static const emailValidator =
      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$";

  static const emailValidatorSimplified = r"^[\w.%+-]+@[\w.-]+\.[a-zA-Z]{2,}$";
  static const lowerLetterValidator = r'[a-z]';
  static const upperLetterValidator = r'[A-Z]';
  static const numericValidator = r'\d';
  static const specialCharacterValidator = r'[\W_]';

  static String? nameFieldValidator(String? userInput) {
    if (userInput == null || userInput.isEmpty) {
      return "User Name can't be empty";
    }
    return null;
  }

  static String? emailFieldValidator(String? userInput) {
    if (userInput == null || userInput.isEmpty) {
      return "Email address can't be empty";
    } else if (!RegExp(emailValidator).hasMatch(userInput)) {
      return "please enter valid email address";
    }
    return null;
  }

  static String? passwordFieldValidator(String? userInput) {
    String passwordError = "";
    if (userInput == null || userInput.isEmpty) {
      return "Password can't be empty";
    }
    if (!RegExp(r'[a-z]').hasMatch(userInput)) {
      passwordError = passwordError.isEmpty
          ? "${passwordError}Password must contain at least one lowercase letter"
          : "$passwordError ,one lowercase letter";
    }
    if (!RegExp(upperLetterValidator).hasMatch(userInput)) {
      passwordError = passwordError.isEmpty
          ? "${passwordError}Password must contain at least one uppercase letter"
          : "$passwordError ,one uppercase letter";
    }
    if (!RegExp(numericValidator).hasMatch(userInput)) {
      passwordError = passwordError.isEmpty
          ? "${passwordError}Password must contain at least one numeric digit"
          : "$passwordError ,one numeric digit";
    }
    if (!RegExp(specialCharacterValidator).hasMatch(userInput)) {
      passwordError = passwordError.isEmpty
          ? "${passwordError}Password must contain at least one special character"
          : "$passwordError ,one special character";
    } else if (userInput.length < 8 && passwordError.isEmpty) {
      return "Password must be at least 8 characters long.";
    }
    return passwordError.isEmpty ? null : passwordError;
  }

  static String? otpFieldValidator(String? userInput, int digit) {
    if (userInput == null || userInput.isEmpty) {
      return "Please enter OTP";
    } else if (!RegExp(numericValidator).hasMatch(userInput)) {
      return "please enter valid OTP";
    } else if (userInput.length != digit) {
      return "please enter $digit digit OTP";
    }
    return null;
  }
}
