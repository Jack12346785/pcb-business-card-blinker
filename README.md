# PCB Business Card Blinker

A beginner-friendly electronics project for making a simple PCB business card with LEDs, a coin cell battery, and a push button.

## Overview

This project is designed as a Tier 4 starter build:

- Simple circuit
- Low component count
- No firmware required
- Target budget: $0-$50

The board acts like a business card, but pressing the button powers a small LED pattern. It is meant to teach the basics of PCB layout, LED current limiting, battery power, and simple switch input.

## Features

- Custom PCB business card format
- CR2032 coin cell power
- 2 to 6 LEDs
- Momentary push button activation
- Easy to assemble with through-hole or basic SMD parts

## Parts

| Part | Qty | Notes |
| --- | --- | --- |
| Custom PCB | 1 | Business card sized board |
| CR2032 battery holder | 1 | Through-hole or SMD |
| CR2032 battery | 1 | 3V coin cell |
| LEDs | 2-6 | Any standard indicator LEDs |
| Resistors | 2-6 | Current limiting for LEDs |
| Push button | 1 | Momentary switch |
| Optional power switch | 1 | Optional |

## Budget

Typical cost range depends on PCB quantity and shipping, but the project can usually stay within:

- Prototype build: $10-$50
- Reuse spare parts: $0-$20

## How It Works

The battery provides 3V power. When the button is pressed, current flows through the LEDs and their resistors, causing them to light up. The circuit is intentionally simple so the focus stays on layout and assembly.

## Build Goals

- Learn basic schematic design
- Learn PCB placement and routing
- Understand simple LED resistor sizing
- Create a functional showcase card

## Repository Structure

- `docs/` project notes and diagrams
- `hardware/` schematic, PCB, and export files

## Next Steps

1. Create the schematic
2. Lay out the PCB in a business card shape
3. Export Gerbers
4. Order boards
5. Assemble and test
