// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'load_user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoadUserResponse _$LoadUserResponseFromJson(Map<String, dynamic> json) =>
    LoadUserResponse(
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      username: json['username'] as String?,
      age: json['age'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$LoadUserResponseToJson(LoadUserResponse instance) =>
    <String, dynamic>{
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'username': instance.username,
      'age': instance.age,
      'email': instance.email,
    };
