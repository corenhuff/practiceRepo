# Coren Huff
# 2026-06-02
#playing with 2025 VA CHR

#load readxl
library(readxl)
library(tidyverse)
library(here)

# import file 
chr <- read_excel(here("data","source", "2025CHRcopy.xlsx"), 
                  sheet = "Select Measure Data", 
                  skip=1)
View(chr)

names(chr) <- names(chr) |> 
  gsub(" ", "_", x=_) |> 
  gsub(",", "", x=_) |> 
  gsub("%", 'Pct', x=_)

names(chr)

#select FIPS, STATE, COUNTY, FEI, and YPLL from chr
foodLife <- chr |> 
  select("FIPS",
         "State",
         "County", 
         "Food_Environment_Index", 
         "Years_of_Potential_Life_Lost_Rate")

#plot YPLL by FEI and lable the axes
foodLife |> 
  ggplot(aes(Food_Environment_Index, Years_of_Potential_Life_Lost_Rate)) +
  geom_point()+
  xlab("Food Environment Index(1-10)")+
  ylab("YPLL Rate per 100,000")+
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Years of Potential Life Loss Rate v Food Environment Index "
       )

#find out which counties have the highest YPLL
foodLife |> 
  filter(!is.na(Years_of_Potential_Life_Lost_Rate)) |> 
  arrange(desc(Years_of_Potential_Life_Lost_Rate)) |> 
  slice_max(Years_of_Potential_Life_Lost_Rate, n = 5)
  

str(foodLife)  

#you're doing great





