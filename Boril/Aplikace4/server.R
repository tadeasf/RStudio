
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyServer(function(input, output) {

  output$vystup <- renderText({
      veta <- input$jmeno
      
      if (input$vegetarian == TRUE) {
          veta <- paste0(veta, " je vegetarián")
      } else {
          veta <- paste0(veta, " není vegetarián")
      }
      
      if (input$pohlavi == "Žena") {
          veta <- paste0(veta, "ka")
      }
      
      veta <- paste0(veta, " a přeje si tyto chody: ")
      pocet <- length(input$chody)
      
      if (pocet == 0) {
          veta <- paste0(veta, "nic.")
      } else {
          for (I in 1: pocet) {
              chod <- input$chody[I]
              veta <- paste0(veta, tolower(chod)) # převod na malá písmena
              if (I != pocet) {
                  veta <- paste0(veta, ", ")
              } else {  # poslední prvek seznamu
                  veta <- paste0(veta, ".")
              }
          }
      }

      return(veta)
  })

})
