import 'package:json_annotation/json_annotation.dart';
part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  String? firstname;
  String? lastname;
  String? email;
  int? age;
  String? username;

  UserResponse(
      {this.firstname, this.lastname, this.email, this.age, this.username});

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}
