read.foodlog <- function(path) {
	food_log <- openxlsx::read.xlsx(path, "log", detectDates = T)
	vars = c("Protein", "Carbs", "Fat", "Calories")

	pc_food_log <- food_log %>%
		dplyr::left_join(openxlsx::read.xlsx(path, "food"), c("Name"="Name")) %>%
		mutate(across(vars, ~ . * Quantity / Metric)) %>%
		select(Date, Name, Quantity, Protein, Carbs, Fat, Calories)

	ag_food_log <- pc_food_log %>%
		group_by(Date) %>%
		summarise_at( ., vars, sum) %>%
        mutate(total = Protein + Carbs + Fat) %>%
		mutate(across(vars[1:3], ~ . / total *100 )) %>% select(-total)
	return(list(pc_food_log, ag_food_log))
    write.csv(ag_food_log, "output.csv")
}

Kable <- function(df) {
	df %>% kable("html", escape=F, digits=0) %>%
                kable_styling(bootstrap_options = c("striped", "hover", "condensed"))
}

