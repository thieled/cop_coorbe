#################################
#
# Test if dictvectoR installs successfully on Puhti
# Author: Daniel Thiele
# Date: 2023-11-23
# 
#################################

# Objective: prepare test of replication for CCR


# Set up environment ------------------------------------------------------

# Set installation path for packages
.libPaths(c("/projappl/project_2006536/project_rpackages_4.3.0", .libPaths()))

# Check
.libPaths()[1]

# Clean env
rm(list = ls())



# Brief check if dictvector works here ------------------------------------

library(dictvectoR)
library(dplyr)
library(fastrtext)
library(magrittr)
library(quanteda)

# Prepare text data
texts <- prepare_train_data(tw_data, text_field = "full_text", seed = 42)

# Clean text in tw_data
tw_data %<>% clean_text(remove_stopwords = T,
                        text_field = "full_text")

# Clean text in tw_annot
tw_annot %<>% clean_text(remove_stopwords = T,
                         text_field = "full_text")


getwd()

# Create local folder and set name for model
dir.create("ft_model", showWarnings = FALSE)
model_file <- paste0(getwd(), "/ft_model/ft_model")


# Train a fasttext model using the twitter data (if model does not yet exist)


fastrtext::build_vectors(texts, model_file, modeltype = c("skipgram"),
                         dim = 150, epoch = 10, bucket = 1e+6,  lr = 0.05,
                         lrUpdateRate = 100, maxn = 7,  minn = 4, minCount = 3,
                         t = 1e-04, thread = 1, ws= 6)

# Delete model again
unlink(paste0(getwd(), "/ft_model"), recursive = T)



