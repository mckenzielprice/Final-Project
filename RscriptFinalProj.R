install.packages("schrute")
library(schrute)
library(tidyverse)

# save the complete-case data
saveRDS(office_ratings, "/Users/mckenzieprice/Desktop/EPI590R R Bootcamp/Final
				Project/office_data.rds")
getwd()

#Question 1: Create a {gtsummary} table of descriptive statistics about
#your data (1 pt)

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

#Question 2: Fit a regression and present well-formatted results from the
#regression (1 pt); The regression doesn’t have to be of any particular
#scientific interest, and you don’t have to interpret it in any particular way;
#You may use {broom} or {gtsummary} or both

library(gtsummary)

linear_model <- lm(imdb_rating ~ total_votes + air_date,
									 data = office_data)
poisson_model <- glm(total_votes ~ imdb_rating + season,
										 family = poisson,
										 data = office_data)
tbl_regression(
	poisson_model,
	exponentiate = TRUE,
	label = list(
		imdb_rating ~ "IMDB Rating",
		season ~ "Season"
	))

tbl_regression(
	linear_model,
	intercept = TRUE,
	label = list(
		total_votes ~ "Total Votes",
		air_date ~ "Air Date"
	))

tbl_uvregression(
	office_data,
	y = season,
	include = c(imdb_rating, total_votes, air_date),
	method = lm)






