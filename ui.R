#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)
library(ggplot2)

ui <- shinyUI(fluidPage(
  
  titlePanel("Option Pricing Using Black Scholes Model"),
  
  sidebarLayout(
    sidebarPanel(
      numericInput('stockprice','Stock Price',100),
      numericInput('strike','Strike Price',100),
      sliderInput('maturity','Maturity (months)',min=1,max=60,value=1,step=1),
      sliderInput('volatility','Volatility',min=0,max=1,value=0.10,step=0.01),
      sliderInput('riskfreerate','Risk free rate',min=0.0,max=1,value=0.1,step=0.01),
      sliderInput('divrate','Dividend rate',min=0.0,max=1,value=0.01,step=0.01),
      hr(),
      p('Please refer to following for more details:',
        a("Option Pricing: Black Scholes Models", 
          href = "https://en.wikipedia.org/wiki/Black-Scholes_model")),
      hr()
    ),
    
    mainPanel(
      p('Call price'),
      textOutput("BScall"),
      hr(),
      p('Put price'),
      textOutput("BSput"),
      hr(),
      tabsetPanel(
        tabPanel("Calls", plotOutput("plotCall",width="100%")), 
        tabPanel("Puts", plotOutput("plotPut",width="100%")) 
      )
    )
  )  
))