
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(ggplot2)

shinyServer(function(input, output) {

  output$vysledek <- renderPlot({
      input$tlacitko   # i když s ním nic nepočítáme, musíme ho zde zmínit, aby server věděl, že se má tato funkce volat při jeho stisku
      
      tabulka <- data.frame(skupina = sample(c("Skupina A", "Skupina B"), size = 1000, replace = TRUE),
                            hodnocení = rnorm(n = 1000, mean = 3, sd = 2))
      ggplot(data = tabulka, aes(x = skupina, y = hodnocení, fill = skupina)) +
          geom_violin()
  })

})
