import 'package:plate_core/plate_core.dart';

/// The region codes of Table 2 and the highest township numeral each takes.
const Map<String, int> myanmarRegions = <String, int>{
  'AYY': 26, 'BGO': 28, 'CHN': 9, 'KYH': 7, 'KCN': 18, 'KYN': 7, 'MGY': 25, //
  'MDY': 28, 'MON': 10, 'NPW': 8, 'RKE': 17, 'SGG': 37, 'SHN': 55, 'TNI': 10,
  'YGN': 45,
};

/// Judges a plate with a `region` group (`YGN-36`) and a four-digit `serial`.
/// Reports, never bars a keystroke. The township, where the plate has one, is
/// checked against its region's range.
class MyanmarValidator extends GatedPlateValidator {
  const MyanmarValidator();

  @override
  String get gateGroup => 'region';

  static const String reasonRegion = 'The region is not a Myanmar code.';
  static const String reasonTownship = 'The township is out of range.';
  static const String reasonSerial = 'The number is four digits.';

  @override
  PlateValidation judge(PlateEntry entry) {
    final String region = entry.group('region');
    final int? max = myanmarRegions[region];
    if (max == null) return const PlateValidation.invalid(reasonRegion);
    final String township = entry.group('township').trim();
    if (township.isNotEmpty) {
      final int? n = int.tryParse(township);
      if (n == null || n < 1 || n > max) {
        return const PlateValidation.invalid(reasonTownship);
      }
    }
    if (!isDigitsOfLength(entry.group('serial'), 4)) {
      return const PlateValidation.invalid(reasonSerial);
    }
    return const PlateValidation.valid();
  }
}

/// Judges a Burmese-script motorcycle or rickshaw plate: three characters over
/// five numerals.
class MyanmarBurmeseValidator extends GatedPlateValidator {
  const MyanmarBurmeseValidator();

  @override
  String get gateGroup => 'letters';

  static const String reasonLetters = 'The top row is three characters.';
  static const String reasonSerial = 'The number is five numerals.';

  @override
  PlateValidation judge(PlateEntry entry) {
    if (entry.group('letters').length != 3) {
      return const PlateValidation.invalid(reasonLetters);
    }
    if (!isDigitsOfLength(entry.group('serial'), 5)) {
      return const PlateValidation.invalid(reasonSerial);
    }
    return const PlateValidation.valid();
  }
}
