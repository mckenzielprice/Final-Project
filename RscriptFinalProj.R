install.packages("schrute")
library(schrute)
library(tidyverse)

# save the complete-case data
write_rds(office_ratings, here::here("Final Project", "officedata"))
saveRDS(office_ratings, "/Users/mckenzieprice/Desktop/EPI590R R Bootcamp/Final
				Project/office_data.rds")
getwd()

#Question 1:

library(gtsummary)

tbl_summary(
	office_data,
	by = season,
	include = c(imdb_rating, total_votes, air_date),
  label = list(
  	imdb_rating ~ "IMDB Rating",
  	total_votes ~ "Total Votes",
  	air_date ~ "Air Date"),

	statistic = list(
		imdb_rating ~ "{mean} ({min}, {max})",
		total_votes ~ "{sum}",
		air_date ~ "({min}) to ({max})"),

missing_text = "Missing"
) |>
	modify_caption("**Summary of The Office Episodes by Season**")



