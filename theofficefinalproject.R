install.packages("schrute")
library(schrute)
library(tidyverse)

# Get the Data

office_ratings <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-03-17/office_ratings.csv')

# Or read in with tidytuesdayR package (https://github.com/thebioengineer/tidytuesdayR)
# PLEASE NOTE TO USE 2020 DATA YOU NEED TO USE tidytuesdayR version ? from GitHub

# Either ISO-8601 date or year/week works!

# Install via devtools::install_github("thebioengineer/tidytuesdayR")

tuesdata <- tidytuesdayR::tt_load('2020-03-17')
tuesdata <- tidytuesdayR::tt_load(2020, week = 12)


office_ratings <- tuesdata$office_ratings

# save the complete-case data
write_rds(office_ratings, here::here("Final Project", "officedata"))
saveRDS(office_ratings, "/Users/mckenzieprice/Desktop/EPI590R R Bootcamp/Final Project/office_data.rds")
getwd()


