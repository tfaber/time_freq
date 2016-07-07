
# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Time-frequency power estimation"),
  
  p("Time-frequency results for a paper in progress. Choose electrodes to display individual power plots"),
  
  br(),
  br(),
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
    
      selectInput("select1", label = h5("Select Condition"), 
                  choices = list("High pred", "Low pred", "Unpredict","Pred non"), selected = "High pred"),
      
      
      br(),
      
      helpText("Conditions represent: High predictable actions (70-30%),
               Low predictable actions (50-50%),
               Unpredicted actions (30-70%),
               Predictable no-movements (100%).
               For all conditions we estimate power relative to the baseline period."),
      
      selectInput("select2", label = h5("Select frequency band"), 
                  choices = list("Alpha (8-14)", "Beta (20-30)", "Theta (5-8)"), selected = "Alpha (8-14)")
      

      ),
    
      mainPanel(
                 plotlyOutput("Plot",width=800,height=800)
                    )
        )
      
))
