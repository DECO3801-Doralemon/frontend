import 'package:json_annotation/json_annotation.dart';
part 'new_user.g.dart';

@JsonSerializable()
class NewUser {
  String username;
  String first_name;
  String last_name;
  String password;
  String email;

  NewUser({
    required this.username,
    required this.first_name,
    required this.last_name,
    required this.email,
    required this.password,

  });

  factory NewUser.fromJson(Map<String, dynamic> json) =>
      _$NewUserFromJson(json);
  Map<String, dynamic> toJson() => _$NewUserToJson(this);
}
