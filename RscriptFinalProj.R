#Question 1:
office_data$air_date_formatted <- format(office_data$air_date, "%B %d, %Y")
library(gtsummary)

tbl_summary(
	office_data,
	by = season,
	include = c(imdb_rating, total_votes, air_date),
  label = list(
  	imdb_rating ~ "IMDB Rating",
  	total_votes ~ "Total Votes",
  	air_date_formatted ~ "Air Date"),

	statistic = list(
		imdb_rating ~ "{mean} ({min}, {max})",
		total_votes ~ "{sum}",
		air_date_formatted ~ "{min}, {max}"),

missing_text = "Missing"
) |>
	modify_caption("**Summary of The Office Episodes by Season**")



