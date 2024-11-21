import 'package:json_annotation/json_annotation.dart';

part 'book_work_tool_model.g.dart';

@JsonSerializable()
class BookWorkToolModel {
  @JsonKey(name: 'pick_up_date')
  final String? pickUpDate;

  @JsonKey(name: 'return_date')
  final String? returnDate;

  BookWorkToolModel({
    this.pickUpDate,
    this.returnDate,
  });

  factory BookWorkToolModel.fromJson(Map<String, dynamic> json) =>
      _$BookWorkToolModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookWorkToolModelToJson(this);
}