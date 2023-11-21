class UserModel {
  String? fullName;
  String? email;
  String? phone;
  String? birthDate;

  UserModel({
    this.fullName,
    this.email,
    this.birthDate,
    this.phone,
  });

  factory UserModel.fromJson(Map<String, dynamic> data) {
    return UserModel(
      fullName: data["full_name"],
      email: data["email"],
      birthDate: data["birth_date"],
      phone: data["phone"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "full_name": fullName,
      "email": email,
      "birth_date": birthDate,
      "phone": phone,
    };
  }
}
