# 🎬 Netflix Streaming ETL & Data Analysis

A complete **ETL and Analytics pipeline** on Netflix titles data, combining **Python for cleaning and preprocessing** with **SQL for structured analysis**. This project demonstrates how to transform raw streaming data into actionable insights.

---

## 📂 Data Source
The dataset is sourced from Kaggle:  
[Netflix Shows Dataset](https://www.kaggle.com/shivamb/netflix-shows)

---

## 🧹 Data Cleaning (Python)

Data preprocessing is done in `NetflixCleaning.ipynb`.  
Cleaning steps include:

- Handling nulls and missing values  
- Splitting multi-valued fields (genres, actors, directors)  
- Converting data types (dates, integers)  
- Standardizing date formats and durations  
- Removing duplicates and inconsistencies  

The cleaned CSV files are ready for import into MySQL.

---

## 🗂️ Database Schema

The dataset is normalized into the following tables:

- **shows** → Netflix titles metadata  
- **genres** / **show_genre** → Genre master and mapping table  
- **actors** / **show_actor** → Actor details and mapping table  
- **directors** / **show_director** → Director details and mapping table  

---

## 📊 Analysis Questions

This project answers **13 key business questions** about Netflix content:

1. What is the total count of titles available on Netflix?  
2. How many Movies vs. TV Shows are there?  
3. How many titles were released each year?  
4. Which countries have the highest number of titles?  
5. What are the most popular genres?  
6. What is the distribution of shows across different ratings?  
7. What is the average duration of Movies and TV Shows?  
8. Who are the most frequently appearing actors?  
9. Which directors are linked to the most titles?  
10. How has the number of new titles grown in recent years?  
11. What is the average movie duration by genre?  
12. What percentage of total content falls under each rating category?  
13. What are the monthly content addition trends over time?  

---

## 🚀 Usage

1. Run `NetflixCleaning.ipynb` to preprocess raw data and generate cleaned CSV files.  
2. Import cleaned CSVs into MySQL or your preferred SQL database.  
3. Use the data to perform analysis, answer the business questions, or extend queries.

---
