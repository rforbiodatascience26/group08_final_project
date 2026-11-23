# Load needed libraries
library("shiny")
library("bslib")

source("chloropleth_function.R", local = TRUE)


source("ui_app.R", local = TRUE)

source("backend_app.R", local = TRUE)

shinyApp(ui = ui, server = backend)
