# Coren Huff
# 2026-06-04

#load libraries
library(shiny)

ui <- fluidPage(
  textInput("name", "Enter a name"),
  textOutput("q")
)

server <- function(input, output,
                   session) {
  output$q <- renderText({
    paste0("What is your favorite hobby, ",
           input$name,
           "?")
  })
  
  
}

shinyApp(ui, server)