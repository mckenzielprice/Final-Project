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
