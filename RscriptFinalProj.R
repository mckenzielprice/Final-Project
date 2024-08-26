<<<<<<< HEAD
install.packages("schrute")
library(schrute)
library(tidyverse)

# save the complete-case data
saveRDS(office_ratings, "/Users/mckenzieprice/Desktop/EPI590R R Bootcamp/Final
				Project/office_data.rds")
getwd()

#Question 1: Create a {gtsummary} table of descriptive statistics about
#your data (1 pt)

=======
#Question 1:
>>>>>>> 547be26ca619457a0a00015a89ac5960f20d5d42
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
<<<<<<< HEAD
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






=======
		imdb_rating ~ "{mean}, {min}, {max}",
		total_votes ~ "{max}",
		air_date ~ "{min}, {max}"))

missing_text = "Missing"
add_p(test = list(all_continuous() ~ "t.test",
									all_categorical() ~ "chisq.test")) |>
	add_overall(col_label = "**Total**") |>
	bold_labels() |>
	modify_footnote(update = everything() ~ NA) |>
	modify_header(label = "**Variable**", p.value = "**P**")

)
missing_text = "Missing"
add_p(test = list(all_continuous() ~ "t.test",
									all_categorical() ~ "chisq.test")) |>
	add_overall(col_label = "**Total**") |>
	bold_labels() |>
	modify_footnote(update = everything() ~ NA) |>
	modify_header(label = "**Variable**", p.value = "**P**")
>>>>>>> 547be26ca619457a0a00015a89ac5960f20d5d42
