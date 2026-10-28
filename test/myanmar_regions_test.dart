import 'package:flutter_test/flutter_test.dart';
import 'package:myanmar_plate/myanmar_plate.dart';
import 'package:plate_core/plate_core.dart';

void main() {
  test('a full code names the state or region', () {
    expect(MyanmarRegions.lookup('YGN'), 'Yangon');
    expect(MyanmarRegions.lookup('KCN'), 'Kachin');
    expect(MyanmarRegions.lookup('NPW'), 'Naypyitaw');
  });

  test('a prefix names it only when unambiguous', () {
    expect(MyanmarRegions.lookup('Y'), 'Yangon');
    expect(MyanmarRegions.lookup('KC'), 'Kachin');
    expect(MyanmarRegions.lookup('MG'), 'Magway');
    for (final String code in <String>['K', 'KY', 'M', 'S', '']) {
      expect(MyanmarRegions.lookup(code), isNull, reason: code);
    }
  });

  test('unissued codes name nothing', () {
    for (final String code in <String>['ABC', 'YGX', 'Z']) {
      expect(MyanmarRegions.lookup(code), isNull, reason: code);
    }
  });

  test('three-row and embossed plates follow each letter', () {
    for (final PlateSpec spec in <PlateSpec>[
      MyanmarPlates.private,
      MyanmarPlates.hearse,
      MyanmarPlates.embossed,
    ]) {
      final PlateController c = PlateController(spec: spec);
      expect(c.regionCaption, isNull, reason: spec.id);
      c.setGroup('region', 'S');
      expect(c.regionCaption, isNull, reason: spec.id);
      c.setGroup('region', 'SHN');
      expect(c.regionCaption, 'Shan', reason: spec.id);
      c.setGroup('region', 'SH');
      expect(c.regionCaption, 'Shan', reason: spec.id);
    }
    expect(MyanmarPlates.burmese.resolveRegion, isNull);
  });
}
