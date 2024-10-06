class AmenityModel {
  final String label;
  final bool isSelected;

  AmenityModel({required this.label, this.isSelected = false});

  AmenityModel copyWith({String? label, bool? isSelected}) {
    return AmenityModel(
      label: label ?? this.label,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
