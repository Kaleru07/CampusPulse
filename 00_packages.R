required_packages <- c("tidyverse", "janitor", "caret", "nnet",
                       "randomForest", "lime", "knitr", "rmarkdown")
missing_packages <- required_packages[
  !vapply(required_packages, requireNamespace, logical(1), quietly = TRUE)
]
if (length(missing_packages)) {
  install.packages(missing_packages, repos = "https://cloud.r-project.org")
}
invisible(lapply(required_packages, library, character.only = TRUE))
