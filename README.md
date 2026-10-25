# CampusPulse — Student Engagement & Dropout Risk Analytics

**A Data Science Case Study using R**

CampusPulse is a student-outcome analytics project developed to analyse student academic performance and identify patterns associated with student dropout, continued enrolment and graduation.

The project uses R programming to perform data preprocessing, exploratory data analysis, classification modelling, model evaluation and explainability.

## 1. Project Overview

The main objective of CampusPulse is to analyse student-related data and build machine learning models that classify students into three outcome categories:

- **Dropout**
- **Enrolled**
- **Graduate**

Two classification algorithms are compared under two different feature-availability scenarios to understand how academic information influences prediction performance.

## 2. Dataset

**Dataset:** Predict Students' Dropout and Academic Success

**Source:** UCI Machine Learning Repository  
**Dataset ID:** 697  
**DOI:** https://doi.org/10.24432/C5MC89

- [UCI Dataset Page](https://archive.ics.uci.edu/dataset/697/predict%2Bstudents%2Bdropout%2Band%2Bacademic%2Bsuccess)
- [Direct CSV Dataset](https://archive.ics.uci.edu/static/public/697/data.csv)

**Dataset dimensions:**
- Total records: 4,424
- Predictor variables: 36
- Target variable: 1
- Missing values: 0

## 3. Methodology

The project follows these stages:

1. Data collection and preprocessing
2. Data cleaning and transformation
3. Exploratory Data Analysis (EDA)
4. Feature selection and scenario preparation
5. Model training
6. Model evaluation
7. Feature importance analysis
8. LIME-based explainability

### Prediction Scenarios

**Scenario A — Admission-Time Prediction**

Uses admission-time and background information. First-semester and second-semester academic variables are excluded.

**Scenario B — First-Semester Prediction**

Uses Scenario A variables along with first-semester academic performance. Second-semester variables are excluded.

### Machine Learning Algorithms

- Multinomial Logistic Regression
- Random Forest Classifier

### Evaluation Metrics

- Accuracy
- Macro Precision
- Macro Recall
- Macro F1-Score
- Confusion Matrix

LIME (Local Interpretable Model-Agnostic Explanations) is used to interpret an individual model prediction.

## 4. Recorded Model Results

The following table presents the actual results obtained during the completed project analysis.

| Scenario | Model | Accuracy | Macro Precision | Macro Recall | Macro F1 |
|---|---|---:|---:|---:|---:|
| A | Logistic Regression | 64.21% | 56.08% | 53.59% | 53.25% |
| A | Random Forest | 65.80% | 59.25% | 54.24% | 52.95% |
| B | Logistic Regression | 73.61% | 65.52% | 63.92% | 63.84% |
| B | Random Forest | **74.97%** | **68.72%** | **64.13%** | **63.90%** |

### Key Findings

- Scenario B Random Forest achieved the highest recorded accuracy of **74.97%**.
- Its macro F1-score was **63.90%**.
- Adding first-semester academic information improved overall model performance.
- The Enrolled category remained difficult to identify, with a recall of **21.52%** for Scenario B Random Forest.

These results demonstrate why accuracy should be considered alongside class-wise evaluation metrics.

## 5. Feature Importance and Explainability

Feature importance analysis identified the following leading predictors in Scenario B:

1. First-semester approved curricular units
2. First-semester grades
3. Course
4. Father's occupation
5. Tuition fees up to date

LIME was used to explain an individual Random Forest prediction. For the selected student record, the model predicted Dropout with a score of approximately **86.16%**.

Feature importance and LIME describe model behaviour; they do not establish causal relationships.

## 6. Technologies Used

- R Programming
- Google Colab
- RStudio-compatible R scripts
- Tidyverse
- Janitor
- Caret
- Nnet
- Random Forest
- LIME
- ggplot2
- R Markdown
- Git and GitHub

## 7. Repository Structure

```text
CampusPulse/
│
├── R/
│   ├── 00_packages.R
│   ├── 01_data_preparation.R
│   ├── 02_eda.R
│   ├── 03_model_training.R
│   ├── 04_model_evaluation.R
│   └── 05_lime_explainability.R
│
├── results/
│   ├── model_comparison_recorded.csv
│   └── Other evaluation outputs
│
├── report/
│   ├── CampusPulse_Final.Rmd
│   ├── CampusPulse_Project_Report.docx
│   └── CampusPulse_Project_Report.pdf
│
├── presentation/
│   └── CampusPulse_Final_Presentation.pptx
│
├── .gitignore
└── README.md
```

*Note: The repository files are currently being organised. The structure above represents the intended final organisation.*

## 8. Running the Project

The project can be executed in an R environment with the required packages installed.

Run the scripts in the following order:

```r
source("R/00_packages.R")

source("R/01_data_preparation.R")

source("R/02_eda.R")

source("R/03_model_training.R")

source("R/04_model_evaluation.R")

source("R/05_lime_explainability.R")
```

The scripts download the dataset directly from the UCI repository and generate local data and results files.

A fresh execution may produce slightly different results depending on the software environment and package versions. The recorded metrics above refer to the completed analysis.

## 9. Conclusion

CampusPulse demonstrates an end-to-end data science workflow for analysing student outcomes and developing predictive classification models using R.

Among the evaluated models, Scenario B Random Forest achieved the strongest recorded overall performance, with 74.97% accuracy and a 63.90% macro F1-score.

However, the relatively low recall for the Enrolled category highlights an important limitation. Further improvements, validation and careful evaluation are required before such a system could be considered for practical institutional use.

The project is intended as an academic decision-support study, not as an automated system for making decisions about individual students.

## 10. Author

**Kaleru Sriniketh**  
Roll Number: 160124771041  
B.Tech — Artificial Intelligence and Data Science  
Chaitanya Bharathi Institute of Technology (CBIT), Hyderabad

---

**Project Repository:**  
https://github.com/Kaleru07/CampusPulse
