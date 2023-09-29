import 'dart:convert';

class UserModel {
  int? id;
  String? userName, password;
  UserModel({
    this.id,
    this.userName,
    this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      userName: json['username'],
      password: json['password'],
    );
  }
}
