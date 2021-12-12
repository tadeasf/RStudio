
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

data <- read.table("vyjmenovana_slova.txt",
                   header = TRUE, sep = "\t",
                   fileEncoding = "UTF-8-BOM",
                   stringsAsFactors = FALSE)

shinyServer(function(input, output) {

  output$vysledek <- renderText({
      input$tlacitko
      
      return( data$otázka[sample(1:nrow(data), size = 1)] )
  })

})
