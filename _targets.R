library(targets)
library(tidyverse)

clean_data <- function(data) {
  mm_to_cm <- function(x) {
    x / 10
  }

  data |>
    mutate(across(ends_with("_mm"), mm_to_cm)) |>
    rename_with(~ str_replace(.x, "_mm", "_cm"), ends_with("_mm"))
}

# End this file with a list of target objects.
list(
  tar_target(penguins, palmerpenguins::penguins),
  tar_target(clean_penguins, clean_data(penguins))
)
