import 'package:json_annotation/json_annotation.dart';

part 'book_workspace_model.g.dart';

@JsonSerializable()
class BookWorkSpaceModel {
  @JsonKey(name: 'pick_up_date')
  final String? pickUpDate;

  @JsonKey(name: 'return_date')
  final String? returnDate;

  @JsonKey(name: 'num_of_people')
  final int? numOfPeople;

  @JsonKey(name: 'sub_listing_id')
  final String? subListingId;

  BookWorkSpaceModel({
    this.pickUpDate,
    this.returnDate,
    this.numOfPeople,
    this.subListingId,
  });

  factory BookWorkSpaceModel.fromJson(Map<String, dynamic> json) =>
      _$BookWorkSpaceModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookWorkSpaceModelToJson(this);
}