class ValidationMixin {
  String? validatePassword(String? value) {
    if (value!.length >= 8) {
      return null;
    }
    return "Password is too short";
  }

  String? validateUsername(String? value) {
    if (value!.length < 3) {
      return "Username is too short";
    } else if (value.length > 30) {
      return "Username is too long";
    } else {
      return null;
    }
  }

  String? validateRating(String? value) {
    if (int.parse(value!) < 0) {
      return "Min rating is 0";
    } else if (int.parse(value) > 100) {
      return "Max rating is 100";
    } else {
      return null;
    }
  }

  String? validateTitle(String? value) {
    if (value!.length <= 0) {
      return "Title required";
    } else if (value.length > 40) {
      return "Max rating is 100";
    } else {
      return null;
    }
  }

  String? validateDescription(String? value) {
    if (value!.length <= 0) {
      return "Review required";
    } else if (value.length > 250) {
      return "Character limit is 250";
    } else {
      return null;
    }
  }

  String? noValidation(String value) {
    return null;
  }
}
