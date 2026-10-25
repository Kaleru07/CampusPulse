source("R/03_model_training.R")
library(ggplot2)
library(dplyr)

# Compute macro metrics explicitly from a confusion matrix.
metrics_from_predictions <- function(pred, truth) {
  classes <- levels(truth)
  cm <- table(Predicted = factor(pred, levels = classes),
              Actual = factor(truth, levels = classes))
  tp <- diag(cm)
  precision <- ifelse(rowSums(cm) == 0, NA_real_, tp / rowSums(cm))
  recall <- ifelse(colSums(cm) == 0, NA_real_, tp / colSums(cm))
  f1 <- ifelse(is.na(precision + recall) | precision + recall == 0,
               NA_real_, 2 * precision * recall / (precision + recall))
  list(
    metrics = data.frame(
      Accuracy = sum(tp) / sum(cm),
      Macro_Precision = mean(precision, na.rm = TRUE),
      Macro_Recall = mean(recall, na.rm = TRUE),
      Macro_F1 = mean(f1, na.rm = TRUE)
    ),
    confusion = cm,
    class_metrics = data.frame(
      Class = classes, Precision = precision, Recall = recall, F1 = f1
    )
  )
}

labels <- c("Scenario A Logistic Regression", "Scenario A Random Forest",
            "Scenario B Logistic Regression", "Scenario B Random Forest")
evaluations <- Map(metrics_from_predictions, predictions, actual)
comparison <- bind_rows(lapply(seq_along(evaluations), function(i) {
  cbind(Model = labels[i], evaluations[[i]]$metrics)
}))
write.csv(comparison, "results/model_comparison_fresh_run.csv", row.names = FALSE)
print(comparison)

for (i in seq_along(evaluations)) {
  write.csv(as.data.frame.matrix(evaluations[[i]]$confusion),
            paste0("results/confusion_matrix_", i, ".csv"))
  write.csv(evaluations[[i]]$class_metrics,
            paste0("results/class_metrics_", i, ".csv"), row.names = FALSE)
}

importance <- randomForest::importance(forest_b)
importance_df <- data.frame(
  Feature = rownames(importance),
  Importance = importance[, "MeanDecreaseGini"],
  row.names = NULL
) %>% arrange(desc(Importance))
write.csv(importance_df, "results/feature_importance_scenario_b_fresh_run.csv",
          row.names = FALSE)

plot_data <- comparison %>%
  mutate(Scenario = ifelse(grepl("Scenario A", Model), "Scenario A", "Scenario B"))
p <- ggplot(plot_data, aes(Model, Accuracy)) +
  geom_col(fill = "#276936") +
  coord_cartesian(ylim = c(0, 1)) +
  labs(title = "Model Accuracy — Fresh Run", x = NULL, y = "Accuracy") +
  theme_minimal() + theme(axis.text.x = element_text(angle = 20, hjust = 1))
ggsave("results/plots/02_model_accuracy_fresh_run.png", p,
       width = 8, height = 4.5, dpi = 160)
