
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyServer(function(input, output) {

  output$vysledek <- renderText({
      inFile <- input$souborVstup
      
      if (is.null(inFile))
          return(NULL)
      
      data <- read.table(inFile$datapath, header = TRUE)
      
      if (ncol(data) < 1) {
          return("Soubor nemá žádný sloupec.")
      } else {
          return(paste0("Průměrná hodnota prvního sloupce je ", mean(data[, 1], na.rm = TRUE)))
      }

      
  })

})

## Poznámka: propracovanější příklad s volbou formátu viz zde: http://shiny.rstudio.com/gallery/file-upload.html
