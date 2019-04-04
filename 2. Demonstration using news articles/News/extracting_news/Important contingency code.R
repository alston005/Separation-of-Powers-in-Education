#      This script contains all the code that is irrelevant for running the main 
#       file, but is required incase of contingencies
#       
#-------------------------------------------------------------------------------------------------------
#       1. Opening the file with author names
#               new <- source("a_["closure","schools"].txt")
#
#       2. Incase the "searched_keywords" file does not have all the keywords.
               searched_keywords <- list.files(path = "/Users/Alston/Documents/CCS/SoP/BATakeover/News/extracting_news/collection_articles_3",
                        pattern = NULL, all.files = FALSE,full.names = FALSE,
                        recursive = FALSE, ignore.case = FALSE,
                        include.dirs = FALSE, no.. = FALSE)
#       3. In case of single word queries.
#            url_source <- paste0("http://eventregistry.org/api/v1/article?query={\"$query\":{\"$and\":[{\"keyword\":\"",
#                       keyword,"\",\"keywordLoc\":\"title\"},{\"$or\":[{\"sourceLocationUri\":\"http://en.wikipedia.org/wiki/India\"}]},{\"dateStart\":\"",
#                       date_start,"\",\"dateEnd\":\"",
#                       date_end,"\",\"lang\":\"eng\"}]}}&action=getArticles&dataType=news&resultType=articles&articlesSortBy=date&articlesCount=100&includeArticleDuplicatelist=true&articleBodyLen=-1&apiKey=ab95fb32-89cb-4a24-9286-3323668cf08b")
#               url_page <- paste0("http://eventregistry.org/api/v1/article?query={\"$query\":{\"$and\":[{\"keyword\":\"",
#                        keyword,"\",\"keywordLoc\":\"title\"},{\"$or\":[{\"sourceLocationUri\":\"http://en.wikipedia.org/wiki/India\"}]},{\"dateStart\":\"",
#                        date_start,"\",\"dateEnd\":\"",
#                        date_end,"\",\"lang\":\"eng\"}]}}&action=getArticles&dataType=news&resultType=articles&articlesSortBy=date&articlesCount=100&includeArticleDuplicatelist=true&articleBodyLen=-1&apiKey=ab95fb32-89cb-4a24-9286-3323668cf08b")

               