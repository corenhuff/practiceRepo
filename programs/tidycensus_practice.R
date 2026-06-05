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


data <- get_acs(geography = "county", 
        state = "VA",
        variables = c(
          broadband = "B28002_004",
          health_insurance = "B27001_001",
          pop = "B01001_001E"
        ), 
        output = "wide"
) |> 
  View()





