source("R/00_packages.R")
dir.create("data", showWarnings = FALSE)
dir.create("results", showWarnings = FALSE)
dir.create("results/plots", recursive = TRUE, showWarnings = FALSE)

dataset_url <- "https://archive.ics.uci.edu/static/public/697/data.csv"
students <- read.csv(dataset_url, stringsAsFactors = FALSE, check.names = FALSE)
students <- janitor::clean_names(students)
students$target <- factor(students$target,
                          levels = c("Dropout", "Enrolled", "Graduate"))

stopifnot(nrow(students) == 4424L, ncol(students) == 37L)
stopifnot(sum(is.na(students)) == 0L)

# Scenario A excludes all first- and second-semester curricular-unit variables.
semester_columns <- grep("^curricular_units_(1st|2nd)_sem_", names(students), value = TRUE)
scenario_a_columns <- setdiff(names(students), c("target", semester_columns))

# Scenario B includes first-semester but excludes second-semester variables.
second_semester_columns <- grep("^curricular_units_2nd_sem_", names(students), value = TRUE)
scenario_b_columns <- setdiff(names(students), c("target", second_semester_columns))

scenario_a <- students[, c(scenario_a_columns, "target"), drop = FALSE]
scenario_b <- students[, c(scenario_b_columns, "target"), drop = FALSE]

saveRDS(students, "data/CampusPulse_Cleaned_Data.rds")
saveRDS(list(scenario_a = scenario_a, scenario_b = scenario_b),
        "data/CampusPulse_Scenarios.rds")
cat("Dimensions:", nrow(students), "x", ncol(students), "\n")
cat("Missing values:", sum(is.na(students)), "\n")
print(table(students$target))
