# input: original data - ../../original-data-and-metadata/original-data/oww3.csv
# output: analysis data - ../analysis-data/oww.RData
# rename columns to make them more informative
# change variable types to numeric/categorical when needed
# ...

# load packages -----------------------------------------------------

library(dplyr)

# load data ---------------------------------------------------------

oww <- read.csv("../../original-data-and-metadata/original-data/oww3.csv")

# rename columns to more informative names --------------------------

oww <- oww %>%
  rename(year = y0) %>%
  rename(country_ILO = y1) %>%
  rename(country_WDI = country) %>%
  rename(industry = y3) %>%
  rename(occupation = y4)

# turn occupation into factor ---------------------------------------

oww <- oww %>%
  mutate(occupation = as.factor(occupation))

# convert to tbl_df for pretty printing -----------------------------

oww <- tbl_df(oww)

# save analysis data ------------------------------------------------

save(oww, file = "../analysis-data/oww.RData")
