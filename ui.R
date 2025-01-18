ui <- fluidPage(
  # Add a theme for a more polished appearance
  theme = bslib::bs_theme(version = 5, bootswatch = "flatly"),
  
  # Custom CSS
  tags$head(
    tags$style(HTML("
      .custom-select {
        border-radius: 5px;
        padding: 6px;
      }
      .app-header {
        background-color: #f8f9fa;
        padding: 20px;
        margin-bottom: 20px;
        text-align: center;
      }
    "))
  ),
  
  # Centered, styled title panel
  div(
    class = "app-header",
    h1("Data Visualization App", style = "color: #333; font-weight: bold;")
  ),
  
  # Sidebar Layout
  sidebarLayout(
    # Sidebar Panel with improved styling
    sidebarPanel(
      style = "background-color: #f4f4f4; border-radius: 10px; padding: 15px;",
      
      # File Upload with additional styling
      div(
        style = "margin-bottom: 15px;",
        fileInput("upload1", 
                  "Upload Data File", 
                  accept = c(".csv", ".tsv", ".xlsx"),
                  width = "100%",
                  buttonLabel = "Browse...",
                  placeholder = "No file selected")
      ),
      
      # X Variable Dropdown
      selectInput('xvar', 
                  'Select X Variable', 
                  choices = NULL, 
                  width = "100%"),
      
      # Y Variable Dropdown
      selectInput('yvar', 
                  'Select Y Variable', 
                  choices = NULL, 
                  width = "100%"),
      
      selectInput('graphtype', 
                  'Select the Graph Type', 
                  choices = c('scatter', 'box', 'bar'),
                  width = "100%"),
      
      # Title Input
      textInput('title', 
                'Graph Title', 
                placeholder = "Enter graph title",
                width = "100%")
    ),
    
    # Main Panel with Tabset
    mainPanel(
      tabsetPanel(
        id = "tabs",
        tabPanel("Graph", 
                 plotlyOutput('the_graph', height = "600px")),
        tabPanel("Data", 
                 dataTableOutput('the_data'))
      )
    )
  )
)
