enum CreateListingType { workSpace, workTool, otherListing }

extension ListingTypeExt on CreateListingType {
  String get requestBodyName => switch (this) {
        CreateListingType.workSpace => 'Co-working space',
        CreateListingType.workTool => 'Work tool',
        CreateListingType.otherListing => 'Other listing',
      };
}

extension ListingTypeExt2 on String {
  CreateListingType get enumType => switch (this) {
        'Co-working space' => CreateListingType.workSpace,
        'Work tool' => CreateListingType.workTool,
        'Other listing' => CreateListingType.otherListing,
        _ => CreateListingType.workSpace,
      };
}

enum PricingType { fixed, hourly }

enum PartnerListingStatus { published, draft }

extension PricingTypeExt on PricingType {
  static List<String> get stringValues =>
      PricingType.values.map((value) => value.name).toList();
}
