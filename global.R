
library(shiny)
library(tm)
library(wordcloud)
library(memoise)

# The list of the books
books <<- list("The Tragedy of Macbeth" = "Macbeth",
               "A Tale of Two Cities" = "A Tale of Two Cities",
               "The Adventures of Sherlock Holmes" = "The Adventures of Sherlock Holmes",
               "Alice's Adventures in Wonderland" = "Alice's Adventures in Wonderland",
               "A Journal of the Plague Year" = "A Journal of the Plague Year"
               )

# Using "memoise" to automatically cache the results

getTermMatrix <- memoise(function(book) {
  if (!(book %in% books))
    stop("Unknown book")
  
  text <- readLines(sprintf("./%s.txt", book),
                    encoding="UTF-8")
  
  myCorpus = Corpus(VectorSource(text))
  myCorpus = tm_map(myCorpus, content_transformer(tolower))
  myCorpus = tm_map(myCorpus, removePunctuation)
  myCorpus = tm_map(myCorpus, removeNumbers)
  myCorpus = tm_map(myCorpus, removeWords,
                    c(stopwords('SMART'), 'thy', 'thou', 'thee', 'the', 'and', 'but', 'gutenberg', 'project'))
  
  myDTM = TermDocumentMatrix(myCorpus,
                             control = list(minWordLength = 1))
  
  m = as.matrix(myDTM)
  
  sort(rowSums(m), decreasing = TRUE)
})