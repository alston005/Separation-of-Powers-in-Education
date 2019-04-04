#setting the directory
setwd("~/Documents/CCS/SoP/BATakeover/News")

#loading packages
library(httr) 
library(jsonlite)  


#Getting all the newssources from India
url_source <- "https://newsapi.org/v2/sources?country=in&apiKey=86b922ac82254fc9b1866e6b4fcc3d68"
sources <- fromJSON(url_source)

sources$sources$id #There are three news sources in India: google news, The Hindu and Times of India

############################## EDIT YOUR REQUIREMENTS STARTING HERE ###############################################
#Enter your query separated with a *+*
query <- "street+vendors+gurugram"  
#Enter Today's date as yyyy-mm-dd
from <- "2018-09-28"
#Enter a date before today's as yyyy-mm-dd
to <- "2018-01-01"
############################## DO NOT EDIT ANYTHING BELOW THIS LINE ###############################################
df <- NULL
temp_url <- paste("https://newsapi.org/v2/everything?sources=google-news-in,the-hindu,the-times-of-india&q=", query, "&from=", from, "&to=", to, "&pageSize=100&page=1&sortBy=publishedAt&apiKey=86b922ac82254fc9b1866e6b4fcc3d68", sep = "")
temp_results <- fromJSON(temp_url)
page <- ceiling(temp_results$totalResults/100)
for(i in 1:page){
        news_url <- paste("https://newsapi.org/v2/everything?sources=google-news-in,the-hindu,the-times-of-india&q=",
                          query, "&from=",
                          from, "&to=",
                          to, "&pageSize=100&page=",
                          i, "&sortBy=publishedAt&apiKey=86b922ac82254fc9b1866e6b4fcc3d68", sep = "")
        news <- fromJSON(news_url)
        df <- rbind(df, data.frame(title = news$articles$title, 
                                   url = news$articles$url,
                                   paper = news$articles$source$name, 
                                   author = news$articles$author, 
                                   text = news$articles$content))
        }
df
filename <- paste(query, ".csv", sep = "")
write.csv(df, filename)
