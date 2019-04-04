#setting the directory
setwd("~/Documents/CCS/SoP/BATakeover/News")

#loading packages
library(httr) 
library(jsonlite)  

keyword <- "[\"teacher\",\"strike\"]"
date_start <- "2017-10-01"
date_end <- "2018-09-30"
language <- "eng"  

######################### DO NOT EDIT ANYTHING BELOW THIS LINE #################################################3
df <- NULL
searched_keywords <- c(searched_keywords, keyword)
url_source <- paste("http://eventregistry.org/api/v1/article?query={\"$query\":{\"$and\":[{\"keyword\":{\"$and\":", 
                    keyword, "}},{\"$or\":[{\"sourceLocationUri\":\"http://en.wikipedia.org/wiki/India\"}]},{\"dateStart\":\"", 
                    date_start, "\",\"dateEnd\":\"",
                    date_end, "\",\"lang\":\"",
                    language,"\"}]}}&action=getArticles&resultType=articles&articlesSortBy=date&articlesCount=100&includeArticleLocation=true&articleBodyLen=-1&apiKey=ab95fb32-89cb-4a24-9286-3323668cf08b", sep="")

news <- fromJSON(url_source)
pages <- news$articles$pages
for(i in 1:pages){
        url_page <- paste("http://eventregistry.org/api/v1/article?query={\"$query\":{\"$and\":[{\"keyword\":{\"$and\":", 
                            keyword, "}},{\"$or\":[{\"sourceLocationUri\":\"http://en.wikipedia.org/wiki/India\"}]},{\"dateStart\":\"", 
                            date_start, "\",\"dateEnd\":\"",
                            date_end, "\",\"lang\":\"",
                            language,"\"}]}}&action=getArticles&resultType=articles&articlesSortBy=date&articlesCount=100&includeArticleLocation=true&articleBodyLen=-1&articlesPage=",
                            i, "&apiKey=ab95fb32-89cb-4a24-9286-3323668cf08b", sep="")
        y <- fromJSON(url_page)
        df <- rbind(df, data.frame(date = y$articles$results$date, 
                                   url = y$articles$results$url, 
                                   title = y$articles$results$title, 
                                   source = y$articles$results$source$title,
                                   duplicate = y$articles$results$isDuplicate,
                                   body = y$articles$results$body))
}
df <- subset(df, df$duplicate == FALSE)
str(df)
filename <- paste(keyword, ".csv", sep = "")
write.csv(df, paste("compilation/", filename, sep = ""))


