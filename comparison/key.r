library(tidyverse)

sweaters <- read_csv("ugly_sweaters.csv") %>% 
  dplyr::filter(hs_tf == "Yes")

tidy_colors <- sweaters %>% 
  tidyr::separate_rows(colors, sep = ", ") %>% 
  tidyr::separate_rows(colors, sep = " and ") %>% 
  dplyr::group_by(sweater) %>% 
  dplyr::summarize(num_colors = length(sweater))