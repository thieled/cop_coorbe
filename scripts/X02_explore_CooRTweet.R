#################################
#
# Explore CooRTweet package 
# Author: Daniel Thiele
# Date: 2023-11-23
# 
#################################

## Objective: Understand how data should be structured to be properly processed by CooRTweet package


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





# Set installation path for packages
.libPaths(c("/projappl/project_2006536/project_rpackages_4.3.0", .libPaths()))

remotes::install_github("nicolarighetti/CooRTweet")


rtw <- russian_coord_tweets


result <- detect_coordinated_groups(russian_coord_tweets, 
                                    min_repetition = 5, 
                                    time_window = 10)


