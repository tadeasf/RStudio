
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  titlePanel("Hra hádání čísel"),

  sidebarLayout(
    sidebarPanel(
      numericInput("tip", "Váš tip:", value = 50, min = 1, max = 100),
      actionButton("Odeslat", label = "Odeslat")
    ),

    mainPanel(
      textOutput("vyhodnoceni")
    )
  )
))
