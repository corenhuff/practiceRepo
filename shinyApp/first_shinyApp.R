# Coren Huff
# 2026-06-04

#load libraries
library(shiny)

ui <- navbarPage("DSPG",
                 tabPanel("Overview", 
                          h3("Rural Infrastrucutre and Health Outcomes"), 
                          textInput("name", "Enter a name"),
                          textOutput("q"), 
                          fluidRow(
                            column(4, 'hey'),
                            column(4, "i'll be gone today"), 
                            column(4, "but i'll be back all around the way")
                            ) 
                          ),
                 
                 tabPanel("Results", 
                          textOutput("results")
                          )
)

server <- function(input, output,
                   session) {
  output$q <- renderText({
    paste0("How is your day, ",
           input$name,
           "?")
  })
  output$results <- renderText({
    paste("Results will go here")
  })
  
  
}

shinyApp(ui, server)