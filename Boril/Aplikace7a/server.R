
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#


library(shiny)
# Oblast "Run once"

rozsah <- 1:100   # rozsah hádaných čísel


shinyServer(function(input, output) {
    # Oblast "Run once per user"
    
    mysleneCislo <- sample(rozsah, size = 1)
    
    output$vyhodnoceni <- renderText({
        
        input$Odeslat  # posloucháme stisk tlačítka
        
        if (isolate(input$tip) < mysleneCislo) {  # a ignorujeme změny input$tip
            return("Zkuste vyšší číslo.")
        } else if (isolate(input$tip) > mysleneCislo) {
            return("Zkuste nižší číslo.")
        } else {
            mysleneCislo <<- sample(rozsah, size = 1)  # pozor! <- by vytvořilo novou lokální proměnnou
            return("Gratuluji, to je ono! A už si myslím nové číslo, takže můžete hrát znovu.")
        }
    })
    
    output$obrazek <- renderUI({
        
        input$Odeslat  # posloucháme stisk tlačítka
        
        if (isolate(input$tip) < mysleneCislo) {
            img(src = "nahoru.png")
        } else if (isolate(input$tip) > mysleneCislo) {
            img(src = "dolu.png")
        } else {
            img(src = "vitezstvi.png")
        }
    })

})


