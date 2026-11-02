## Unreleased

- Typed fields (region, township, serial, Burmese numerals) are one `PlateSlot` with a `length` instead of one slot per character. Chosen-alphabet cells (prefix, model, Burmese top row) stay one slot per symbol. A value is one string per slot: `['YGN', '36', 'A', 'B', '3456', 'T', 'O', …]`, `['MDY', '1', 'A', '2345']`.
