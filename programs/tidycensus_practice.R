# Coren Huff
# 2026-06-05
# practicing tidycensus w Datacamp

library(tidycensus)
library(tidyverse)

#Sys.getenv("CENSUS_API_KEY")

#to look through all variable codes
acs_vars <- load_variables(2023, 
                           "acs5", 
                            cache = TRUE)
View(acs_vars)
#to filter by label and find variable name
acs_vars |> 
  filter(grepl("total population", label, ignore.case = TRUE)) |> 
  View()
#to check variable 
acs_vars |>
  filter(name == "B28002_004")


get_acs(geography = "county", 
        state = "VA",
        variables = c(
          broadband = "B28002_004", 
          pop = "B01003"
        ), 
        output = "wide"
) |> 
  View()








