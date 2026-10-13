# SQL Lab Sheets (MySQL)

A beginner-friendly collection of SQL practice exercises organized into five lab sheets. The scripts cover database and table definition, data manipulation, SQL functions, operators, and joins.

## Contents

| File | Topics covered |
|---|---|
| `SQL_Lab_Sheet_1.sql` | DDL commands: `CREATE`, `ALTER`, and `DROP` |
| `SQL_Lab_Sheet_2.sql` | DML commands: `INSERT`, `UPDATE`, and `DELETE` |
| `SQL_Lab_Sheet_3.sql` | SQL functions: numeric, aggregate, character, conversion, and date functions |
| `SQL_Lab_Sheet_4.sql` | Arithmetic, logical, comparison, special, and set operators |
| `SQL_Lab_Sheet_5.sql` | Joins: `INNER`, `LEFT`, `RIGHT`, `CROSS`, `NATURAL`, self joins, and join-based aggregation |

## Requirements

- MySQL Server
- MySQL Workbench (recommended) or another MySQL-compatible SQL client

## How to run

1. Install and start MySQL Server.
2. Open MySQL Workbench and connect to your local MySQL instance.
3. Open one of the `.sql` files using **File → Open SQL Script**.
4. Review the script, then run the statements using the lightning-bolt **Execute** button.
5. Run the lab sheets in order if you are completing the exercises from the beginning.

> **Note:** Some statements may create, alter, or delete database objects or data. Review each script before executing it, and use a practice database rather than important data.

## Compatibility notes

These scripts are intended for MySQL. Set-operation support varies by MySQL version; `INTERSECT` and `EXCEPT` are supported in MySQL 8.0.31 and later. If you use an older version, those statements may need an alternative query.

## Learning goals

- Practice creating and modifying database structures.
- Insert, update, and delete table records.
- Use common SQL functions.
- Apply SQL operators in queries.
- Combine data from related tables using joins.

## License

Provided for educational and practice purposes. You may adapt the scripts for your coursework; follow your institution's rules for submitted work.

## Author

Add your name here before publishing the repository.
