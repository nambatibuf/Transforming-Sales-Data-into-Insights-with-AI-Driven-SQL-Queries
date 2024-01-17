# Transforming-Sales-Data-into-Insights-with-AI-Driven-SQL-Queries

This project involves the transformation of sales data, normalization into BCNF form using PySpark, loading the data into PostgreSQL, and creating a local website for executing SQL queries in English.

## Introduction

The project aims to showcase the end-to-end process of handling sales data, from transformation to querying, with the added feature of language-based SQL queries through a local website. The technology stack includes PySpark, PostgreSQL, LangChain for language translation, and OpenAI for query generation.

## Dataset

The dataset used contains the following columns:

- ORDERNUMBER
- QUANTITYORDERED
- PRICEEACH
- ORDERLINENUMBER
- ORDERDATE
- STATUS
- QTR_ID
- MONTH_ID
- YEAR_ID
- PRODUCTLINE
- MSRP
- PRODUCTCODE
- CUSTOMERNAME
- PHONE
- ADDRESSLINE1
- ADDRESSLINE2
- CITY
- STATE
- POSTALCODE
- COUNTRY
- TERRITORY
- Employee_ID
- Employee_name
- salary
- sales
- Department

Data was preprocessed and transformed into BCNF form using PySpark.

## Data Transformation

PySpark was employed to ensure the data adheres to BCNF (Boyce-Codd Normal Form). The transformation process addressed normalization challenges to enhance data integrity.

## Database

The transformed data was bulk-loaded into PostgreSQL. To replicate the setup, follow these steps:

1. Setup PostgreSQL database.
2. Run the provided script to create tables.
3. Bulk load data into tables.

## ER - Diagram

![image](https://github.com/nambatibuf/Transforming-Sales-Data-into-Insights-with-AI-Driven-SQL-Queries/assets/130098870/b5a1b992-ad48-41eb-b0b9-6c202c98cf2b)

## Website

A local website was created to enable users to input English queries and receive SQL results. LangChain was utilized for language translation, converting user input to SQL-like queries. OpenAI's language capabilities were used for query generation.

Website:
![image](https://github.com/nambatibuf/Transforming-Sales-Data-into-Insights-with-AI-Driven-SQL-Queries/assets/130098870/2154d86b-c83d-4351-bfa3-6de391c33ba6)

Result:
![image](https://github.com/nambatibuf/Transforming-Sales-Data-into-Insights-with-AI-Driven-SQL-Queries/assets/130098870/d25259a7-1866-4c0a-9984-41e4d1da1cf9)

## Dependencies
PySpark
PostgreSQL
Flask
LangChain
OpenAI API
Other dependencies listed in requirements.txt

## Contributing
Contributions are welcome! If you find issues or have feature requests, please open an issue. Pull requests are encouraged.
```python
# Code snippet for running the website
Code: 
![image](https://github.com/nambatibuf/Transforming-Sales-Data-into-Insights-with-AI-Driven-SQL-Queries/assets/130098870/bb9a830e-9362-4fde-83e1-6e337f8bae39)
python app.py


