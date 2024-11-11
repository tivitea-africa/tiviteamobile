import 'package:json_annotation/json_annotation.dart';

part 'edit_profile_model.g.dart';

@JsonSerializable()
class EditProfileModel {
  @JsonKey(name: 'phone_number')
  final String? phoneNumber;

  EditProfileModel({this.phoneNumber});

  factory EditProfileModel.fromJson(Map<String, dynamic> json) =>
      _$EditProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$EditProfileModelToJson(this);
}