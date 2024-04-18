# Pharmacy Claims Database Project
### ALY6030 - Data Warehousing and SQL - Northeastern University

This repository contains all the SQL scripts and documentation for the "Pharmacy Claims" final project. The project involves creating a comprehensive data warehouse schema optimized for analyzing pharmacy claims data, with a focus on normalization, primary and foreign key setup, and advanced SQL queries for analytics.

## Project Components

### Normalization
Created normalized tables to ensure efficient data storage without redundancy:
- **Member Dimension Table** (`dim_member.csv`): Stores unique member information.
- **Drug Dimension Table** (`dim_drug.csv`): Contains unique details of drugs.
- **Transaction Fact Table** (`fact_transaction.csv`): Captures transactions of medication being filled.

### Primary and Foreign Key Setup in MySQL
- **Primary keys** are used to ensure uniqueness within tables.
- **Foreign keys** link the fact table to dimension tables, with cascading updates and deletes to maintain data integrity.

### Entity Relationship Diagram (ERD)
The ERD provides a visual representation of the relationships between the tables in the database.

### Analytics and Reporting
SQL scripts for extracting insights from the data, such as the number of prescriptions per drug and detailed analysis based on member age groups. Examples include:
- Counts of total and unique prescriptions.
- Summation of copays and insurance payments.

### SQL Queries
- **Prescription Analysis**: Identifies the number of prescriptions per drug.
- **Age Group Analysis**: Segregates prescription data into age groups (65+ and under 65) and calculates total and unique prescriptions, copays, and insurance payments.
- **Recent Prescription Analysis**: Uses SQL window functions to find the most recent prescription details for each member.

## Data Insights
Provided specific insights like the frequency of prescriptions for the drug "Ambien" and detailed payment analysis for different age groups.

## References
Utilized authoritative resources to guide the SQL design choices and explanations, such as GeeksforGeeks, Mode, Simplilearn, and Cockroach Labs.

This project showcases the application of data warehousing concepts in a real-world-like scenario, emphasizing the importance of data structure, integrity, and analytical capabilities in healthcare data management.
