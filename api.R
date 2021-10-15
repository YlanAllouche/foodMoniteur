#* @param User in question
#* @get /dashboard
#* @serializer html


function(param=""){
	origin <- paste0("/data/", param, ".xlsx")
	result <- read.foodlog(origin)
	file_path=paste0("/data/dashboard_",param,".html")
	if (file.exists(file_path) && (file.info(origin)$mtime < file.info(file_path)$mtime)) {
	  print("File already exsists")
	  includeHTML(file_path)
	}else{
	  includeHTML(rmarkdown::render("/app/dashboard.Rmd", output_file = file_path))
	}
}
