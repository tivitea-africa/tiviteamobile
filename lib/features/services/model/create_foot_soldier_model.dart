import 'package:json_annotation/json_annotation.dart';

part 'create_foot_soldier_model.g.dart';

@JsonSerializable()
class CreateFootSoldierModel {
  @JsonKey(name: 'first_name')
  final String? firstName;
  
  @JsonKey(name: 'last_name')
  final String? lastName;
  
  final String? email;
  
  @JsonKey(name: 'phone_number')
  final String? phoneNumber;
  
  final String? address;

  CreateFootSoldierModel({
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.address,
  });

  factory CreateFootSoldierModel.fromJson(Map<String, dynamic> json) => 
      _$CreateFootSoldierModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateFootSoldierModelToJson(this);
}