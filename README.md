# Customer Support Tickets SQL Analysis

A beginner-friendly SQL project exploring customer support ticket data using PostgreSQL.

The analysis focuses on ticket volume, issue types, support channels, resolution times, and unresolved tickets.

## Project Overview

This project was completed as part of my SQL learning journey, with a focus on practicing data exploration and aggregation using PostgreSQL.

The analysis answers questions such as:

* How many support tickets are in the dataset?
* What are the most common issue types?
* How are tickets distributed across support channels?
* What is the average time between first response and resolution?
* How many tickets were resolved on the same day?
* How many tickets were recorded each month?
* How many tickets remain unresolved?

## Key Findings

* **8,469** total support tickets.
* **Refund requests** were the most common issue type, with **1,752 tickets**.
* **Email** had the highest number of tickets among the support channels, with **2,143 tickets**.
* The average time between first response and resolution was approximately **7 hours 35 minutes** for qualifying closed tickets.
* **1,307 tickets** were resolved on the same calendar day as the first response.
* **5,700 tickets** were unresolved.
* Ticket activity increased substantially from **175 records in May 2023 to 5,475 in June 2023**.

## Data Quality Observations

During the initial exploration, some data quality issues were identified.

For example, some closed tickets contain resolution timestamps that occur before the first response timestamp. These records were excluded from the resolution-time calculations.

The dataset also contains some inconsistent or placeholder text in descriptive fields. These observations were documented but were not extensively cleaned, as the main focus of this project was SQL exploration and aggregation.

## Tools

* PostgreSQL
* SQL
* pgAdmin
* GitHub

## Project Structure

```text
customer-support-tickets-sql-analysis/
│
├── data/
│   └── customer_support_tickets.csv
│
└── sql/
    └── customer_support_tickets_analysis.sql
```

## How to Run

1. Create a PostgreSQL database.
2. Create the `customer_support_tickets` table using the SQL script.
3. Import the CSV dataset into the table.
4. Run the analysis queries included in the SQL file.

## Dataset

Dataset source: Customer Support Ticket Dataset on Kaggle.

The dataset contains customer information, purchased products, ticket types, statuses, priorities, support channels, response timestamps, resolution timestamps, and customer satisfaction ratings.

## What I Practiced

This project helped me practice:

* `COUNT()`
* `AVG()`
* `GROUP BY`
* `ORDER BY`
* `LIMIT`
* `WHERE`
* `IS NOT NULL`
* Date and timestamp functions
* Timestamp arithmetic
* Basic data quality filtering
* Structuring SQL queries for analysis


