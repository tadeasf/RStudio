
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  titlePanel("Graf náhodných čísel"),

  sidebarLayout(
    sidebarPanel(
      actionButton("tlacitko", "Stiskni mě")
    ),

    mainPanel(
      plotOutput("vysledek"),
      withMathJax(),
      p("Také lze psát vzorce ve formátu Mahtjax $$f_0 \\ne f^0$$ a $${x_{1,2}} = \\frac{{ - b \\pm \\sqrt {{b^2} - 4ac} }}{{2a}}.$$")
    )
  )
))
