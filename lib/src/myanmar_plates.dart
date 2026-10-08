import 'package:plate_alphabet/plate_alphabet.dart';
import 'package:plate_core/plate_core.dart';

import 'myanmar_country.dart';

/// One row of cells at a constant pitch: first cell's left edge, pitch, the
/// row's ink centre line and the slot height that reproduces its ink.
class _Row {
  const _Row(this.left, this.pitch, this.cy, this.box);
  final double left, pitch, cy, box;

  PlateBox cell(int i) => PlateBox(left + i * pitch, cy - box / 2, pitch, box);
}

/// The 2021 three-row plate: region and township over the serial over the
/// vehicle's make. Canvas 358×162 mm (the article's size); the flattened
/// photographs are already in these units.
///
/// Ink measured per photograph (y extents, plate units):
///
/// | row | private (`Current_Format`) | standard (`7R3574`, `Rlg2465`) |
/// |---|---|---|
/// | region | 11.2–38.2 (27; box 49, capped by the top edge) | 11.2–35 (24) |
/// | serial | 43–128.2 (85) | 50–117 (67) |
/// | make | 137.2–150.5 (13.5) | 132–150 (18) |
///
/// Box heights are ink / 0.525 (0.72 font size × a 0.73 digit cap). The private
/// serial would need a 162-unit slot, so it is capped at 150 and lands near
/// 93% of the reference. DejaVu's digits are wider than the plate's condensed
/// face, so `FittedBox` narrows them further at the 46-unit pitch.
class _ThreeRow {
  const _ThreeRow({
    required this.region,
    required this.serialLeft,
    required this.serialRight,
    required this.serialCy,
    required this.serialBox,
    required this.make,
    required this.makeCount,
  });

  /// Six cells: three letters, the dash, two township digits. Measured on the
  /// sheet: private 93–258, standard 114–244.
  final _Row region;
  final double serialLeft, serialRight, serialCy, serialBox;
  final _Row make;
  final int makeCount;
}

const _ThreeRow _private = _ThreeRow(
  region: _Row(93, 27.5, 24.6, 49),
  serialLeft: 18,
  serialRight: 340,
  serialCy: 85.6,
  serialBox: 150,
  make: _Row(57.5, 13.5, 143.8, 26),
  makeCount: 18,
);

const _ThreeRow _standard = _ThreeRow(
  region: _Row(114, 21.7, 23, 45),
  serialLeft: 14.2,
  serialRight: 343.5,
  serialCy: 83.5,
  serialBox: 128,
  make: _Row(60, 17, 141, 34),
  makeCount: 14,
);

/// The 2019 embossed two-row plate (region over serial), canvas 358×162.
///
/// Top ink 13–53 (cy 33; box capped at 64 by the plate edge), serial ink
/// 65–148 (cy 106; box capped at 110 by the bottom edge), averaged over the
/// private, commercial, touring and organisation photographs. `MDY` spans
/// 122–233 on the sheet; the serial spans 29.5–331.
const _Row _embossedRegion = _Row(122, 37, 33, 64);
const double _embossedSerialLeft = 29.5, _embossedSerialRight = 331;
const double _embossedSerialCy = 106, _embossedSerialBox = 110;

/// The older Burmese-script plates (motorcycle, rickshaw), canvas 254×162
/// (the photographs' 1.57 aspect on the 162 height). Three cells over five,
/// from the sheet: top 59–200, bottom 42–235.
const _Row _burmeseTop = _Row(59, 47, 41, 60);
const _Row _burmeseBottom = _Row(42, 38.6, 112, 100);

/// Myanmar's plates. Colour is the theme's.
///
/// Implemented: private, hire, taxi, hearse and religious on the 2021 layout
/// ([MyanmarThemes.private], [MyanmarThemes.hire] for hire, taxi and hearse,
/// [MyanmarThemes.religious]); the 2019 embossed private, commercial, touring
/// and organisation plates; and the Burmese-script motorcycle and rickshaw
/// plates.
///
/// Not implemented: the army plate (a star and bracketed Burmese numerals, no
/// format in the article), the volunteer-service (green) and embassy (white)
/// fields, which have no photograph, and the 1999 formats. The flag in the
/// article is not printed on any plate. The article names no Israel-specific
/// value.
abstract final class MyanmarPlates {
  static final PlateSpec private = _threeRow('mm.private', _private, 2);
  static final PlateSpec hire = _threeRow('mm.hire', _standard, 2);
  static final PlateSpec taxi = _threeRow('mm.taxi', _standard, 2);
  static final PlateSpec hearse = _threeRow('mm.hearse', _standard, 3);
  static final PlateSpec religious = _threeRow('mm.religious', _standard, 3);

  static final PlateSpec embossedPrivate = _embossed('mm.embossed_private');
  static final PlateSpec embossedCommercial = _embossed(
    'mm.embossed_commercial',
  );
  static final PlateSpec embossedTouring = _embossed('mm.embossed_touring');
  static final PlateSpec organisation = _embossed('mm.organisation');

  static final PlateSpec motorcycle = _burmese('mm.motorcycle');
  static final PlateSpec rickshaw = _burmese('mm.rickshaw');

  static List<PlateSpec> get all => <PlateSpec>[
    private,
    hire,
    taxi,
    hearse,
    religious,
    embossedPrivate,
    embossedCommercial,
    embossedTouring,
    organisation,
    motorcycle,
    rickshaw,
  ];

  static List<PlateSlot> _cells(PlateAlphabet a, _Row row, int from, int n) =>
      <PlateSlot>[
        for (int i = from; i < from + n; i++)
          PlateSlot(alphabet: a, box: row.cell(i)),
      ];

  /// `prefix` cells, a dash, four digits, spread across [left, right).
  static (List<PlateSlot>, List<PlateSlot>, PlateLabel) _serial({
    required int prefix,
    required double left,
    required double right,
    required double cy,
    required double box,
  }) {
    final double pitch = (right - left) / (prefix + 5);
    final _Row row = _Row(left, pitch, cy, box);
    return (
      _cells(MyanmarAlphabets.serialPrefix, row, 0, prefix),
      _cells(MyanmarAlphabets.digits, row, prefix + 1, 4),
      PlateLabel(text: '-', box: row.cell(prefix), glyphHeight: box),
    );
  }

  static PlateSpec _threeRow(String id, _ThreeRow p, int prefix) {
    final (pre, digits, dash) = _serial(
      prefix: prefix,
      left: p.serialLeft,
      right: p.serialRight,
      cy: p.serialCy,
      box: p.serialBox,
    );
    final List<PlateSlot> slots = <PlateSlot>[
      ..._cells(MyanmarAlphabets.letters, p.region, 0, 3),
      ..._cells(MyanmarAlphabets.digits, p.region, 4, 2),
      ...pre,
      ...digits,
      ..._cells(MyanmarAlphabets.model, p.make, 0, p.makeCount),
    ];
    int at = 0;
    List<int> take(int n) => <int>[for (int i = 0; i < n; i++) at++];
    return _spec(
      id,
      358,
      162,
      slots,
      <PlateTextGroup>[
        PlateTextGroup(take(3), key: 'region'),
        PlateTextGroup(take(2), key: 'township'),
        PlateTextGroup(take(prefix), key: 'prefix'),
        PlateTextGroup(take(4), key: 'serial'),
        PlateTextGroup(take(p.makeCount), key: 'make'),
      ],
      <PlateLabel>[
        PlateLabel(text: '-', box: p.region.cell(3), glyphHeight: p.region.box),
        dash,
      ],
    );
  }

  static PlateSpec _embossed(String id) {
    final (pre, digits, dash) = _serial(
      prefix: 2,
      left: _embossedSerialLeft,
      right: _embossedSerialRight,
      cy: _embossedSerialCy,
      box: _embossedSerialBox,
    );
    final List<PlateSlot> slots = <PlateSlot>[
      ..._cells(MyanmarAlphabets.letters, _embossedRegion, 0, 3),
      ...pre,
      ...digits,
    ];
    return _spec(
      id,
      358,
      162,
      slots,
      <PlateTextGroup>[
        PlateTextGroup(<int>[0, 1, 2], key: 'region'),
        PlateTextGroup(<int>[3, 4], key: 'prefix'),
        PlateTextGroup(<int>[5, 6, 7, 8], key: 'serial'),
      ],
      <PlateLabel>[dash],
    );
  }

  static PlateSpec _burmese(String id) => _spec(
    id,
    254,
    162,
    <PlateSlot>[
      ..._cells(MyanmarAlphabets.burmeseMixed, _burmeseTop, 0, 3),
      ..._cells(MyanmarAlphabets.burmeseDigits, _burmeseBottom, 0, 5),
    ],
    <PlateTextGroup>[
      PlateTextGroup(<int>[0, 1, 2], key: 'letters'),
      PlateTextGroup(<int>[3, 4, 5, 6, 7], key: 'serial'),
    ],
    const <PlateLabel>[],
  );

  static PlateSpec _spec(
    String id,
    double width,
    double height,
    List<PlateSlot> slots,
    List<PlateTextGroup> groups,
    List<PlateLabel> labels,
  ) => PlateSpec(
    id: id,
    country: MyanmarCountry.myanmar,
    canvasWidth: width,
    canvasHeight: height,
    panel: const PlatePanel(box: PlateBox(0, 0, 0, 0)),
    noPanel: true,
    slots: slots,
    textGroups: groups,
    labels: labels,
  );
}
