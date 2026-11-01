# FixPoint Lab

A MySQL database for FixPoint Service AB, a fictional company that repairs
phones, laptops and tablets. Before this, the company kept their customers,
repair jobs and spare parts in separate CSV files. We built a database that
connects everything, so they can follow a repair from the customer and device
to the technician and the parts used.

This is a school assignment at Grit Academy.

**Group:** Albin Dyrenäs and Fatima Kanbar

## What you need

- MySQL 8.0.16 or newer (older versions don't support CHECK constraints)
- A way to run SQL files, for example MySQL Workbench or VS Code with a database extension

## How to recreate the database

Run the files in this order:

1. `sql/database.sql` – creates the database `fixpoint_lab` and all the tables
2. `sql/data.sql` – adds the client's data
3. `sql/reports.sql` – runs the five reports and our tests

`database.sql` starts by deleting the old database if it exists, so you can
run everything again from the start whenever you want.

You can also run them from the terminal:

```bash
mysql -u root -p < sql/database.sql
mysql -u root -p < sql/data.sql
mysql -u root -p < sql/reports.sql
```

## What's in the project
```
fixpoint-lab/
├── docs/
│   ├── data_decisions.md  data problems we found, keys and normalization
│   ├── er_diagram.md      ER diagram (Mermaid)
│   └── er_diagram.png     ER diagram as an image
├── raw_data/              the six CSV files we got from the client
└── sql/
    ├── data.sql           INSERT statements with the client's data
    ├── database.sql       tables, keys and ALTER TABLE
    └── reports.sql        reports A–E and tests
```
## About the data

The raw files had some missing and conflicting information. We didn't make up
anything the client didn't give us. Some rows were left out, and some were
imported with empty values. Every decision is explained in
`docs/data_decisions.md`.