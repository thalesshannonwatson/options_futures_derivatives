library(shiny)
source("helper.R")

shinyUI(fluidPage(
  titlePanel(h1("Option Strategies")),
  
  sidebarLayout(
    sidebarPanel(
      h2("Combination"),
      h3("Option")
      , selectInput("position", label = h4("Position"),
                   choices = list("None" = NONE, "Long" = LONG, "Short" = SHORT),
                   selected = NONE)
      , selectInput("right", label = h4("Right"),
                   choices = list("Call" = CALL, "Put" = PUT), selected = CALL)
      , numericInput("premium", label = h4("Premium"),
                    value = 2.5, step = 0.01)
      , numericInput("strike", label = h4("Strike price"),
                    value = 50, step = 0.01)
    ),
    mainPanel(
      textOutput("txtcheck")
      , plotOutput("maturity")
    )
  )
))