/// Locates a Myanmar plate from its three-letter state/region code.
///
/// Source: the "Regional codes" table of
/// https://en.wikipedia.org/wiki/Vehicle_registration_plates_of_Myanmar
/// The article lists township numerals only as ranges with one example per
/// state, so the caption stops at the state or region.
abstract final class MyanmarRegions {
  static const Map<String, String> _codes = <String, String>{
    'AYY': 'Ayeyarwady',
    'BGO': 'Bago',
    'CHN': 'Chin',
    'KYH': 'Kayah',
    'KCN': 'Kachin',
    'KYN': 'Kayin',
    'MGY': 'Magway',
    'MDY': 'Mandalay',
    'MON': 'Mon',
    'NPW': 'Naypyitaw',
    'RKE': 'Rakhine',
    'SGG': 'Sagaing',
    'SHN': 'Shan',
    'TNI': 'Tanintharyi',
    'YGN': 'Yangon',
  };

  /// The state or region of [code] (one to three letters), or null when it
  /// matches no code or several (`K`, `KY`, `M`, `S`).
  static String? lookup(String code) {
    if (code.isEmpty) return null;
    final Set<String> names = <String>{
      for (final MapEntry<String, String> e in _codes.entries)
        if (e.key.startsWith(code)) e.value,
    };
    return names.length == 1 ? names.single : null;
  }

  static String? captionOf(String Function(String key) group) =>
      lookup(group('region'));
}
