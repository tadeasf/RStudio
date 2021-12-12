
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  titlePanel("Obsah kruhu"),

  sidebarLayout(
    sidebarPanel(
      numericInput("polomer", "Poloměr:", value = 1, min = 0)   # polomer je název prvku pro server.R
    ),

    mainPanel(
      textOutput("vysledek")     # vysledek je název prvku pro server.R
    )
  )
))
