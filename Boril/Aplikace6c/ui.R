
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

# funkce v JavaScriptu, která při stiku Enteru zmáčkne tlačítko
jscode <- '
$(function() {
  var $els = $("[data-proxy-click]");
  $.each(
    $els,
    function(idx, el) {
      var $el = $(el);
      var $proxy = $("#" + $el.data("proxyClick"));
      $el.keydown(function (e) {
        if (e.keyCode == 13) {
          $proxy.click();
        }
      });
    }
  );
});
'

shinyUI(fluidPage(
  tags$head(tags$script(HTML(jscode)),  # odkaz na definici funkce hlídající stisk Enteru
            # definice funkce umožňující označit text ve vstupním prvku "tip"
            tags$script("
            Shiny.addCustomMessageHandler('selectText', function(message) {
              $('#tip').select();
            });
          ")),

  titlePanel("Hra hádání čísel"),

  sidebarLayout(
    sidebarPanel(
      tagAppendAttributes(
        numericInput("tip", "Váš tip:", value = 50, min = 1, max = 100),
        `data-proxy-click` = "Odeslat"), # přiřazení funkce data-proxy-click pro hlídání stisku Enteru
      actionButton("Odeslat", label = "Odeslat")
    ),

    mainPanel(
      textOutput("vyhodnoceni")
    )
  )
))
