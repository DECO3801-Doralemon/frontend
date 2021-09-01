import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
  final List<UserModel> user;
  User(this.user);
}

@JsonSerializable()
class UserModel {
  bool is_login;

  String username;
  String first_name;
  String last_name;
  String email;
  String? bio;
  String? photo;
  String token;

  UserModel(
      {required this.is_login,
      required this.username,
      required this.first_name,
      required this.last_name,
      required this.email,
      this.bio,
      this.photo,
      required this.token});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
