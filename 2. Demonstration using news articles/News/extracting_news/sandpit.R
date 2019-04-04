x <- news$articles$results$authors
z <- news$articles$results$authors
append(x,z)

z
news$articles$results$uri
h<- NULL
h <- news$articles$results$authors
str(h)
hk <- data.frame(author = data.frame(news$articles$results$authors), ID = news$articles$results$uri)
hdfx <- data.frame(matrix(unlist(news$articles$results$authors), nrow=100, byrow=T))
dfx

m <- fromJSON(url_page, flatten = TRUE)
str(m)
m$articles$page

news$articles$results$authors

authors <- data.frame(ID = news$articles$results$uri)
authors$details <- (news$articles$results$authors)

View(authors)
x <- authors

authors.df <- do.call("rbind", lapply(authors, as.data.frame)) 

lapply(authors, write, "test.txt", append=TRUE, ncolumns=1000)
typeof(authors.df)
?write.table
write.table(x, "file.txt")
x <- unlist(x)
x

dfdf <- data.frame(matrix(unlist(x), nrow=100, byrow=T))
do.call(rbind.data.frame, x)
View(x)
hdfx <- data.frame(matrix(unlist(x), nrow=100, byrow=T))

save(x, file="fname.RData")

class(authors)
mkg <- unlist(authors$details)
View(mkg)
?write.list
?write.table

write.table(authors, "abc")

dput(authors, file="out.txt")
new <- source("out.txt")
View(new)

getwd()
searched_keywords <- list.files(path = "/Users/Alston/Documents/CCS/SoP/BATakeover/News/extracting_news/collection_articles", pattern = NULL, all.files = FALSE,
           full.names = FALSE, recursive = FALSE,
           ignore.case = FALSE, include.dirs = FALSE, no.. = FALSE)
t
searched_keywords



#http://eventregistry.org/api/v1/article?query=%7B%22%24query%22%3A%7B%22%24and%22%3A%5B%7B%22keyword%22%3A%22private%20schools%22%2C%22keywordLoc%22%3A%22title%22%7D%2C%7B%22%24or%22%3A%5B%7B%22sourceLocationUri%22%3A%22http%3A%2F%2Fen.wikipedia.org%2Fwiki%2FIndia%22%7D%5D%7D%5D%7D%7D&action=getArticles&dataType=news&resultType=articles&articlesSortBy=date&articlesCount=100&includeArticleDuplicatelist=true&articleBodyLen=-1&apiKey=ab95fb32-89cb-4a24-9286-3323668cf08b

keyword <- "private+schools"


url_page_x <- paste("http://eventregistry.org/api/v1/article?query={\"$query\":{\"$and\":[{\"keyword\":\"private\"\"school\",\"keywordLoc\":\"title\"},{\"$or\":[{\"sourceLocationUri\":\"http://en.wikipedia.org/wiki/India\"}]},{\"dateStart\":\"2018-01-01\",\"dateEnd\":\"2018-12-31\",\"lang\":\"eng\"}]}}&action=getArticles&dataType=news&resultType=articles&articlesSortBy=date&articlesCount=100&includeArticleDuplicatelist=true&articleBodyLen=-1&apiKey=ab95fb32-89cb-4a24-9286-3323668cf08b", sep="")
u <- fromJSON(url_page)
View(u)
url_page
url_source <- paste0("http://eventregistry.org/api/v1/article?query={\"$query\":{\"$and\":[{\"keyword\":\"",
                   keyword,"\",\"keywordLoc\":\"title\"},{\"$or\":[{\"sourceLocationUri\":\"http://en.wikipedia.org/wiki/India\"}]},{\"dateStart\":\"",
                   date_start,"\",\"dateEnd\":\"",
                   date_end,"\",\"lang\":\"eng\"}]}}&action=getArticles&dataType=news&resultType=articles&articlesSortBy=date&articlesCount=100&includeArticleDuplicatelist=true&articleBodyLen=-1&apiKey=ab95fb32-89cb-4a24-9286-3323668cf08b")

#http://eventregistry.org/api/v1/article?query={"$query":{"$and":[{"keyword":"private school","keywordLoc":"title"},{"$or":[{"sourceLocationUri":"http://en.wikipedia.org/wiki/India"}]},{"dateStart":"2019-01-01","dateEnd":"2019-01-09","lang":"eng"}]}}&action=getArticles&dataType=news&resultType=articles&articlesSortBy=date&articlesCount=100&includeArticleDuplicatelist=true&articleBodyLen=-1&apiKey=ab95fb32-89cb-4a24-9286-3323668cf08b
#http://eventregistry.org/api/v1/article?query={"$query":{"$and":[{"keyword":"private","school",\"keywordLoc\":\"title\"},{\"$or\":[{\"sourceLocationUri\":\"http://en.wikipedia.org/wiki/India\"}]},{\"dateStart\":\"2018-01-01\",\"dateEnd\":\"2018-12-31\",\"lang\":\"eng\"}]}}&action=getArticles&dataType=news&resultType=articles&articlesSortBy=date&articlesCount=100&includeArticleDuplicatelist=true&articleBodyLen=-1&apiKey=ab95fb32-89cb-4a24-9286-3323668cf08b