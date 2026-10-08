import 'package:flutter/widgets.dart';

/// Colours of the Myanmar plates, each the median of the stroke interiors or
/// field of one colour-balanced, flattened photo (`platekit` brief).
///
/// The 2021 plates are printed flat; the 2019 embossed plates are the older
/// photographs and carry glare, so their inks are greyer. The article's
/// "green" volunteer-service and white embassy fields have no photograph and
/// are not implemented.
abstract final class MyanmarColors {
  /// Private field, `Myanmar_License_Plate_Current_Format`: `000000`.
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);

  /// Hire, taxi and hearse field, `7R3574`: `9B0014`.
  static const Color red = Color(0xFF9B0014);

  /// Religious field, `Rlg2465`: `FFB400`.
  static const Color yellow = Color(0xFFFFB400);

  /// Embossed private, `Myanmar_plate_private_black_2019`: `222321` / `D9DBDC`.
  static const Color embossedBlack = Color(0xFF222321);
  static const Color embossedBlackInk = Color(0xFFD9DBDC);

  /// Embossed commercial, `..._commercial_red_2019`: `E73152` / `C9D8EB`.
  static const Color embossedRed = Color(0xFFE73152);
  static const Color embossedRedInk = Color(0xFFC9D8EB);

  /// Embossed touring, `..._touring_blue_2019`: `255F94` / `F1EDE6`.
  static const Color embossedBlue = Color(0xFF255F94);
  static const Color embossedBlueInk = Color(0xFFF1EDE6);

  /// Organisations, `Io1047`: `C6C1AB` / `48453A`.
  static const Color organisation = Color(0xFFC6C1AB);
  static const Color organisationInk = Color(0xFF48453A);

  /// Motorcycle, `..._motorcycle_2019`: `2E2E2F` / `EEEEEE`.
  static const Color motorcycle = Color(0xFF2E2E2F);
  static const Color motorcycleInk = Color(0xFFEEEEEE);

  /// Rickshaw, `..._rickshaw_2019`: `98222D` / `F6F6F6`.
  static const Color rickshaw = Color(0xFF98222D);
  static const Color rickshawInk = Color(0xFFF6F6F6);

  static const Color inactive = Color(0xFF8A8A8A);
}
