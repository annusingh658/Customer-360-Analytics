# Customer 360 Analytics & AI-Powered Churn Prediction

## 📌 Project Overview

Customer 360 Analytics is an end-to-end data analytics and machine learning project that provides a 360-degree view of customer behavior, sales performance, product performance, and customer churn risk.

The project follows a structured data warehouse approach using a Star Schema model, where transactional data is organized into fact and dimension tables for efficient analysis.

The solution integrates SQL, Python, Machine Learning, and Power BI to transform raw business data into actionable insights and support data-driven decision making.

The project performs data cleaning, customer segmentation using RFM analysis, business analysis through SQL queries, AI-powered customer churn prediction, and interactive Power BI dashboards for customer, product, and sales intelligence.


---

# 🎯 Business Problem

Businesses need answers to important questions:

- Who are the most valuable customers?
- Which customers are likely to churn?
- Which products generate maximum revenue and profit?
- Which customer segments contribute the most revenue?
- Which cities and categories need more attention?

This project solves these problems using analytics, visualization, and AI-based prediction.

---

# 🏗️ Project Architecture
Raw Business Data
|
↓
SQL Database + Star Schema ETL
|
↓
Python Data Cleaning & Feature Engineering
|
↓
RFM Customer Segmentation
|
↓
Machine Learning Churn Prediction
|
↓
Power BI Customer 360 Analytics Dashboard
   
---

# ⭐ Data Warehouse Design (Star Schema)

The project follows a Star Schema data model to organize analytical data efficiently.

The schema consists of a central fact table connected with multiple dimension tables. This structure improves query performance and supports business intelligence reporting.

## Star Schema Architecture
                    dim_customer
             ------------
             customer_id
             age
             gender
             city
             customer_segment
             Segment
             Recency
             Frequency
             Monetary
             RFM_Score

                   |
                   |

             fact_sales
             ----------
             order_id
             customer_id
             product_id
             order_date
             revenue
             profit
             quantity

                   |

                   |

             dim_product
             -----------
             product_id
             product_name
             category    



## Fact Table

### fact_sales

The fact table stores transactional business data.

Contains:

- Order ID
- Customer ID
- Product ID
- Order Date
- Quantity
- Revenue
- Profit


## Dimension Tables

### dim_customer

Stores customer-related information:

- Customer ID
- Age
- Gender
- City
- Customer Segment
- RFM Segmentation


### dim_product

Stores product-related information:

- Product ID
- Product Name
- Category


## Benefits of Star Schema

- Faster analytical queries
- Simplified reporting structure
- Efficient Power BI data modeling
- Better organization of business data
- Supports customer, product, and revenue analysis

# 📂 Dataset Description

## Data Warehouse Structure

The project follows a Star Schema data warehouse design where `fact_sales` acts as the central fact table and `dim_customer` and `dim_product` act as dimension tables.

This structure helps organize transactional data efficiently and enables faster analytical queries for customer analysis, product performance, revenue analysis, and Power BI reporting

The project uses multiple datasets:

## Customers Dataset

Contains customer details:

- Customer ID
- Age
- Gender
- City
- Customer Segment
- Signup Date


## Orders Dataset

Contains transaction information:

- Order ID
- Customer ID
- Product ID
- Order Date
- Quantity
- Revenue
- Profit


## Products Dataset

Contains product details:

- Product ID
- Product Name
- Category


## Customer Churn Prediction Dataset

Generated using Machine Learning:

- Customer ID
- Churn Prediction
- Churn Probability
- Risk Level

---

# 🛠️ Technologies Used

## Database

- MySQL
- SQL Queries
- ETL Processing


## Programming

- Python
- Pandas
- NumPy


## Machine Learning

Algorithm:

- Random Forest Classifier


Features Used:

- Age
- Recency
- Frequency
- Monetary
- RFM Score


Model Output:

- Churn Prediction
- Churn Probability
- Customer Risk Level


## Visualization

- Microsoft Power BI
- DAX Measures


---

# 🔄 Data Processing Workflow

## 1. Data Cleaning

Performed using Python:

- Data quality checks
- Missing value handling
- Data type conversion
- Data preprocessing


## 2. Customer Segmentation (RFM Analysis)

Customer behavior was analyzed using:

### Recency

How recently a customer purchased.


### Frequency

How frequently a customer purchases.


### Monetary

How much money a customer spends.


Customer segments created:

- Champions
- Loyal Customers
- Potential Loyal Customers
- At Risk Customers


---

# 🤖 Machine Learning Model

## Churn Prediction Model

Algorithm Used:

- Random Forest Classifier

The model predicts customer churn behavior and generates churn probability scores to classify customers into risk categories.


Input Features:


Age
Recency
Frequency
Monetary
RFM Score


Predictions Generated:

Churn Prediction
Churn Probability
Risk Level



The model identifies customers who have a higher probability of leaving and helps businesses take preventive actions.

---

# 📊 Power BI Dashboards

The project contains four interactive dashboards.

---

# 1. Executive Sales Dashboard

This dashboard provides an overview of overall business performance.


## KPIs:

- Total Revenue
- Total Orders
- Total Profit
- Profit Margin


## Visualizations:

- Monthly Revenue Trend
- Revenue by Customer Segment
- Revenue by Category
- Top 10 Customers by Revenue


## Business Insights:

- Tracks business growth
- Identifies high-value customers
- Understands revenue contribution
- Measures profitability


---

# 2. Customer Analytics Dashboard

This dashboard focuses on customer behavior and customer value.


## KPIs:

- Total Customers
- Customer Revenue
- Customer Profit
- Average Revenue per Customer


## Visualizations:

- Customer Value Analysis
- Customer Distribution by City
- City Wise Revenue Analysis
- Customer RFM Segmentation


## Business Insights:

- Identifies valuable customers
- Understands customer distribution
- Segments customers based on purchasing patterns
- Helps improve customer engagement


---

# 3. Product Analytics Dashboard

This dashboard analyzes product and category performance.


## KPIs:

- Total Revenue
- Total Profit
- Profit Margin
- Loss Products Count


## Visualizations:

- Top 10 Products by Revenue
- Top 10 Products by Profit
- Category Performance
- Loss-Making Products


## Business Insights:

- Finds best-performing products
- Identifies profitable categories
- Detects loss-making products
- Supports product optimization


---

# 4. AI Customer Intelligence Dashboard

This dashboard combines Machine Learning predictions with customer analytics.


## KPIs:

- Customer Count
- Average Churn Probability
- High Risk Customers


## Visualizations:

- City Wise Churn Risk
- Customer Risk Distribution
- High Risk Customer Analysis


## Machine Learning Insights:

The dashboard displays:

- Customers likely to churn
- Churn probability percentage
- Customer risk category


## Business Insights:

- Helps identify customers at risk
- Supports retention strategies
- Enables AI-driven customer decisions


---

# 📁 Project Structure
Customer-360-Analytics

│── README.md

├── Dataset
│ ├── customers.csv
│ ├── orders.csv
│ ├── products.csv
│ ├── customer_data.csv
│ └── customer_churn_prediction.csv

├── ML
│ └── churn_model.pkl

├── PowerBI
│ └── Customer360Analytics.pbix

├── Python
│ ├── data_cleaning.ipynb
│ ├── customer_churn_prediction.ipynb
│ └── churn_prediction.ipynb

└── SQL
  └── customer_analysis_queries.sql


---

# 📈 Key Outcomes

This project helps organizations:

- Understand customer behavior
- Identify high-value customers
- Predict customer churn risk
- Improve retention strategies
- Analyze product profitability
- Make data-driven business decisions


---

# 🚀 Future Enhancements

Future improvements:

- Deploy ML model using Flask/FastAPI
- Create real-time churn prediction API
- Add recommendation system
- Automate ETL pipelines
- Connect Power BI with live database


---

# 👨‍💻 Project Technologies

- SQL
- MySQL
- Python
- Pandas
- NumPy
- Scikit-Learn
- Random Forest
- Power BI
- DAX
