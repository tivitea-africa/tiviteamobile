enum CreateListingType { workSpace, workTool, otherListing }

extension ListingTypeExt on CreateListingType {
  String get requestBodyName => switch (this) {
        CreateListingType.workSpace => 'Co-working Space',
        CreateListingType.workTool => 'Work Tool',
        CreateListingType.otherListing => 'Other Listing',
      };
}

enum PricingType { fixed, hourly }

extension PricingTypeExt on PricingType {
  static List<String> get stringValues =>
      PricingType.values.map((value) => value.name).toList();
}
