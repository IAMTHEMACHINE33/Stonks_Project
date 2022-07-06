import 'package:json_annotation/json_annotation.dart';

part 'load_user_response.g.dart';

@JsonSerializable()
class LoadUserResponse {
  @JsonKey(name: "firstname")
  String? firstname;

  @JsonKey(name: "lastname")
  String? lastname;

  @JsonKey(name: "username")
  String? username;

  @JsonKey(name: "age")
  String? age;

  @JsonKey(name: "email")
  String? email;

  LoadUserResponse({
    this.firstname,
    this.lastname,
    this.username,
    this.age,
    this.email,
  });

  factory LoadUserResponse.fromJson(Map<String, dynamic> json) =>
      _$LoadUserResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoadUserResponseToJson(this);
}
