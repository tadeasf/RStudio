
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
    rv <- reactiveValues()   # zatím prázdný seznam (list) reaktivních proměnných
    rv$hodnoceni <- ""   # vytváříme reaktivní proměnnou
    
    mysleneCislo <- sample(rozsah, size = 1)  # počáteční myšlené číslo
    
    observe({
        input$Odeslat  # posloucháme stisk tlačítka
        odhad <- isolate(input$tip)   # a ignorujeme změny input$tip
        
        if (is.na(odhad)) {
            rv$hodnoceni <<- ""
        } else if (odhad < mysleneCislo) {
            rv$hodnoceni <<- "je_mensi"
        } else if (odhad > mysleneCislo) {
            rv$hodnoceni <<- "je_vetsi"
        } else {
            mysleneCislo <<- sample(rozsah, size = 1)
            rv$hodnoceni <<- "rovno"
        }
    })
    
    output$vyhodnoceni <- renderText({
        if (rv$hodnoceni == "je_mensi") {
            return("Zkuste vyšší číslo.")
        } else if (rv$hodnoceni == "je_vetsi") {
            return("Zkuste nižší číslo.")
        } else if (rv$hodnoceni == "rovno") {
            return("Gratuluji, to je ono! A už si myslím nové číslo, takže můžete hrát znovu.")
        } else {
            return("Zadejte svůj odhad.")
        }
    })
    
    output$obrazek <- renderUI({
        if (rv$hodnoceni == "je_mensi") {
            img(src = "nahoru.png")
        } else if (rv$hodnoceni == "je_vetsi") {
            img(src = "dolu.png")
        } else if (rv$hodnoceni == "rovno") {
            img(src = "vitezstvi.png")
        } else {
            # nic nezobrazovat
        }
    })

})


