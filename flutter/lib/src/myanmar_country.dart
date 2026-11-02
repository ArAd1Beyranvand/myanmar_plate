import 'package:plate_core/plate_core.dart';

import 'myanmar_colors.dart';

/// Myanmar as a `PlateCountry`. The plates carry no country block, so every
/// spec sets `noPanel`.
abstract final class MyanmarCountry {
  static const PlateCountry myanmar = PlateCountry(
    code: 'mm',
    captionLines: <String>[],
    panelColor: MyanmarColors.black,
    panelTextColor: MyanmarColors.white,
  );
}
