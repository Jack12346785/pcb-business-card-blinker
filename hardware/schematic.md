# Schematic

## Circuit Summary

This project uses a simple switched LED circuit powered directly from a `CR2032` coin cell.

When the push button is pressed, battery voltage is applied to three LED branches in parallel. Each branch has its own current-limiting resistor.

## Functional Blocks

### Power

- `BT1`: CR2032 battery holder
- `SW1`: momentary push button in series with the positive supply

### LED Branches

- `D1` + `R1`
- `D2` + `R2`
- `D3` + `R3`

Each LED branch connects from the switched positive rail to ground.

## Recommended Values

- `BT1`: `3V CR2032`
- `R1`, `R2`, `R3`: `220 ohm` to `330 ohm`
- `D1`, `D2`, `D3`: standard `3mm` or `0603/0805` LEDs

## Text Schematic

```text
BT1 (+) ---- SW1 ---- +V_SW ---- R1 ---- D1 ---- GND
                    |
                    +-------- R2 ---- D2 ---- GND
                    |
                    +-------- R3 ---- D3 ---- GND

BT1 (-) ------------------------------------ GND
```

## Notes

- Using separate resistors keeps LED brightness more predictable.
- A CR2032 cannot supply large current, so keep the LED count low.
- For a softer glow and better battery life, use `330 ohm` resistors.
