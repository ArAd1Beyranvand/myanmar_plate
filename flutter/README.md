FREE PALESTINE 🇮🇷🇵🇸 پاینده ایران

GO VEGAN 🌱

==================================

From the mighty people of Iran to the resilient people of Myanmar to view examples:

https://platexample.ir/#/discover/myanmar:flutter

# myanmar_plate

Myanmar's licence plates for the plate_core library — private, hire, religious, embossed and Burmese-script plates, their themes, alphabets and advisory validators.

## Languages

| Language | Folder | Example |
| --- | --- | --- |
| Flutter / Dart | [`flutter/`](https://github.com/ArAd1Beyranvand/myanmar_plate/tree/main/flutter) | [platexample](https://platexample.ir/#/discover/myanmar:flutter) |
| Kotlin | [`kotlin/`](https://github.com/ArAd1Beyranvand/myanmar_plate/tree/main/kotlin) | [platexample](https://platexample.ir/#/discover/myanmar:kotlin) |
| Python | [`python/`](https://github.com/ArAd1Beyranvand/myanmar_plate/tree/main/python) | [platexample](https://platexample.ir/#/discover/myanmar:python) |
| TypeScript | [`typescript/`](https://github.com/ArAd1Beyranvand/myanmar_plate/tree/main/typescript) | [platexample](https://platexample.ir/#/discover/myanmar:typescript) |

## Quick start

### Install

```yaml
dependencies:
  plate_core: ^0.12.0
  myanmar_plate: ^0.1.0
```

### Use

```dart
import 'package:plate_core/plate_core.dart';
import 'package:myanmar_plate/myanmar_plate.dart';

PlateCanvas(
  spec: MyanmarPlates.private,
  theme: MyanmarThemes.private,
  validator: const MyanmarValidator(),
  autoValidate: true,
  onChooseCharacter: noCharacterChooser,
);
```

## Specs

Each spec is one plate layout.

- `MyanmarPlates.private`
- `MyanmarPlates.hire`
- `MyanmarPlates.hearse`
- `MyanmarPlates.embossed`
- `MyanmarPlates.burmese`

## Themes

- `MyanmarThemes.private`
- `MyanmarThemes.hire`
- `MyanmarThemes.religious`
- `MyanmarThemes.embossedPrivate`
- `MyanmarThemes.embossedCommercial`
- `MyanmarThemes.embossedTouring`
- `MyanmarThemes.organisation`
- `MyanmarThemes.motorcycle`
- `MyanmarThemes.rickshaw`

## Change it

`PlateCanvas` takes `spec:` (an entry of `MyanmarPlates`) and `theme:` (an entry of `MyanmarThemes`). Set `validator:` to `MyanmarValidator()` and `autoValidate: true` to show validation hints.

## Also included

- `MyanmarCountry` — the country panel.
- `MyanmarValidator` — the plate validator.
- `MyanmarRegions` — code table.

## Plates

Myanmar's plates. Colour is the theme's.

Not implemented: the army plate (no format in the article), the
volunteer-service (green) and embassy (white) fields, which have no
photograph, and the 1999 formats.

## Part of plate

Painted by [`plate_core`](https://pub.dev/packages/plate_core); alphabets shared through [`plate_alphabet`](https://pub.dev/packages/plate_alphabet); optional character picker in [`plate_keypad`](https://pub.dev/packages/plate_keypad).

## License

See [LICENSE](https://github.com/ArAd1Beyranvand/myanmar_plate/blob/main/LICENSE).
