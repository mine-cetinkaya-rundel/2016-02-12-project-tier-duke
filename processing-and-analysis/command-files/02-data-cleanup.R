# input: analysis data - ../analysis-data/oww.RData
# output: NA
# remove data with high hw1 values
# create new variable: exrt_cat
# ...

# load packages -----------------------------------------------------

library(dplyr)

# remove any hw1 greater than 500 -----------------------------------
# this is just an example, there is no scientific basis for this

oww <- oww %>%
  filter(hw1 <= 500) %>%
  droplevels()

# create new variable -- exrt below above median --------------------

oww <- oww %>%
  mutate(exrt_cat = as.factor(ifelse(exrt < median(exrt, na.rm = TRUE), "below median", "above median")))