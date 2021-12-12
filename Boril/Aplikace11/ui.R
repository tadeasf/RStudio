
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  titlePanel("Obsah obdélníku"),

  sidebarLayout(
    sidebarPanel(
      sliderInput("stranaA", "Strana A:", min = 0, max = 10, value = 5, step = 1),
      sliderInput("stranaB", "Strana B:", min = 0, max = 10, value = 5, step = 1)
    ),

    mainPanel(
        tabsetPanel(
            tabPanel("Výsledky",
                p("Zde se zobrazuje výsledek výpočtu."),  # odstavec textu
                textOutput("vysledek")  # text poslaný ze server.R
            ),
            tabPanel("Instrukce",
                h3("Podrobný návod"),
                p("Vítejte v naší aplikaci. Je určena pro běžné uživatele, kteří si touží sem tam vypočítat obsah nějakého toho obdélníku."),
                p("Tato aplikace nabízí několik klíčových vlastností, mezi které patří"),
                tags$ul(
                    tags$li("blesková rychlost,"),
                    tags$li("příjemná obsluha,"),
                    tags$li("a v neposlední řadě také neomylnost.")
                ),
                p("Ovládání je natolik primitivní, že není nutné vysvětlovat.")
                
            )
        )
        
    )
  )
))
