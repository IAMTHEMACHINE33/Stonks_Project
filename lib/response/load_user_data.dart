import 'package:json_annotation/json_annotation.dart';

part 'load_user_data.g.dart';

@JsonSerializable()
class LoadUserData {
  @JsonKey(name: '_id')
  String? id;
  String? firstname;
  String? lastname;
  String? age;
  String? email;
  String? username;

  LoadUserData(
      {this.firstname, this.lastname, this.age, this.email, this.username});

  factory LoadUserData.fromJson(Map<String, dynamic> json) =>
      _$LoadUserDataFromJson(json);

  Map<String, dynamic> tojson() => _$LoadUserDataToJson(this);
}
