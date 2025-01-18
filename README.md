# Data Visualization Shiny App

This repository contains a Shiny web application created as part of the final assignment for the **Data Visualization & Communication** course at the University of New Haven. The app provides users with an interactive data visualization tool where they can upload their datasets, select variables, and generate dynamic graphs.

## Features

### User Interface (UI)
- **App Title:** Displays a title for the application.
- **Sidebar Layout:** Provides user inputs in a sidebar for easy access.
- **Tabs:** Includes two tabs in the main panel for:
  - Viewing the uploaded dataset.
  - Visualizing the graph based on user selections.
- **User Inputs:**
  - File upload: Allows users to upload `.csv`, `.tsv`, or `.xlsx` files.
  - Dropdown menus: Dynamically populated with variable names from the uploaded dataset.
  - Text input: Lets users define a custom graph title.
  - Graph type selection: Users can choose between `scatter`, `box`, and `bar` graphs.

### Server
- Displays the uploaded dataset in a data table format under the "Data" tab.
- Updates dropdown menus based on the variable names of the uploaded dataset.
- Generates interactive graphs using Plotly based on user-selected variables and graph type.

## App Structure

The application is structured into four R files:

1. **global.R**: Contains the libraries required for the app.
   ```r
   library(shiny)
   library(plotly)
   library(tidyverse)
   library(readxl)
   library(shinythemes)
   library(vroom)
   ```

2. **app.R**: Initializes the Shiny app using `shinyApp(ui, server)`.

3. **ui.R**: Defines the user interface, including the layout, sidebar, and main panel.

4. **server.R**: Contains the server logic for processing data, updating UI components, and rendering outputs.

## How to Use the App

1. **Upload Data**: Click on "Browse..." to upload a `.csv`, `.tsv`, or `.xlsx` file.
2. **Select Variables**: Choose the X and Y variables for your graph from the dropdown menus.
3. **Choose Graph Type**: Select the type of graph you want to generate (scatter, box, or bar).
4. **Add a Title**: Enter a custom title for your graph.
5. **View Outputs**:
   - Navigate to the "Data" tab to view the uploaded dataset.
   - Switch to the "Graph" tab to see the visualization.

## Deployment

The app is deployed on [shinyapps.io](https://www.shinyapps.io/). You can access the live app using the following link:

[App Link](https://aristotlem.shinyapps.io/DV_Final_App/)

## Installation

If you'd like to run the app locally:

1. Clone the repository:
   ```bash
   git clone https://github.com/aristotle-malichetty/Interactive-Data-Visualization-Shiny-App.git
   ```
2. Open RStudio and set the working directory to the folder containing the app files.
3. Run the app:
   ```r
   shiny::runApp()
   ```

## Requirements

Ensure the following R libraries are installed:
- `shiny`
- `plotly`
- `tidyverse`
- `readxl`
- `shinythemes`
- `vroom`

You can install missing libraries using:
```r
install.packages(c("shiny", "plotly", "tidyverse", "readxl", "shinythemes", "vroom"))
```

## Screenshots

### Sidebar and Main Panel
![App Layout](https://github.com/aristotle-malichetty/Interactive-Data-Visualization-Shiny-App/blob/main/data%20visualization%20app-sidepanel-mainpanel.png)

### Graph Visualization
![Graph Example](https://github.com/aristotle-malichetty/Interactive-Data-Visualization-Shiny-App/blob/main/graph%20visualization.png)

### Data Table
![Data Table](https://github.com/aristotle-malichetty/Interactive-Data-Visualization-Shiny-App/blob/main/data%20table%20example.png)

## Author
This project was developed by **Aristotle Malichetty** as part of the coursework for the University of New Haven.

## License
This project is licensed under the MIT License.
