class AuthParams {
  String? name;
  String? email;
  String? password;
  String? passwordConfirmation;
  int? verificationCode;
  int? phone;
  String? newPassword;
  String? newPasswordConfirmation;
  String? address;

  AuthParams(
      {this.name,
      this.email,
      this.password,
      this.passwordConfirmation,
      this.verificationCode,
      this.newPassword,
      this.newPasswordConfirmation,
      this.phone,
      this.address});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': passwordConfirmation,
      "verify_code": verificationCode,
      "new_password": newPassword,
      "new_password_confirmation": newPasswordConfirmation,
      "phone": phone,
      "address": address,
    };
  }
}
