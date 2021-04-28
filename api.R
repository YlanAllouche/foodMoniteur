#* @param User in question
#* @get /dashboard
#* @serializer html

function(param=""){
	result <- read.foodlog(paste0("/data/", param, ".xlsx"))
	includeHTML(rmarkdown::render("dashboard.Rmd", output_file = paste0("Dashboard - ", param)))
}
