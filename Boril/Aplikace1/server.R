
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyServer(function(input, output) {

  output$vysledek <- renderText({
      r <- input$polomer
      if (is.na(r) | r < 0) {
          return("Špatný poloměr.")
      } else {
          obsah <- pi*r^2
          return(obsah)
      }
  })

})
