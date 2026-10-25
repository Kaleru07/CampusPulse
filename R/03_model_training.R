source("R/01_data_preparation.R")
library(caret)
library(nnet)
library(randomForest)

# Shared stratified 80/20 split for both scenarios.
set.seed(123)
train_index <- caret::createDataPartition(students$target, p = 0.80, list = FALSE)
train_a <- scenario_a[train_index, , drop = FALSE]
test_a  <- scenario_a[-train_index, , drop = FALSE]
train_b <- scenario_b[train_index, , drop = FALSE]
test_b  <- scenario_b[-train_index, , drop = FALSE]

set.seed(123)
logistic_a <- nnet::multinom(target ~ ., data = train_a, trace = FALSE, MaxNWts = 10000)
set.seed(123)
forest_a <- randomForest::randomForest(target ~ ., data = train_a, ntree = 500, importance = TRUE)
set.seed(123)
logistic_b <- nnet::multinom(target ~ ., data = train_b, trace = FALSE, MaxNWts = 10000)
set.seed(123)
forest_b <- randomForest::randomForest(target ~ ., data = train_b, ntree = 500, importance = TRUE)

predictions <- list(
  logistic_a = predict(logistic_a, newdata = test_a),
  forest_a = predict(forest_a, newdata = test_a),
  logistic_b = predict(logistic_b, newdata = test_b),
  forest_b = predict(forest_b, newdata = test_b)
)
actual <- list(test_a$target, test_a$target, test_b$target, test_b$target)

saveRDS(list(
  models = list(logistic_a = logistic_a, forest_a = forest_a,
                logistic_b = logistic_b, forest_b = forest_b),
  predictions = predictions, actual = actual,
  train_index = train_index, test_a = test_a, test_b = test_b
), "data/CampusPulse_Model_Objects.rds")
cat("Training rows:", length(train_index), "| Test rows:", nrow(test_a), "\n")
