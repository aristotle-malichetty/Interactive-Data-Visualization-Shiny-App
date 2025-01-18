# Server function remains the same as in your original code
server <- function(input, output, session) {
  
  # Reactive data loading
  data <- reactive({
    req(input$upload1)
    
    ext <- tools::file_ext(input$upload1$name)
    switch(ext,
           csv = vroom::vroom(input$upload1$datapath, delim = ","),
           tsv = vroom::vroom(input$upload1$datapath, delim = "\t"),
           xlsx = read_excel(input$upload1$datapath),
           validate("Invalid file; Please upload a .csv or .tsv or .xlsx file")
    )
  })
  
  # Update dropdown menus with variable names
  observeEvent(data(),{
    updateSelectInput(
      session,
      'xvar',
      choices = names(data())
    )
    
    updateSelectInput(
      session,
      'yvar',
      choices = names(data())
    )
  }) 
  
  # Render data table
  output$the_data <- renderDataTable({
    req(data())
    data()
  })
  
  # Render graph (using plotly for interactivity)
  output$the_graph <- renderPlotly({
    req(data(), input$xvar, input$yvar)
    
    the_data <- data()
    xvar <- input$xvar
    yvar <- input$yvar
    title1 <- input$title
    graphtype <- input$graphtype
    plot_ly(data = the_data,
            x = ~get(xvar),
            y = ~get(yvar),
            type = graphtype,
            mode = "markers") %>%
      layout(title = title1,
             xaxis = list(title = xvar),
             yaxis = list(title = yvar))
  })
}