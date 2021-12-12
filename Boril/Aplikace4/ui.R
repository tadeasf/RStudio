
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  titlePanel("Dotazník stravování"),

  sidebarLayout(
    sidebarPanel(
        textInput("jmeno", "Jméno:", value = "Arnošt"),
        checkboxInput("vegetarian", "Vegetarián"),
        radioButtons("pohlavi", "Pohlaví", c("Muž", "Žena")),
        checkboxGroupInput("chody", "Požaduje", c("Předkrm", "Polévka", "Hlavní jídlo", "Zákusek"), selected = c("Polévka", "Hlavní jídlo"))
    ),

    mainPanel(
        h3("Shrnutí"),   # nadpis
        textOutput("vystup")  # text poslaný ze server.R
    )
  )
))
