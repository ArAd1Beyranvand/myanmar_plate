import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myanmar_plate/myanmar_plate.dart';
import 'package:plate_core/plate_core.dart';

/// One golden per category, drawn with real bold faces so the ink can be
/// measured against the references (`platekit golden-check`).
///
/// Regenerate with `flutter test --update-goldens` after a deliberate change.
void main() {
  setUpAll(() async {
    final FontLoader loader = FontLoader('Roboto');
    for (final String path in const <String>[
      '/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf',
    ]) {
      final File face = File(path);
      if (!face.existsSync()) continue;
      loader.addFont(face.readAsBytes().then((b) => ByteData.view(b.buffer)));
    }
    await loader.load();
  });

  /// category id -> (spec, theme, space-separated sample value)
  final Map<String, (PlateSpec, PlateTheme, String)> cases =
      <String, (PlateSpec, PlateTheme, String)>{
        'private': (
          MyanmarPlates.private,
          MyanmarThemes.private,
          'M D Y 1 4 1 P 3 5 7 4 H O N D A  F I T         ',
        ),
        'hire': (
          MyanmarPlates.hire,
          MyanmarThemes.hire,
          'M D Y 8  7 R 3 5 7 4 M A N  T G X       ',
        ),
        'taxi': (
          MyanmarPlates.taxi,
          MyanmarThemes.hire,
          'Y G N 3 6 E E 5 2 2 9 T O Y O T A  P R O B O X ',
        ),
        'hearse': (
          MyanmarPlates.hearse,
          MyanmarThemes.hire,
          'T N I 1 0 H S E 3 8 8 7 T O Y O T A  A L P H A R D',
        ),
        'religious': (
          MyanmarPlates.religious,
          MyanmarThemes.religious,
          'Y G N 1 8 R L G 2 4 6 5 T O Y O T A  W I S H   ',
        ),
        'embossed_private': (
          MyanmarPlates.embossedPrivate,
          MyanmarThemes.embossedPrivate,
          'M D Y 9 F 2 4 8 6',
        ),
        'embossed_commercial': (
          MyanmarPlates.embossedCommercial,
          MyanmarThemes.embossedCommercial,
          'M D Y 8 L 1 4 9 3',
        ),
        'embossed_touring': (
          MyanmarPlates.embossedTouring,
          MyanmarThemes.embossedTouring,
          'M D Y 1 D 4 7 9 3',
        ),
        'organisation': (
          MyanmarPlates.organisation,
          MyanmarThemes.organisation,
          'Y G N I O 1 0 4 7',
        ),
        'motorcycle': (
          MyanmarPlates.motorcycle,
          MyanmarThemes.motorcycle,
          '2 3 က 1 2 3 4 5',
        ),
        'rickshaw': (
          MyanmarPlates.rickshaw,
          MyanmarThemes.rickshaw,
          'ဟ 0 0 1 2 3 4 5',
        ),
      };

  for (final MapEntry<String, (PlateSpec, PlateTheme, String)> c
      in cases.entries) {
    testWidgets(c.key, (tester) async {
      final (PlateSpec spec, PlateTheme theme, String values) = c.value;
      final PlateController controller = PlateController.fromValues(
        spec,
        values.split(' '),
      );
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 680,
                height: 300,
                child: PlateThemeScope(
                  theme: theme,
                  child: PlateView(
                    controller: controller,
                    theme: theme,
                    country: MyanmarCountry.myanmar,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(PlateView),
        matchesGoldenFile('goldens/mm_${c.key}.png'),
      );
      await tester.pumpWidget(const SizedBox.shrink());
      controller.dispose();
    });
  }
}
