source("R/01_data_preparation.R")
library(ggplot2)
library(dplyr)

outcome_counts <- students %>% count(target, name = "students") %>%
  mutate(percentage = 100 * students / sum(students))
write.csv(outcome_counts, "results/outcome_distribution.csv", row.names = FALSE)

p <- ggplot(outcome_counts, aes(target, students)) +
  geom_col(fill = "#276936") +
  geom_text(aes(label = scales::comma(students)), vjust = -0.4) +
  labs(title = "Distribution of Student Outcomes",
       x = "Student outcome", y = "Number of students") +
  theme_minimal()
ggsave("results/plots/01_outcome_distribution.png", p,
       width = 7, height = 4, dpi = 160)

eda_summary <- students %>% group_by(target) %>%
  summarise(
    average_age = mean(age_at_enrollment),
    average_admission_grade = mean(admission_grade),
    average_first_semester_grade = mean(curricular_units_1st_sem_grade),
    .groups = "drop"
  )
write.csv(eda_summary, "results/eda_group_averages.csv", row.names = FALSE)
print(outcome_counts)
print(eda_summary)
