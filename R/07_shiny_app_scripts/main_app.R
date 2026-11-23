# Load needed libraries
library("shiny")
library("bslib")

source("R/07_shiny_app_scripts/chloropleth_function.R", local = TRUE)


source("R/07_shiny_app_scripts/ui_app.R", local = TRUE)

source("R/07_shiny_app_scripts/backend_app.R", local = TRUE)

shinyApp(ui = ui, server = server)
