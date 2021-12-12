
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  titlePanel("Vytvoření a stažení souboru s výsledky"),

  sidebarLayout(
    sidebarPanel(
        downloadButton("downloadTabulka", "Stáhnout tabulku"),
        downloadButton("downloadPicture", "Stáhnout obrázek"),
        downloadButton("downloadReport", "Stáhnout zprávu")
    ),

    mainPanel(
    )
  )
))
