
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(openxlsx)
library(ggplot2)
library(rmarkdown)

shinyServer(function(input, output) {

  output$downloadTabulka <- downloadHandler(
      # This function returns a string which tells the client
      # browser what name to use when saving the file.
      filename = function() {
          "tabulka.xlsx"
      },
        
      # This function should write data to a file given to it by
      # the argument 'file'.
      content = function(file) {
          data <- data.frame(index = 1:5, hodnoty = c(3, 3.1, NA, 0, 2))
          write.xlsx(data, file = file)
      }
  )
  
  output$downloadPicture <- downloadHandler(
      filename = function() {
          "obrazek.pdf"
      },
      
      content = function(file) {
          tabulka <- data.frame(skupina = sample(c("Skupina A", "Skupina B"), size = 1000, replace = TRUE),
                            hodnocení = rnorm(n = 1000, mean = 3, sd = 2))
          
          ggplot(data = tabulka, aes(x = skupina, y = hodnocení, fill = skupina)) + geom_violin()
          ggsave(filename = file)
      }
  )
  
  output$downloadReport <- downloadHandler(
      ## propracovaný příklad s volbou výstupního formátu viz http://shiny.rstudio.com/gallery/download-knitr-reports.html
      filename = function() {
          "protokol.docx"
      },
      
      content = function(file) {
          # temporarily switch to the temp dir, in case you do not have write
          # permission to the current working directory
          owd <- setwd(tempdir())
          on.exit(setwd(owd))
          
          soubor <- paste0(tempfile(), ".Rmd")
          fid <- file(soubor, open = "w", encoding = "UTF-8")
          writeLines("# Protokol o zpracování dat", fid)
          writeLines("```{r}", fid)
          writeLines("pi*2", fid)
          writeLines("library(ggplot2)", fid)
          writeLines("tabulka <- data.frame(skupina = sample(c(\"Skupina A\", \"Skupina B\"),", fid)
          writeLines("                                          size = 1000, replace = TRUE),", fid)
          writeLines("                  hodnocení = rnorm(n = 1000, mean = 3, sd = 2))", fid)
          writeLines("ggplot(data = tabulka, aes(x = skupina, y = hodnocení, fill = skupina)) + geom_violin()", fid)
          writeLines("```", fid)
          close(fid)
          
          # out <- render(soubor, html_document(), encoding = "UTF-8")
          out <- render(soubor, word_document(), encoding = "UTF-8")
          file.rename(out, file)
      }
  )

})

