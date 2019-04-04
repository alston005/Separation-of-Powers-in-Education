setwd("~/Documents/CCS/SoP/BATakeover/News/extracting_news")
searched_keywords
output <- NULL
all_news <- NULL
for(i in 1:length(searched_keywords)){
        print(searched_keywords[i])
        temp <- read.csv(paste0("~/Documents/CCS/SoP/BATakeover/News/extracting_news/collection_articles_3/",
                               searched_keywords[i]))
        output <- rbind(output, temp)
}
View(output)
output <- unique(output[, 2:8])
output[,"relevant"] <- ""  #adding the 'relevant' column
all_news <- output[,c(8,7,4,1,2,3,5,6)]
View(all_news)


#partitioning the file into smaller bits
all_news1 <- all_news[1:500,]
write.csv(all_news1, file = "all_news1.csv")

all_news2 <- all_news[501:1000,]
write.csv(all_news2, file = "all_news2.csv")

all_news3 <- all_news[1001:1500,]
write.csv(all_news3, file = "all_news3.csv")

all_news4 <- all_news[1501:2000,]
write.csv(all_news4, file = "all_news4.csv")

all_news5 <- all_news[2001:2424,]
write.csv(all_news5, file = "all_news5.csv")

#all_news6 <- all_news[5001:6000,]
#write.csv(all_news6, file = "all_news6.csv")

#all_news7 <- all_news[6001:6125,]
#write.csv(all_news7, file = "all_news7.csv")



View(output)
x <- all_news[order(all_news$date),]
View(x)
?sort
