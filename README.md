# UTIL2000 - Tiered Electric Utility Billing Program

## 📌 Overview
**UTIL2000** is a COBOL utility billing program that calculates and displays electric bills for three predefined customers.  
The program uses a tiered kilowatt-hour (kWh) rate system and adds a fixed service fee to produce the final bill total.

This project was created as part of a COBOL Chapter 2 assignment to demonstrate foundational COBOL programming concepts such as structured program flow, arithmetic calculations, and formatted output.

---

## 🛠️ What the Program Does
The program performs the following steps:

1. **Displays a program heading**
   - Prints a title header to the terminal output.

2. **Loads customer billing information**
   - Customer name
   - kWh usage amount
   - Service fee

3. **Calculates tiered kWh usage**
   The program separates total kWh usage into three possible tiers:
   - **Tier 1:** First 500 kWh
   - **Tier 2:** Next 500 kWh (kWh 501–1000)
   - **Tier 3:** Any usage above 1000 kWh

4. **Calculates charges per tier**
   The program applies billing rates based on the tier rules:
   - Tier 1 rate = $0.12 per kWh
   - Tier 2 rate = $0.15 per kWh
   - Tier 3 rate = $0.18 per kWh

5. **Computes subtotal and final bill total**
   - Subtotal = Tier 1 charge + Tier 2 charge + Tier 3 charge
   - Total bill = Subtotal + Service fee

6. **Displays a formatted bill for each customer**
   The program prints a complete bill breakdown showing:
   - Customer name
   - kWh used
   - Service fee
   - Tier 1 charge
   - Tier 2 charge
   - Tier 3 charge
   - Total bill

---

## 💡 Billing Rules
The program uses the following billing tiers:

| Tier | kWh Range       | Rate ($/kWh) |
|------|-----------------|--------------|
| 1    | 0 - 500         | $0.12        |
| 2    | 501 - 1000      | $0.15        |
| 3    | 1001 and above  | $0.18        |

A fixed **service fee of $14.95** is added to every customer bill.

---

## 📌 Customers Included
The program processes these three predefined customers:

- **CUST-ALPHA** (350 kWh)
- **CUST-BRAVO** (925 kWh)
- **CUST-CHARLIE** (1350 kWh)

---

## 🖥️ Example Output
When the program runs, it prints a formatted report similar to the following:

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


## 👤 Author
**Gabriel Dilley**
- GitHub: [gawdilley](https://github.com/gawdilley)
