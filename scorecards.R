# overall score calculations

library(tidyverse)
library(dplyr)

scorecards <- read.csv("scorecards.csv") %>%
  mutate(heat_bool = case_when(`Heat` ~ 1,
                                 .default = -1),
        coastal_bool = case_when(`Coastal_Flooding` ~ 1,
                                 .default = -1),
        cold_bool = case_when(`Cold_Wave` ~ 1,
                                 .default = -1),
        wildfire_bool = case_when(`Wildfire` ~ 1,
                                 .default = -1),
        inland_flood_bool = case_when(`Inland_Flooding` ~ 1,
                                 .default = -1),
        drought_bool = case_when(`Drought` ~ 1,
                                 .default = -1),
        hurricane_bool = case_when(`Hurricane` ~ 1,
                                 .default = -1),
        wind_bool = case_when(`Extreme_Wind` ~ 1,
                                 .default = -1),
        winter_bool = case_when(`Winter_Storm` ~ 1,
                                 .default = -1),
        overall_score = ((heat_bool * heat_weight) +
                         (coastal_bool * coastal_flood_weight) + 
                         (wildfire_bool * wildfire_weight) +                          
                         (cold_bool * cold_wave_weight) +
                         (drought_bool * drought_weight) +
                         (hurricane_bool * hurricane_weight) +
                         (wind_bool * wind_weight) + 
                         (winter_bool * winter_storm_weight))) %>%
      select(State, overall_score) %>%
      write.csv("output_scores.csv")
  
