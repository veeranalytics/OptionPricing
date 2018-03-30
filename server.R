#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)
library(ggplot2)

# Define server logic for random distribution application
shinyServer <- function(input, output) {
  
  #Generate Black-Scholes values
  BS = function(S,K,T,v,rf,dv) {
    d1 = (log(S/K) + (rf-dv+0.5*v^2)*T)/(v*sqrt(T))
    d2 = d1 - v*sqrt(T)
    bscall = S*exp(-dv*T)*pnorm(d1) - K*exp(-rf*T)*pnorm(d2)
    bsput = -S*exp(-dv*T)*pnorm(-d1) + K*exp(-rf*T)*pnorm(-d2)
    res = c(bscall,bsput)
  }
  
  #Call option price
  output$BScall <- renderText({ 
    #Get inputs
    S = input$stockprice
    K = input$strike
    T = (input$maturity)/12
    v = input$volatility
    rf = input$riskfreerate
    dv = input$divrate
    res = round(BS(S,K,T,v,rf,dv)[1],4)
  })
  
  #Put option price
  output$BSput <- renderText({ 
    #Get inputs
    S = input$stockprice
    K = input$strike
    T = input$maturity
    v = input$volatility
    rf = input$riskfreerate
    dv = input$divrate
    res = round(BS(S,K,T,v,rf,dv)[2],4)
  })
  
  #Call plot
  output$plotCall <- renderPlot({
    S = input$stockprice
    K = input$strike
    T = input$maturity
    v = input$volatility
    rf = input$riskfreerate
    dv = input$divrate
    vcall = NULL; vput = NULL
    strikes = seq(K-30,K+30)
    for (k in strikes) {
      vcall = c(vcall,BS(S,k,T,v,rf,dv)[1])
      vput = c(vput,BS(S,k,T,v,rf,dv)[2])
    }
    df = data.frame(strikes,vcall,vput)
    ggplot(df,aes(x=strikes,y=vcall)) + geom_point(color=strikes) + xlab("Strike Price") + ylab("Call Option Price")
  }, height = 400, width = 600) 
    
  
  #Put plot
  output$plotPut <- renderPlot({
    S = input$stockprice
    K = input$strike
    T = input$maturity
    v = input$volatility
    rf = input$riskfreerate
    dv = input$divrate
    vcall = NULL; vput = NULL
    strikes = seq(K-30,K+30)
    for (k in strikes) {
      vcall = c(vcall,BS(S,k,T,v,rf,dv)[1])
      vput = c(vput,BS(S,k,T,v,rf,dv)[2])
    }
    df = data.frame(strikes,vcall,vput)
    ggplot(df,aes(x=strikes,y=vput)) + geom_point(color=strikes) + xlab("Strike Price") + ylab("Put Option Price")
  }, height = 400, width = 600)
  
  
}