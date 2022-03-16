library(markdown)

navbarPage("Book Visualizations",
           tabPanel("Word Clouds",
                    sidebarLayout(
                      # Sidebar with a slider and selection inputs
                      sidebarPanel(
                        selectInput("selection", "Choose a book:",
                                    choices = books),
                        actionButton("update", "Change"),
                        hr(),
                        sliderInput("freq",
                                    "Minimum Frequency:",
                                    min = 1,  max = 50, value = 10),
                        sliderInput("max",
                                    "Maximum Number of Words:",
                                    min = 1,  max = 500,  value = 100)
                      ),
                      mainPanel(
                        plotOutput("plot")
                      )
                    )
           ),
           tabPanel("Documentation",
                    h3("What's word cloud"),
                    p("A word clouds are graphical representations of word that appear more frequently in a source text"),
                    br(),
                    h3("How to use"),
                    p("1. Choose a book"),
                    p("2. Adjust 'minimum frequency' and 'maximum number of words' as desired. The results are real time"),
                    p("3. If you want to change a book, select the book first and then click change."),
                    br(),
                    h4("Data Sources"),
                    p(a("1. The Tragedy of Macbeth, by William Shakespeare", 
                        href = "https://www.gutenberg.org/cache/epub/1795/pg1795.txt")),
                    p(a("2. A Tale of Two Cities, by Charles Dickens", 
                        href = "http://www.gutenberg.org/cache/epub/2243/pg2243.txt")),
                    p(a("3. The Adventures of Sherlock Holmes, by Arthur Conan Doyle", 
                        href = "https://www.gutenberg.org/files/1661/1661-0.txt")),
                    p(a("4. Alice in Wonderland, by Lewis Carroll", 
                        href = "https://www.gutenberg.org/cache/epub/19033/pg19033.txt")),
                    p(a("5. A Journal of the Plague Year, by Daniel Defoe", 
                        href = "https://www.gutenberg.org/files/376/376-0.txt")),
           ),

)
