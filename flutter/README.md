FREE PALESTINE 🇮🇷🇵🇸 پاینده ایران

GO VEGAN 🌱

==================================

From the mighty people of Iran to the resilient people of Myanmar to view examples:

https://platexample.ir/#/discover/myanmar

# myanmar_plate

Myanmar's licence plates for the `plate_core` library. Private, hire, religious, embossed and Burmese-script plates, their themes, alphabets and advisory validators.

## Install

```yaml
dependencies:
  plate_core: ^0.12.0
  myanmar_plate: ^0.1.0
```

## Use

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

## Contains

- `MyanmarCountry` — country panel: `myanmar`.
- `MyanmarPlates` — 5 plate specs: `private`, `hire`, `hearse`, `embossed`, `burmese`.
- `MyanmarThemes` — 9 themes: `private`, `hire`, `religious`, `embossedPrivate`, `embossedCommercial`, `embossedTouring`, `organisation`, `motorcycle`, `rickshaw`.
- `MyanmarValidator` — advisory validator; flags the frame, never blocks a keystroke.
- `MyanmarBurmeseValidator` — advisory validator; flags the frame, never blocks a keystroke.
- `MyanmarRegions` — code table.

## Plates

Myanmar's plates. Colour is the theme's.

Not implemented: the army plate (no format in the article), the
volunteer-service (green) and embassy (white) fields, which have no
photograph, and the 1999 formats.

## Part of plate

Painted by [`plate_core`](https://pub.dev/packages/plate_core); alphabets shared through [`plate_alphabet`](https://pub.dev/packages/plate_alphabet); optional character picker in [`plate_keypad`](https://pub.dev/packages/plate_keypad).

