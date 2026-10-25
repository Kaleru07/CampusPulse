source("R/03_model_training.R")
library(lime)

set.seed(123)
lime_train <- train_b[, setdiff(names(train_b), "target"), drop = FALSE]
lime_test <- test_b[, setdiff(names(test_b), "target"), drop = FALSE]
explainer <- lime::lime(x = lime_train, model = forest_b)

lime_result <- lime::explain(
  x = lime_test[1, , drop = FALSE],
  explainer = explainer,
  n_labels = 1,
  n_features = min(8, ncol(lime_test)),
  n_permutations = 500
)
write.csv(lime_result, "results/lime_explanation_fresh_run.csv", row.names = FALSE)
print(lime_result)
