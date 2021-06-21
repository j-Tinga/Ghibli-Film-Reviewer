class ValidationMixin {
  String? validateEmail(String value) {
    if (value.contains("@")) {
      return null;
    }
    return "Incorrect Email Format";
  }

  String? validatePassword(String value) {
    if (value.length >= 8) {
      return null;
    }
    return "Password is too short";
  }

  String? validateFirstName(String value) {
    if (value.length < 3) {
      return "First Name is too short";
    } else if (value.length > 10) {
      return "First Name is too long";
    } else {
      return "Last Name is too short";
    }
  }

  String validateLastName(String value) {
    if (value.length < 3) {
      return "Last Name is too short";
    } else if (value.length > 10) {
      return "Last Name is too long";
    } else {
      return "Last Name is too short";
    }
  }

  String? validateAddress(String value) {
    if (value.length >= 8) {
      return null;
    }
    return "Password is too short";
  }

  String? noValidation(String value) {
    return null;
  }

  String? validateWatchList(int id) {}
}
