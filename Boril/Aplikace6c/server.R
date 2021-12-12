
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#


library(shiny)


# Oblast "Run once": spustí se jen jednou, a to pro všechny uživatele společně
# Zde je možné načítat knihovny, společná data (např. soubor se slovíčky),
# nastavit globální konstanty, provést přípravné výpočty.

rozsah <- 1:100   # rozsah hádaných čísel


shinyServer(function(input, output, session) {  # ještě navíc parametr session
    # Oblast "Run once per user": spustí se vždy, když jednotlivý uživatel navštíví
    # naši aplikaci, nebo když refreshuje prohlížeč. Zde je dobré provést výpočty,
    # které jsou unikátní pro každého uživatele (např. vymyšlení náhodného čísla pro hádání).
    
    mysleneCislo <- sample(rozsah, size = 1)
    

    output$vyhodnoceni <- renderText({
        # Oblast "Run often": provádí se pokaždé, když uživatel změní hodnotu nějakého vstupu,
        # nebo když stiskne tlačítko Submit (pokud je přítomno).
        
        input$Odeslat  # posloucháme stisk tlačítka
        
        session$sendCustomMessage("selectText", "select")  # volání příkazu v JavaScriptu k označení textu, viz definice funkce selectText v ui.R
        
        if (isolate(input$tip) < mysleneCislo) {  # a ignorujeme změny input$tip
            return("Zkuste vyšší číslo.")
        } else if (isolate(input$tip) > mysleneCislo) {
            return("Zkuste nižší číslo.")
        } else {
            mysleneCislo <<- sample(rozsah, size = 1)  # Pozor, pozor! Kdybychom provedli klasické <-,
                                               # vytvoří se tím "lokální" proměnná se stejným názvem,
                                               # která zde zastíní tu vnější, ale nijak ji nezmění.
                                               # Tato nová proměnná je k dispozici jen uvnitř funkce renderText,
                                               # pak zase zanikne.
                                # Doporučené čtení (více o tomto):
                                #   http://stackoverflow.com/questions/32588056/change-variable-outside-of-reactive-function-context
                                #   http://shiny.rstudio.com/articles/scoping.html
            return("Gratuluji, to je ono! A už si myslím nové číslo, takže můžete hrát znovu.")
        }
    })
    

})


