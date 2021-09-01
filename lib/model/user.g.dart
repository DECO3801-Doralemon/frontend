// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    (json['user'] as List<dynamic>)
        .map((e) => UserModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'user': instance.user,
    };

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(
    is_login: json['is_login'] as bool,
    username: json['username'] as String,
    first_name: json['first_name'] as String,
    last_name: json['last_name'] as String,
    email: json['email'] as String,
    bio: json['bio'] as String?,
    photo: json['photo'] as String?,
    token: json['token'] as String,
  );
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'is_login': instance.is_login,
      'username': instance.username,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'email': instance.email,
      'bio': instance.bio,
      'photo': instance.photo,
      'token': instance.token,
    };
