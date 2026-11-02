/// Myanmar's licence plates for the `plate_core` library.
///
/// Private, hire, religious, embossed and Burmese-script plates, their
/// themes, alphabets and advisory validators.
library;

// TODO(py): [D5] one module `plates.countries.myanmar`; assets via importlib.resources.
// TODO(ts): [D5] one subpath export `./countries/myanmar`; tree-shakable.
// TODO(kt): [D5] package `countries.myanmar` in the countries module.
export 'package:plate_alphabet/plate_alphabet.dart' show MyanmarAlphabets;
export 'src/myanmar_colors.dart';
export 'src/myanmar_country.dart';
export 'src/myanmar_plates.dart';
export 'src/myanmar_regions.dart';
export 'src/myanmar_themes.dart';
export 'src/myanmar_validators.dart';
