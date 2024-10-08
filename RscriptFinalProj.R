install.packages("renv")
install.packages(schrute)
library(schrute)
library(tidyverse)
library(here)
library(broom.helpers)

office_ratings <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-03-17/office_ratings.csv')

# save the complete-case data
saveRDS(office_ratings, here::here("office_data.rds"))

office_data <- readRDS(here::here("office_data.rds"))

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
	modify_caption("**Summary of 'The Office' Episodes by Season**")

#Question 2: Fit a regression and present well-formatted results from the
#regression (1 pt); The regression doesn’t have to be of any particular
#scientific interest, and you don’t have to interpret it in any particular way;
#You may use {broom} or {gtsummary} or both

library(gtsummary)

poisson_model <- glm(total_votes ~ imdb_rating + season,
										 family = poisson,
										 data = office_data)
tbl_regression(
	poisson_model,
	exponentiate = TRUE,
	label = list(
		imdb_rating ~ "IMDB Rating",
		season ~ "Season"
	)) |>
	modify_caption("**Poisson Regression Analysis**")

#Question 3: Create a figure (1 pt) It doesn’t need to look pretty; feel free
#to adapt some of the examples from class, which were as simple as
#hist(data$variable) and as complicated as the forest plot in the {broom}
#section

boxplot(imdb_rating ~ season, data = office_data,
				main = "Box Plot Comparing 'The Office' IMDB Ratings by Season",
				xlab = "Season",
				ylab = "IMDB Rating",
				outline = TRUE)

#Question 4: Write and use a function that does something with the data (1 pt)
#It could be as simple as, for example, a new function that you write by hand
#to calculate the standard deviation of a variable (like we did with the mean)

imdb_ratings <- office_data$imdb_rating

imdb_mean <- function(imdb_ratings) {
	n <- length(imdb_ratings)
	mean_val <- sum(imdb_ratings) / n
	return(mean_val)
}

imdb_mean(imdb_ratings)

#Question 5: Create and render a quarto document that includes at least:
#The table, regression results, and figure, with appropriate captions (1 pt)
#Inline R code in at least 2 places, 1 pulling a statistic from a table
#(i.e., using gtsummary::inline_text()) and 1 printing something else
#(like we did with the mean age in the example) (1 pt)
#Cross-references to a table and a figure at least once each (1 pt)
#A brief description of the data, including its source (1 pt)

#Use the {renv} package to make sure the teaching team can reproduce your
#results with the same package versions (1 pt) You don’t need to include any
#{renv} code, we can see that you have used it because of the renv.lock file
#you will include. Remember if you are having trouble with {renv} to deactivate
#it, and then only initiate it when you have installed all the packages you will need







