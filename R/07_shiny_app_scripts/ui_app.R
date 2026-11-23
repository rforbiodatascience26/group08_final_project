ui <- fluidPage(
  layout_columns(
    col_widths = 12,
    card(
      titlePanel("Mortality visualizer"),
      style = "background-color: #f0f0f0; padding: 15px;"
    )
  ),
  
  layout_columns(
    col_widths = 12,
    card(
      titlePanel("Instructions"),
      helpText("Move the slider to select the year to display")
    )
  ),
  
  sidebarLayout(
    sidebarPanel(
      numericInput(inputId = "Year",
                   label = "Year",
                   min = 1980,
                   max = 2025,
                   value = 0.25)
    ),
    mainPanel(
      textOutput(outputId = "year")
    )
  ))