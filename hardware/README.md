# Hardware

This folder contains the core hardware definition for the `PCB Business Card Blinker` project.

## Build Target

- Power source: `1x CR2032`
- Input: `1x momentary push button`
- Outputs: `3x LEDs`
- Logic: no microcontroller, direct battery-powered LED circuit

## Files

- `schematic.md` high-level circuit design
- `connections.md` exact electrical connections
- `board-notes.md` PCB layout guidance

## First PCB Revision

Recommended first revision goals:

1. Keep the circuit fully passive.
2. Use one resistor per LED.
3. Place the battery holder on the back side.
4. Put LEDs and button on the front side for visual impact.
