
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  titlePanel("Nahrání souboru od uživatele přes internet"),

  sidebarLayout(
    sidebarPanel(
      fileInput("souborVstup", "Nahrát soubor")
    ),

    mainPanel(
        textOutput("vysledek")
    )
  )
))
