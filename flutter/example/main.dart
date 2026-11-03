import 'package:flutter/widgets.dart';
import 'package:plate_core/plate_core.dart';
import 'package:myanmar_plate/myanmar_plate.dart';

void main() => runApp(
  PlateExampleApp(spec: MyanmarPlates.private, theme: MyanmarThemes.private),
);
