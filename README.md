# UTIL2000 - COBOL Utility Billing Program

## Overview
**UTIL2000** is a COBOL program that calculates and prints electric utility bills for three predefined customers.  
The program uses a tiered billing system based on kilowatt-hour (kWh) usage and adds a fixed service fee.

This project was created as part of a COBOL Chapter 2 assignment.

---

## Features
- Processes **3 predefined customers** (no tables or input files required)
- Uses **tiered kWh billing rates**
- Adds a fixed **service fee**
- Displays a formatted bill summary for each customer
- Uses COBOL working-storage fields and calculations

---

## Billing Rules
The program calculates charges using the following tiers:

| Tier | kWh Range       | Rate ($/kWh) |
|------|-----------------|--------------|
| 1    | 0 - 500         | $0.12        |
| 2    | 501 - 1000      | $0.15        |
| 3    | 1001 and above  | $0.18        |

A **service fee of $14.95** is added to every customer bill.

---

## Customers Included
The program includes three preset customers:

- **CUST-ALPHA** (350 kWh)
- **CUST-BRAVO** (925 kWh)
- **CUST-CHARLIE** (1350 kWh)

---

## Output
The program prints a bill report for each customer including:

- Customer Name
- kWh Used
- Service Fee
- Tier 1 Charge
- Tier 2 Charge
- Tier 3 Charge
- Total Bill

---

## Example Output
Below is an example of what the program prints when executed:

```text
********************************
*** UTIL2000 - CUSTOMER BILL ***
********************************

--------------------------------
CUSTOMER: CUST-ALPHA
--------------------------------
KWH USED       : 350
SERVICE FEE    : $14.95
TIER 1 CHARGE  : $42.00
TIER 2 CHARGE  : $0.00
TIER 3 CHARGE  : $0.00
--------------------------------
TOTAL BILL     : $56.95
--------------------------------

--------------------------------
CUSTOMER: CUST-BRAVO
--------------------------------
KWH USED       : 925
SERVICE FEE    : $14.95
TIER 1 CHARGE  : $60.00
TIER 2 CHARGE  : $63.75
TIER 3 CHARGE  : $0.00
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
