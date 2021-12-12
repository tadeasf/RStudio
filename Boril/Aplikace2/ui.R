
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
        h3("Výsledky"),   # nadpis
        p("Zde se zobrazuje výsledek výpočtu."),  # odstavec textu
        textOutput("vysledek")  # text poslaný ze server.R
    )
  )
))
