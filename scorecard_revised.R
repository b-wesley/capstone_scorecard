library(tidyverse)
library(dplyr)

scores <- read.csv("scorecards2.csv")

scores_out <- scores %>%
  mutate(final_score = (Heat * heat_weight) + 
                       (Coastal_Flooding * coastal_flood_weight) +
                       (Cold_Wave * cold_wave_weight) +
                       (Wildfire * wildfire_weight) + 
                       (Inland_Flooding * inland_flood_risk) +
                       (Drought * drought_weight) + 
                       (Hurricane * hurricane_weight) +
                       (Extreme_Wind * wind_weight) +
                       (Winter_Storm * winter_storm_weight))  %>%
  select(State, final_score) %>%
  write.csv("revised_scorecard_output.csv")
