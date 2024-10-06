import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tivi_tea/features/services/model/amenity_model.dart';

part 'amenities_notifier.g.dart';

@riverpod
class AmenitiesNotifier extends _$AmenitiesNotifier {

  final List<AmenityModel> _defaultAmenities = [
    AmenityModel(label: '24 hours Electricity', isSelected: true),
    AmenityModel(label: 'Parking', isSelected: true),
    AmenityModel(label: 'Wifi', isSelected: true),
    AmenityModel(label: 'CCTV', isSelected: true),
    AmenityModel(label: 'Cafeteria', isSelected: true),
  ];
  @override
  List<AmenityModel> build() => _defaultAmenities;

  void toggleAmenity(String label) {
    state = state
        .map((amenity) => amenity.label == label
            ? amenity.copyWith(isSelected: !amenity.isSelected)
            : amenity)
        .toList();
  }

  void addNewAmenity(String newAmenity) {
    if (state.any((amenity) => amenity.label == newAmenity)) {
      return;
    }
    state = [...state, AmenityModel(label: newAmenity, isSelected: true)];
  }

  void removeAmenity(String label) {
    if (_defaultAmenities.any((amenity) => amenity.label == label)) {
      return;
    }
    state = state.where((amenity) => amenity.label != label).toList();
  }
}
