String? passwordValidator(value) {
  if (value == null || value.toString() == "") {
    return "Please enter password";
  } else if (value.length < 8) {
    return "Password cannot be less than 8 characters";
  }
  return null;
}

String? nameValidator(value) {
  if (value == null || value.toString() == "") {
    return "Please enter username";
  } else if (value.trim().contains(" ")) {
    return "Username cannot contain space";
  }
  return null;
}

String? emailValidator(value) {
  if (value == null || value.toString() == "") {
    return "Please enter your email";
  } else if (value.trim().contains(" ")) {
    return "Email cannot contain space";
  }
  return null;
}

String? phoneValidator(value) {
  if (value == null || value.toString() == "") {
    return "Please enter phone";
  } else if (value.trim().contains(" ")) {
    return "Phone cannot contain space";
  }
  return null;
}

String? confirmPasswordValidator(value) {
  if (value == null || value.toString() == "") {
    return "Please confirm your password";
  } else if (value.trim().contains(" ")) {
    return "Confirm Password cannot contain space";
  }
  return null;
}