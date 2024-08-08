class Validator {
  static const emailValidator =
      "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,}\$";

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
}
