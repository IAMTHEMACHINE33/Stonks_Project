import 'package:json_annotation/json_annotation.dart';
import 'package:portfolio_management/response/load_user_data.dart';

part 'load_user_response.g.dart';

@JsonSerializable()
class LoadUserResponse {
  bool? success;
  List<LoadUserData>? data;

  LoadUserResponse({
    this.success,
    this.data,
  });

  factory LoadUserResponse.fromJson(Map<String, dynamic> json) =>
      _$LoadUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoadUserResponseToJson(this);
}
