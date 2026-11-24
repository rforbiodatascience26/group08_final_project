# Load needed libraries
library("shiny")
library("bslib")

source("chloropleth_function.R", local = TRUE)


source("app_ui.R", local = TRUE)

source("app_server.R", local = TRUE)

shinyApp(ui = ui, server = server)
