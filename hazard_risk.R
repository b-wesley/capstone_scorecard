
# Data cleaning for FEMA data

library(tidyverse)
library(dplyr)

hazards <- read.csv("NRI_Table_States/NRI_Table_States.csv")

study_states <- c("NY", "NJ", "CT", "DC", "NC", "IL", "OH", "TX", "CA", "LA", "FL", "PR", "CO")

state_hazards <- hazards %>%
  select(STATE,
         STATEABBRV,
         EAL_SCORE,
         CFLD_EALS,
         CWAV_EALS,
         DRGT_EALS,
         HWAV_EALS,
         HRCN_EALS,
         ISTM_EALS,
         LNDS_EALS,
         LTNG_EALS,
         IFLD_EALS,
         SWND_EALS,
         TRND_EALS,
         TSUN_EALS,
         WFIR_EALS,
         WNTW_EALS) %>%
  filter(STATEABBRV %in% study_states) %>%
  rename(overall_risk = EAL_SCORE,
         coastal_flood_risk = CFLD_EALS,
         coldwave_risk = CWAV_EALS,
         drought_risk = DRGT_EALS,
         heatwave_risk = HWAV_EALS,
         hurricane_risk = HRCN_EALS,
         ice_storm_risk = ISTM_EALS,
         landslide_risk = LNDS_EALS,
         lightning_risk = LTNG_EALS,
         inland_flood_risk = IFLD_EALS,
         strong_wind_risk = SWND_EALS,
         tornado_risk = TRND_EALS,
         tsunami_risk = TSUN_EALS,
         wildfire_risk = WFIR_EALS,
         winter_weather_risk = WNTW_EALS
         ) %>%
  write.csv("selected_state_hazards.csv")
