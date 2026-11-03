import 'package:myanmar_plate/myanmar_plate.dart';
import 'package:plate_core/testing.dart';

void main() {
  plateGoldens('mm', MyanmarCountry.myanmar, <String, PlateGoldenCase>{
    'private': (
      MyanmarPlates.private,
      MyanmarThemes.private,
      'MDY|14|1|P|3574|H|O|N|D|A| |F|I|T',
    ),
    'hire': (
      MyanmarPlates.hire,
      MyanmarThemes.hire,
      'MDY|8|7|R|3574|M|A|N| |T|G|X',
    ),
    'taxi': (
      MyanmarPlates.hire,
      MyanmarThemes.hire,
      'YGN|36|E|E|5229|T|O|Y|O|T|A| |P|R|O|B|O|X',
    ),
    'hearse': (
      MyanmarPlates.hearse,
      MyanmarThemes.hire,
      'TNI|10|H|S|E|3887|T|O|Y|O|T|A| |A|L|P|H|A|R|D',
    ),
    'religious': (
      MyanmarPlates.hearse,
      MyanmarThemes.religious,
      'YGN|18|R|L|G|2465|T|O|Y|O|T|A| |W|I|S|H',
    ),
    'embossed_private': (
      MyanmarPlates.embossed,
      MyanmarThemes.embossedPrivate,
      'MDY|9|F|2486',
    ),
    'embossed_commercial': (
      MyanmarPlates.embossed,
      MyanmarThemes.embossedCommercial,
      'MDY|8|L|1493',
    ),
    'embossed_touring': (
      MyanmarPlates.embossed,
      MyanmarThemes.embossedTouring,
      'MDY|1|D|4793',
    ),
    'organisation': (
      MyanmarPlates.embossed,
      MyanmarThemes.organisation,
      'YGN|I|O|1047',
    ),
    'motorcycle': (
      MyanmarPlates.burmese,
      MyanmarThemes.motorcycle,
      '2|3|က|12345',
    ),
    'rickshaw': (MyanmarPlates.burmese, MyanmarThemes.rickshaw, 'ဟ|0|0|12345'),
  }, separator: '|');
}
