import 'package:json_annotation/json_annotation.dart';

part 'change_password_model.g.dart';

@JsonSerializable()
class ChangePasswordModel {
  @JsonKey(name: 'old_password')
  final String? oldPassword;

  @JsonKey(name: 'new_password')
  final String? newPassword;

  @JsonKey(name: 'confirm_password')
  final String? confirmPassword;

  ChangePasswordModel({
    this.oldPassword,
    this.newPassword,
    this.confirmPassword,
  });

  factory ChangePasswordModel.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChangePasswordModelToJson(this);

}