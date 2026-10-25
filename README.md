# CampusPulse — Student Engagement & Dropout Risk Analytics

A Data Science with R case study analysing student outcomes and comparing multinomial Logistic Regression and Random Forest for **Dropout**, **Enrolled**, and **Graduate**.

## Dataset
UCI Machine Learning Repository — *Predict Students' Dropout and Academic Success* (ID 697)  
Dataset page: https://archive.ics.uci.edu/dataset/697/predict%2Bstudents%2Bdropout%2Band%2Bacademic%2Bsuccess  
Direct CSV: https://archive.ics.uci.edu/static/public/697/data.csv  
DOI: https://doi.org/10.24432/C5MC89

The dataset contains 4,424 records, 36 predictors and one target column. The R scripts download the data; no dataset copy is committed.

## Scenarios
- **Scenario A:** admission-time/background variables; first- and second-semester variables excluded.
- **Scenario B:** Scenario A plus first-semester academic variables; second-semester variables excluded.

## Repository structure
```text
CampusPulse/
├── R/                 # data preparation, EDA, modelling, evaluation, LIME
├── results/           # recorded metrics and fresh-run outputs
├── report/            # R Markdown report
├── presentation/      # final slide deck
├── data/              # generated locally; ignored by Git
└── README.md
```

## Run
From the repository root in R or RStudio:
1. `source("R/00_packages.R")`
2. `source("R/01_data_preparation.R")`
3. `source("R/02_eda.R")`
4. `source("R/03_model_training.R")`
5. `source("R/04_model_evaluation.R")`
6. `source("R/05_lime_explainability.R")`

The scripts create local `data/` and `results/` outputs. A fresh run is a new model execution and can differ slightly from the historical results depending on package versions and random-number implementation.

## Recorded results from the completed project run
| Scenario | Model | Accuracy | Macro precision | Macro recall | Macro F1 |
|---|---|---:|---:|---:|---:|
| A | Multinomial Logistic Regression | 64.21% | 56.08% | 53.59% | 53.25% |
| A | Random Forest | 65.80% | 59.25% | 54.24% | 52.95% |
| B | Multinomial Logistic Regression | 73.61% | 65.52% | 63.92% | 63.84% |
| B | Random Forest | **74.97%** | **68.72%** | **64.13%** | **63.90%** |

Scenario B Random Forest's recorded class recall: Dropout 79.93%, Enrolled 21.52%, Graduate 90.93%. The Enrolled category remains a significant weakness.

These are recorded outputs from the completed analysis, not guaranteed results of a new run.

## Responsible use
Feature importance and LIME are explanatory tools for model behaviour, not causal evidence. The model should support human review and student support, not automate high-impact decisions.

## Author
**Kaleru Sriniketh** — Roll No. **160124771041**  
B.Tech, Artificial Intelligence and Data Science  
Chaitanya Bharathi Institute of Technology, Hyderabad
