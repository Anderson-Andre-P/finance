class Validator {
  Validator._();

  static String? validateName(String? value) {
    final condition = RegExp(r"\b([A-ZÀ-ÿ][-,a-z. ']+[ ]*)+");
    if (value != null && value.isEmpty) {
      return "This field cannot be empty";
    }
    if (value != null && !condition.hasMatch(value)) {
      return "Invalid name. Please enter a valid name";
    }
    return null;
  }

  static String? validateEmail(String? value) {
    final condition = RegExp(
        r"^([A-Z|a-z|0-9](\.|_){0,1})+[A-Z|a-z|0-9]\@([A-Z|a-z|0-9])+((\.){0,1}[A-Z|a-z|0-9]){2}\.[a-z]{2,3}$");
    if (value != null && value.isEmpty) {
      return "This field cannot be empty";
    }
    if (value != null && !condition.hasMatch(value)) {
      return "Invalid email. Please enter a valid email";
    }
    return null;
  }

  static String? validatePassword(String? value) {
    final condition =
        RegExp(r"((?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[\W]).{8,64})");
    if (value != null && value.isEmpty) {
      return "This field cannot be empty";
    }

    if (value != null && !condition.hasMatch(value)) {
      return "Invalid password. Type an valid password";
    }
    return null;
  }

  static String? validateConfirmPassword(
      String? passwordValue, String? confirmPasswordValue) {
    if (passwordValue != confirmPasswordValue) {
      return "Different passwords";
    }
    return null;
  }
}
