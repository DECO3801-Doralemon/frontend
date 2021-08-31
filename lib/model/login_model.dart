import 'package:json_annotation/json_annotation.dart';
part 'login_model.g.dart';

@JsonSerializable()
class Login {
  final List<LoginModel> login;
  Login(this.login);
}

@JsonSerializable()
class LoginModel {
  String access;
  String refresh;

  LoginModel({required this.access, required this.refresh});

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);
  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}
