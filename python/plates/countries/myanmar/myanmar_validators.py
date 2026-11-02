"""Port of myanmar_plate/lib/src/myanmar_validators.dart. Hand-ported; codegen never overwrites this file."""
from __future__ import annotations

import re
from plates.core.validators.plate_validator import GatedPlateValidator, PlateEntry, PlateValidation, is_digits_of_length


class MyanmarValidator(GatedPlateValidator):
    gate_group = "region"

    reason_region = "The region is not a Myanmar code."
    reason_township = "The township is out of range."
    reason_serial = "The number is four digits."

    _regions: dict[str, int] = {
        "AYY": 26,
        "BGO": 28,
        "CHN": 9,
        "KYH": 7,
        "KCN": 18,
        "KYN": 7,
        "MGY": 25,
        "MDY": 28,
        "MON": 10,
        "NPW": 8,
        "RKE": 17,
        "SGG": 37,
        "SHN": 55,
        "TNI": 10,
        "YGN": 45,
    }

    def judge(self, entry: PlateEntry) -> PlateValidation:
        region = entry.group("region")
        max_val = self._regions.get(region)
        if max_val is None:
            return PlateValidation.invalid(self.reason_region)
        township = entry.group("township").strip()
        if township:
            n = int(township) if is_digits_of_length(township, len(township)) else None
            if n is None or n < 1 or n > max_val:
                return PlateValidation.invalid(self.reason_township)
        if not is_digits_of_length(entry.group("serial"), 4):
            return PlateValidation.invalid(self.reason_serial)
        return PlateValidation.valid()


class MyanmarBurmeseValidator(GatedPlateValidator):
    gate_group = "letters"

    reason_letters = "The top row is three characters."
    reason_serial = "The number is five numerals."

    def judge(self, entry: PlateEntry) -> PlateValidation:
        letters = entry.group("letters")
        if len(letters) != 3:
            return PlateValidation.invalid(self.reason_letters)
        serial = entry.group("serial")
        if not is_digits_of_length(serial, 5):
            return PlateValidation.invalid(self.reason_serial)
        return PlateValidation.valid()
