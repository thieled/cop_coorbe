#################################
#
# First exploration of the data
# Author: Daniel Thiele
# Date: 2023-11-23
# 
#################################


# Set up environment ------------------------------------------------------

# Set installation path for packages
.libPaths(c("/projappl/project_2006536/project_rpackages_4.3.0", .libPaths()))

# Check
.libPaths()[1]

# Clean env
rm(list = ls())

# Install packages
# remotes::install_github("thieled/fleece")

# Load packages
library(tidyverse)
library(magrittr)
library(jsonlite)



# File directories --------------------------------------------------------

proj_dir <- "/scratch/project_2006536"

cop27_dir <- paste0(proj_dir, "/cop27-json")
cop26_dir <- paste0(proj_dir, "/cop26-json")

dir(cop27_dir)[1]


cop27_file1 <- paste(cop27_dir, dir(cop27_dir)[1], sep = "/")



# Read json ---------------------------------------------------------------

f1 <- jsonlite::stream_in(file(cop27_file1))

?jsonlite::stream_in

f1_data <- f1$data

library(fleece)

glimpse(f1_data)

f1_dsnip <- f1_data %>% select(-context_annotations,
                               -entities,
                               -edit_controls,
                               -edit_history_tweet_ids,
                               -withheld) %>%
  head(10000)

glimpse(f1_dsnip)

f1_dsnip_rect <- rectangularize(f1_dsnip)

glimpse(f1_dsnip_rect)


f1_dsnip_rect$context_annotations_domain_description_1
