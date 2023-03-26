class WaterSupplySystem {
  final String provinceOrCapital;
  final String districtOrCity;
  final String communeOrSangkat;
  final String village;
  final String createDate;
  final String category;
  final String createdBy;
  final String status;

  const WaterSupplySystem({
    required this.provinceOrCapital,
    required this.districtOrCity,
    required this.communeOrSangkat,
    required this.village,
    required this.createDate,
    required this.category,
    required this.createdBy,
    required this.status,
  });

  WaterSupplySystem copy({
    String? provinceOrCapital,
    String? districtOrCity,
    String? communeOrSangkat,
    String? village,
    String? createDate,
    String? category,
    String? createdBy,
    String? status,
  }) =>
      WaterSupplySystem(
        provinceOrCapital: provinceOrCapital ?? this.provinceOrCapital,
        districtOrCity: districtOrCity ?? this.districtOrCity,
        communeOrSangkat: communeOrSangkat ?? this.communeOrSangkat,
        village: village ?? this.village,
        createDate: createDate ?? this.createDate,
        category: category ?? this.category,
        createdBy: createdBy ?? this.createdBy,
        status: status ?? this.status,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is WaterSupplySystem &&
              runtimeType == other.runtimeType &&
              provinceOrCapital == other.provinceOrCapital &&
              districtOrCity == other.districtOrCity &&
              communeOrSangkat == other.communeOrSangkat &&
              village == other.village &&
              createDate == other.createDate &&
              category == other.category &&
              createdBy == other.createdBy &&
              status == other.status;

  @override
  int get hashCode => provinceOrCapital.hashCode ^ provinceOrCapital.hashCode ^ districtOrCity.hashCode ^ communeOrSangkat.hashCode ^
  village.hashCode ^ createDate.hashCode ^ category.hashCode ^ createdBy.hashCode ^ status.hashCode;
}