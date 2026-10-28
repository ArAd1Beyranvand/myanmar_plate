import 'package:flutter/widgets.dart';
import 'package:plate_core/plate_core.dart';

import 'myanmar_colors.dart';

/// One ink on one field, the frame in the ink. The photographs show no frame
/// line on the 2021 plates and a pressed rim on the embossed ones, so the
/// border is a thin 0.015 of the height and the corners round at 0.04; neither
/// is measured. Taxi and hearse use [hire]: the article lists them on the same
/// red field.
abstract final class MyanmarThemes {
  static final PlateTheme private = _ink(
    MyanmarColors.black,
    MyanmarColors.white,
  );
  static final PlateTheme hire = _ink(MyanmarColors.red, MyanmarColors.white);
  static final PlateTheme religious = _ink(
    MyanmarColors.yellow,
    MyanmarColors.black,
  );

  static final PlateTheme embossedPrivate = _ink(
    MyanmarColors.embossedBlack,
    MyanmarColors.embossedBlackInk,
  );
  static final PlateTheme embossedCommercial = _ink(
    MyanmarColors.embossedRed,
    MyanmarColors.embossedRedInk,
  );
  static final PlateTheme embossedTouring = _ink(
    MyanmarColors.embossedBlue,
    MyanmarColors.embossedBlueInk,
  );
  static final PlateTheme organisation = _ink(
    MyanmarColors.organisation,
    MyanmarColors.organisationInk,
  );
  static final PlateTheme motorcycle = _ink(
    MyanmarColors.motorcycle,
    MyanmarColors.motorcycleInk,
  );
  static final PlateTheme rickshaw = _ink(
    MyanmarColors.rickshaw,
    MyanmarColors.rickshawInk,
  );
}

PlateTheme _ink(Color field, Color ink) => PlateTheme.monochrome(
  field: field,
  ink: ink,
  inactive: MyanmarColors.inactive,
  borderWidthRatio: 0.015,
  plateRadiusRatio: 0.04,
);
