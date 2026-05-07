# UTIL2000 – Tiered Electric Utility Billing Program

**Course:** COBOL Programming – Chapter 2 Assignment
**Author:** [Gabe Dilley](https://github.com/gawdilley)
**GitHub:** [COBOL-Chapter-2-Assignment](https://github.com/gawdilley/COBOL-Chapter-2-Assignment)

---

## Description

UTIL2000 is a COBOL program that calculates and displays electric bills for three predefined customers using a tiered kilowatt-hour (kWh) rate system. A fixed service fee is added to each bill to produce the final total. The program demonstrates foundational COBOL concepts including structured program flow, arithmetic calculations, and formatted output.

---

## What the Program Does

### Input
The program uses three hardcoded customers, each with a predefined name and kWh usage:

| Customer | kWh Used |
|----------|----------|
| CUST-ALPHA | 350 kWh |
| CUST-BRAVO | 925 kWh |
| CUST-CHARLIE | 1,350 kWh |

### Processing
The program performs the following steps for each customer:

1. **Loads** the customer name, kWh usage, and fixed service fee (`$14.95`) into working storage.
2. **Separates** total kWh usage into up to three billing tiers:
   - **Tier 1** — first 500 kWh at `$0.12/kWh`
   - **Tier 2** — next 500 kWh (501–1000) at `$0.15/kWh`
   - **Tier 3** — any usage above 1,000 kWh at `$0.18/kWh`
3. **Calculates** the charge for each applicable tier.
4. **Computes** the subtotal (sum of all tier charges) and adds the service fee to produce the final bill total.
5. **Displays** a formatted bill to the terminal for each customer.

### Output
For each customer the program prints:
- Customer name
- kWh used
- Service fee
- Tier 1, 2, and 3 charges
- Total bill amount

---

## Example Output

```
********************************
*** UTIL2000 - CUSTOMER BILL ***
********************************

--------------------------------
CUSTOMER: CUST-ALPHA
--------------------------------
KWH USED       :   350
SERVICE FEE    : $14.95
TIER 1 CHARGE  : $42.00
TIER 2 CHARGE  :  $0.00
TIER 3 CHARGE  :  $0.00
--------------------------------
TOTAL BILL     : $56.95
--------------------------------

--------------------------------
CUSTOMER: CUST-BRAVO
--------------------------------
KWH USED       :   925
SERVICE FEE    : $14.95
TIER 1 CHARGE  : $60.00
TIER 2 CHARGE  : $63.75
TIER 3 CHARGE  :  $0.00
--------------------------------
TOTAL BILL     : $138.70
--------------------------------

--------------------------------
CUSTOMER: CUST-CHARLIE
--------------------------------
KWH USED       : 1,350
SERVICE FEE    : $14.95
TIER 1 CHARGE  : $60.00
TIER 2 CHARGE  : $75.00
TIER 3 CHARGE  : $63.00
--------------------------------
TOTAL BILL     : $212.95
--------------------------------
```

---

## New Concepts Used

- **Tiered conditional logic** — using nested `IF` statements to determine how much of a customer's kWh usage falls into each billing tier before applying the corresponding rate
- **Hardcoded data initialization** — loading predefined customer values directly into working-storage fields using `MOVE` statements rather than reading from an input file
- **Multi-step arithmetic** — breaking a billing calculation into distinct steps (tier charges → subtotal → total) using separate `COMPUTE` and `ADD` statements for clarity
- **`PERFORM` for reusable paragraphs** — calling a shared calculation and display paragraph once per customer rather than repeating the logic three times
- **Formatted numeric output** — using edited PIC clauses with `$`, commas, and decimal points to produce readable currency output on the terminal
- **`DISPLAY` for terminal output** — printing formatted bill lines directly to the screen rather than writing to an output file

---

## Authors

| Name | Profile |
|------|---------|
| Gabe Dilley | [GitHub](https://github.com/gawdilley) |
