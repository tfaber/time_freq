library(shiny)
library(ggplot2)
library(plotly)

x1=read.table("data/full70alpha.txt",header=F,dec=".") # READ DATA
x2=read.table("data/full70beta.txt",header=F,dec=".")
x3=read.table("data/full70theta.txt",header=F,dec=".",",")
x4=read.table("data/full50alpha.txt",header=F,dec=".")
x5=read.table("data/full50beta.txt",header=F,dec=".")
x6=read.table("data/full50theta.txt",header=F,dec=".",",")
x7=read.table("data/full30alpha.txt",header=F,dec=".")
x8=read.table("data/full30beta.txt",header=F,dec=".")
x9=read.table("data/full30theta.txt",header=F,dec=".",",")
x10=read.table("data/full100alpha.txt",header=F,dec=".")
x11=read.table("data/full100beta.txt",header=F,dec=".")
x12=read.table("data/full100theta.txt",header=F,dec=".",",")
labels=read.table("data/biosemi64lay.txt",header=F)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  # Expression that generates a histogram. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should re-execute automatically
  #     when inputs change
  #  2) Its output type is a plot
  
  ## you need to refer to an object un ui.R to make it reactive, input$select is nested in renderPlot
  
  output$Plot <- renderPlotly({
    
    #setwd("H:/Desktop/Statistics/R Shiny/timefreq_data/data")
    ######################################################## Select data first
    
    if(input$select1 == "High pred") { ################################################ HP
      
      if(input$select2 == "Alpha (8-14)") {
        x=x1
      }
      if(input$select2 == "Beta (20-30)") {
        x=x2
      }
      if(input$select2 == "Theta (5-8)") {
        x=x3
      }
    } 
    if(input$select1 == "Low pred") {  ################################################ LP
      
      if(input$select2 == "Alpha (8-14)") {
        x=x4
      }
      if(input$select2 == "Beta (20-30)") {
        x=x5
      }
      if(input$select2 == "Theta (5-8)") { 
        x=x6
      }
    } 
    if(input$select1 == "Unpredict") {  ################################################ UP
      
      if(input$select2 == "Alpha (8-14)") {
        x=x7
      }
      if(input$select2 == "Beta (20-30)") {
        x=x8
      }
      if(input$select2 == "Theta (5-8)") {
        x=x9
      }
    } 
    if(input$select1 == "Pred non") { ################################################ PN
      
      if(input$select2 == "Alpha (8-14)") {
        x=x10
      }
      if(input$select2 == "Beta (20-30)") {
        x=x11
      }
      if(input$select2 == "Theta (5-8)") {
        x=x12
      }
    }
    
    bin=seq(-2,1.5,by=0.05) # time window
    
    rownames(x)<-labels$V6
    colnames(x)<-bin
    
    p<-plot_ly(z = as.matrix(x),x=bin,y=rownames(x), type = "surface", showscale=F) %>%
      layout(title = paste("Power changes over time in", input$select2),
             scene = list(
               xaxis = list(title = "Time"), 
               yaxis = list(title = "Channel",showticklabels=F), 
               zaxis = list(title = "Power")))
    p
    
    
  })
  
  
})
