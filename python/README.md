FREE PALESTINE 🇮🇷🇵🇸 پاینده ایران

GO VEGAN 🌱

==================================

From the mighty people of Iran to the resilient people of Myanmar to view examples:

https://platexample.ir/#/discover/myanmar:python

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

### Install (Python)

Copy `python/plates/countries/myanmar/` into `plate_core/python/plates/countries/`.

Then run the tests from `plate_core/python/`: `pytest`.

### Use

```python
from plates.countries.myanmar.data import SPECS, THEMES

spec = SPECS["mm.private"]
theme = THEMES["MyanmarThemes.private"]
print(spec.id)
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

- Pick a spec: use another key of `SPECS`.
- Pick a theme: use another key of `THEMES`.
- Validators: `VALIDATORS` maps the names `MyanmarValidator`, `MyanmarBurmeseValidator` to classes.

## License

See [LICENSE](https://github.com/ArAd1Beyranvand/myanmar_plate/blob/main/LICENSE).
