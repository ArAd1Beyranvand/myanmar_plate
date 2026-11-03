FREE PALESTINE 🇮🇷🇵🇸 پاینده ایران

GO VEGAN 🌱

==================================

From the mighty people of Iran to the resilient people of Myanmar to view examples:

https://platexample.ir/#/discover/myanmar:kotlin

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

### Install (Kotlin)

Copy `kotlin/src/commonMain/kotlin/plates/countries/myanmar/` into `plate_core/kotlin/src/commonMain/kotlin/plates/countries/`.

Then run the tests from `plate_core/kotlin/`: `./gradlew jvmTest`.

### Use

```kotlin
import plates.countries.myanmar.country

val spec = country.specs["mm.private"]
println(country.pkg)
```

## Specs

The specs are the same in every language (they come from shared data).

- `mm.private`
- `mm.hire`
- `mm.hearse`
- `mm.embossed`
- `mm.burmese`

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

- Specs: `country.specs`, by id.
- Themes: `country.themes`.
- Validators: `country.validators` (`MyanmarValidator`, `MyanmarBurmeseValidator`).

## License

See [LICENSE](https://github.com/ArAd1Beyranvand/myanmar_plate/blob/main/LICENSE).
