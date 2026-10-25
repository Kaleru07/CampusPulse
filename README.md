# Results and interpretation

`model_comparison_recorded.csv` stores the metrics from the completed project run. The R scripts create separate `*_fresh_run` outputs when executed again; these should not be confused with the recorded run.

Confusion matrices follow the convention: rows are predicted classes and columns are actual/reference classes.

Recorded Scenario B Random Forest confusion matrix:

| Predicted / Actual | Dropout | Enrolled | Graduate |
|---|---:|---:|---:|
| Dropout | 227 | 52 | 27 |
| Enrolled | 16 | 34 | 13 |
| Graduate | 41 | 72 | 401 |

Recorded class recall: Dropout 79.93%, Enrolled 21.52%, Graduate 90.93%. The Enrolled class is the principal weakness.
