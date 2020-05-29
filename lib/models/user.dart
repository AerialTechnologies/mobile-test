String fieldEmptyMessage(String field) => "$field should not be empty";

String passwordValidatorUtil(String value) {
  RegExp passwordRegex =
      RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$");
  String passwordHelper =
      "You must provide at least 8 chars, one uppercase, one lowercase, one number and one special character";

  return passwordRegex.hasMatch(value) ? null : passwordHelper;
}

String emailValidatorUtil(String value) {
  String _email = emailFormatter(value);
  RegExp emailRegex = RegExp(r"^[-\w.+]{3,256}@[-\w.]{3,256}$");
  String emailHelper = "You must provide a valid email";

  return emailRegex.hasMatch(_email) ? null : emailHelper;
}

String emailFormatter(String value) => value.trim().toLowerCase();

class UserRegisterValidator {
  String firstNameValidator(String value) =>
      value.length == 0 ? fieldEmptyMessage("First Name") : null;
  String lastNameValidator(String value) =>
      value.length == 0 ? fieldEmptyMessage("Last Name") : null;
  String passwordValidator(String value) => passwordValidatorUtil(value);
  String emailValidator(String value) => emailValidatorUtil(value);
}

class UserSignInValidator {
  String passwordValidator(String value) => passwordValidatorUtil(value);
  String emailValidator(String value) => emailValidatorUtil(value);
}

class UserSignIn {
  String password;
  String email;

  UserSignIn();

  Map value() {
    return {
      "password": this.password,
      "email": this.email,
    };
  }
}

class UserRegister {
  String password;
  String firstName;
  String lastName;
  String email;
  bool acceptStoreInfoPolicy = false;
  bool acceptUsageStatisticPolicy = false;

  UserRegister();

  Map value() {
    return {
      "password": this.password,
      "fullname": '${this.firstName} ${this.lastName}',
      "email": this.email,
      "acceptStoreInfoPolicy": this.acceptStoreInfoPolicy,
      "acceptUsageStatisticPolicy": this.acceptUsageStatisticPolicy,
    };
  }
}
