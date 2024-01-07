# Analyzing E-commerce Customer Behavior for Churn Prediction

## Overview
This project focuses on predicting customer churn within an e-commerce platform using advanced data mining techniques. Understanding customer behavior is pivotal in today's digital marketplace to enhance retention strategies and address churn. The primary goal is to explore an e-commerce dataset, predict churn, and derive actionable insights for better customer retention.

## Dataset
- **Source:** [Kaggle link](https://www.kaggle.com/datasets/ankitverma2010/ecommerce-customer-churn-analysis-and-prediction)
- **Size:** 5630 observations, 20 attributes
- **Nature:** Mix of categorical, numerical, and textual attributes capturing various facets of customer behavior and transactional information.

### Key Attributes
- `CustomerID`: Unique identifier
- `Churn`: Target variable (1 for churned, 0 for active)
- Other attributes like `Tenure`, `PreferredLoginDevice`, `PreferredPaymentMode`, `SatisfactionScore`, etc., crucial for understanding customer behavior and predicting churn.

## Methodology
- **Talend Data Preparation:** Exploratory analysis of dataset attributes to understand their impact on churn prediction.
- **Talend Data Integration:** Preprocessing, handling missing values, dropping irrelevant attributes, and transforming categorical variables for modeling.
- **SAS Enterprise Miner:** Building decision trees, Random Forest, and Gradient Boost models for churn prediction and comparison.

## Results & Insights
- **Model Comparison:** Decision Tree emerged as the most accurate for predicting churn, surpassing Random Forest and Gradient Boost.
- **Key Predictors:** Attributes like `Tenure`, `Complain`, `PreferredPaymentMode`, among others, significantly influence churn behavior.
- **Implications:** Insights aid in enhancing customer retention strategies, targeted marketing, and improving service quality.

## Usage
- Clone the repository and follow instructions in each tool's respective folder for replicating data preparation, preprocessing, and modeling steps.

For more examples, please refer to the [Documentation](https://github.com/jvloo/WQD7005_AA1/blob/main/WQD7005_Report/Report.pdf).

## Folder Structure
```
.
├── **WQD7005_AA1_Analysis** # Contains SAS e-Miner analysis & modeling scripts.
├── **WQD7005_AA1_Data_Integration** # Includes Talend Data Integration preprocessing scripts.
├── **WQD7005_Report**
├──── **Assessment.pdf** # The assessment requirement file of this project.
├──── **Report.pdf** # The documentation (report) file of this project.
├── **dataset**
├──── **E Commerce Dataset.xlsx** # Raw dataset in Excel format.
├──── **E Commerce Dataset.csv** # Raw dataset in CSV format.
├──── **E Commerce Dataset (processed).csv** # Preprocessed dataset in CSV format.
```

## Contact
Name: LOO JIA HAO
Student No: 17218692/1
Student Email: 17218692 (at) siswa (dot) um (dot) edu (dot) my

---
Feel free to explore each folder for detailed scripts, reports, and documentation related to specific phases of the project.
