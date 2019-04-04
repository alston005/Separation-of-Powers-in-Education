#setting the directory
setwd("~/Documents/CCS/SoP/BATakeover/News/extracting_news")

#creating a vector of all the searched keywords
searched_keywords <- NULL

#loading packages
library(httr) 
library(jsonlite)  

keyword <- "[\"private\",\"school\"]"
#date_start <- "2018-01-01"
date_start <- "2018-01-01"
#date_end <- "2019-01-01"
date_end <- "2018-12-31"
language <- "eng"  

######################### DO NOT EDIT ANYTHING BELOW THIS LINE #################################################3
df <- NULL
authors <- NULL
searched_keywords <- sort(unique(c(searched_keywords, keyword)))
write.csv(as.data.frame(searched_keywords), file = "searched_keywords.csv")
searched_keywords
url_source <- paste("http://eventregistry.org/api/v1/article?query={\"$query\":{\"$and\":[{\"keyword\":{\"$and\":", 
                    keyword, "}},{\"$or\":[{\"sourceLocationUri\":\"http://en.wikipedia.org/wiki/India\"}]},{\"dateStart\":\"", 
                    date_start, "\",\"dateEnd\":\"",
                    date_end, "\",\"lang\":\"",
                    language,"\"}]}}&action=getArticles&resultType=articles&articlesSortBy=date&articlesCount=100&includeArticleLocation=true&articleBodyLen=-1&apiKey=ab95fb32-89cb-4a24-9286-3323668cf08b", sep="")

news <- fromJSON(url_source)
View(news)
pages <- news$articles$pages
pages
for(i in 1:pages){
        url_page <- paste("http://eventregistry.org/api/v1/article?query={\"$query\":{\"$and\":[{\"keyword\":{\"$and\":", 
                            keyword, "}},{\"$or\":[{\"sourceLocationUri\":\"http://en.wikipedia.org/wiki/India\"}]},{\"dateStart\":\"", 
                            date_start, "\",\"dateEnd\":\"",
                            date_end, "\",\"lang\":\"",
                            language,"\"}]}}&action=getArticles&resultType=articles&articlesSortBy=date&articlesCount=100&includeArticleLocation=true&articleBodyLen=-1&articlesPage=",
                            i, "&apiKey=ab95fb32-89cb-4a24-9286-3323668cf08b", sep="")
        y <- fromJSON(url_page)
        df <- rbind(df, data.frame(ID =y$articles$results$uri,
                                   date = y$articles$results$date, 
                                   url = y$articles$results$url, 
                                   title = y$articles$results$title, 
                                   source = y$articles$results$source$title,
                                   duplicate = y$articles$results$isDuplicate,
                                   body = y$articles$results$body))
        temp_authors <- data.frame(ID = y$articles$results$uri,
                                   url = y$articles$results$url)
        temp_authors$details <- y$articles$results$authors
        authors <- rbind(authors, temp_authors)
       
}
df <- subset(df, df$duplicate == FALSE)
View(df)
#View(authors)
write.csv(df, paste("collection_articles/", paste(keyword, ".csv", sep = ""), sep = ""))

#Saving the file with author names
dput(authors, file = paste("collection_authors/", "a_", paste(keyword, ".txt", sep = ""), sep = ""))

searched_keywords
