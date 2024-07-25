# Grocery Store Database SQL Code

This repository contains the SQL code for implementing a database for a grocery store.

## Contents

The repository includes the following components:

1. **Data Definition Language (DDL)**
   - File(s) containing SQL code for creating database schema, tables, and relationships

2. **Data Manipulation Language (DML)**
   - File(s) with SQL code for inserting, updating, and deleting data

3. **Data Control Language (DCL)**
   - File(s) containing SQL code for managing user permissions and access control

4. **Queries**
   - File(s) with various SQL queries for data retrieval and analysis

5. **Executive Report**
   - A detailed document explaining the entire database implementation process

## Structure

grocery-store-db/
│
├── ddl/
│   └── schema.sql
│
├── dml/
│   └── data_operations.sql
│
├── dcl/
│   └── access_control.sql
│
├── dql/
│   └── analysis_queries.sql
│
├── docs/
│   └── executive_report.pdf
│
└── README.md



## Usage

To use this SQL code and set up the grocery store database:

1. **Set up your database management system**
   - Ensure you have a SQL-compatible DBMS installed (e.g., MySQL, PostgreSQL, SQL Server)

2. **Create the database**
   - Open your DBMS's command-line interface or GUI tool
   - Run the following command to create the database:
     ```sql
     CREATE DATABASE grocery_store;
     ```

3. **Execute the DDL script**
   - Navigate to the `ddl/` directory
   - Run the `schema.sql` file to create the tables and relationships:
     ```
     mysql -u username -p grocery_store < ddl/schema.sql
     ```
   (Replace `mysql` with your DBMS's command-line tool if different)

4. **Load initial data**
   - Navigate to the `dml/` directory
   - Execute the `data_operations.sql` file to insert initial data:
     ```
     mysql -u username -p grocery_store < dml/data_operations.sql
     ```

5. **Set up access control**
   - Navigate to the `dcl/` directory
   - Run the `access_control.sql` file to set up user permissions:
     ```
     mysql -u username -p grocery_store < dcl/access_control.sql
     ```

6. **Run queries**
   - Use the queries provided in the `queries/analysis_queries.sql` file as templates for your data analysis and retrieval needs

7. **Refer to the executive report**
   - For a comprehensive understanding of the database structure and implementation process, refer to the `executive_report.pdf` in the `docs/` directory
