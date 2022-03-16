function(input, output, session) {
  output$plot <- renderPlot({
    
    terms <- reactive({
      input$update
      isolate({
        withProgress({
          setProgress(message = "Processing corpus...")
          getTermMatrix(input$selection)
        })
      })
    })
    

    wordcloud_rep <- repeatable(wordcloud)
    
    output$plot <- renderPlot({
      v <- terms()
      wordcloud_rep(names(v), v, scale=c(4,0.5),
                    min.freq = input$freq, max.words=input$max,
                    colors=brewer.pal(8, "Dark2"))
    })

  })
  
  output$summary <- renderText({
  })
  

}