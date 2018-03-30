# Option Pricing Using Black Scholes Models

Agenda
========================================================

- Introduction
- Instructions to use the app
- R Code
- Access to the Presentation Slides

Introduction
========================================================

- The price of a call or put option in this model is given by Black Scholes Formula.
- Black–Scholes–Merton model is a mathematical model of a financial market containing derivative investment
  instruments. From the partial differential equation in the model, known as the Black–Scholes equation, one can deduce   the Black–Scholes formula, which gives a theoretical estimate of the price of European style options and shows that
  the option has a unique price regardless of the risk of the security and its expected return (instead replacing the    security's expected return with the risk-neutral rate). 
- The formula led to a boom in options trading and provided mathematical legitimacy to the activities of the Chicago     Board Options Exchange and other options markets around the world.
- It is widely used, although often with adjustments and corrections, by options market participants.
- Many empirical tests have shown that the Black–Scholes price is "fairly close"to the observed prices, although there   are well-known discrepancies such as the "option smile".
- Please refer to following for more details: https://en.wikipedia.org/wiki/Black–Scholes_model  

Instructions to use the app
========================================================
- Please click the below link to access the app:
  https://ascoolguy66.shinyapps.io/OptionPricing/

- We need to change the following parameters to calculate option prices:
  - S:  is the stock price,  
  - K:  is the strike price,  
  - T:  is option maturity,  
  - v:  is the annualized volatility of the stock, 
  - r:  is the continuous risk free rate of interest for maturity T, 
  - q: is the annual dividend rate, assuming it is paid continuously.
 
- After entering all the values, it will show Call and Put Option Prices. 

- Also, please click on the Calls or Puts tab to review option price change for different Strike Price.

R Codes
========================================================

There are two R Codes: Server.R and UI.R. Please click the below link to view these code.
 https://github.com/ascoolguy66/OptionPricing
 
 - Server.R: includes R code for server side
 - UI.R: includes R Code for User Interface
 
Presentation
========================================================
The presensation slides can be accessed at http://rpubs.com/ascoolguy66/OptionPricing
