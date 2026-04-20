library(tidyverse)
library(dplyr)

scores <- read.csv("final_score_input.csv")

scores_out <- scores %>%
  mutate(raw_score = (Heat * heat_weight) + 
                       (Coastal_Flooding * coastal_flood_weight) +
                       (Cold_Wave * cold_wave_weight) +
                       (Wildfire * wildfire_weight) + 
                       (Inland_Flooding * inland_flood_risk) +
                       (Drought * drought_weight) + 
                       (Hurricane * hurricane_weight) +
                       (Extreme_Wind * wind_weight) +
                       (Winter_Storm * winter_storm_weight),
          denominator = 4 * 
                       (heat_weight + coastal_flood_weight + cold_wave_weight + 
                       wildfire_weight + inland_flood_risk + drought_weight + 
                       hurricane_weight + wind_weight + winter_storm_weight),
          normalized_score = raw_score / denominator)  %>%
  select(State, raw_score, normalized_score) %>%
  write.csv("revised_scorecard_output.csv")
