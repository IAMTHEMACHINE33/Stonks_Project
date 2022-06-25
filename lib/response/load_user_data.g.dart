// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'load_user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoadUserData _$LoadUserDataFromJson(Map<String, dynamic> json) => LoadUserData(
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      age: json['age'] as String?,
      email: json['email'] as String?,
      username: json['username'] as String?,
    )..id = json['_id'] as String?;

Map<String, dynamic> _$LoadUserDataToJson(LoadUserData instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'age': instance.age,
      'email': instance.email,
      'username': instance.username,
    };
