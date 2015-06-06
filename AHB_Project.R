BeeTable = read.table("beedata.csv", sep=",", header=TRUE)
hist(BeeTable$Transit.Time, breaks=seq(0, 21, by=2))
#curve(dgamma(x= BeeTable$Transit.Time, shape=2, scale=1.5), from= 0, to = 20, main = "Gamma Distribution")
dgamma(x= BeeTable$Transit.Time, shape=2, scale=1.5)



library(shiny)

# Define UI for random distribution application 
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Fitting the Data"),
  
  # Sidebar with controls to select the random distribution type
  # and number of observations to generate. Note the use of the
  # br() element to introduce extra vertical spacing
  sidebarLayout(position = "left",
    sidebarPanel(
      radioButtons("dist", "Distribution type:",
                   c("Normal" = "norm",
                     "Gamma" = "gamma")),
      br(),
      
      sliderInput("shape", 
                  "Parameters of Gamma Distribution", 
                  value = 1,
                  min = 0, 
                  max = 5)
    ), 
    
    #somehow make this show alpha and beta values
    
    # Show a tabset that includes a plot, summary, and table view
    # of the generated distribution
    mainPanel(
      tabsetPanel(type = "tabs", 
                  tabPanel("Plot", plotOutput("plot")), 
                  tabPanel("Table", tableOutput("table"))
      )
    )
  )
))


#THE PROBLEM
#The African Honey Bee (AHB), also nicknamed the "killer bee", has had a significant impact on the agricultural economy. This species is unique from many other 
bees because of its extremely defensive nature and the tendency of its colonies to swarm and spread. The implications of the AHB has been astronimical. Areas populated by 
AHB colonies have been quarantined, prohibiting the importation of the European Honey Bee. The subsequent lack of bees has taken a toll on crop pollination. 
Thus, there has been strong interest in predicting the arrival of the AHB to the United States. 

#In order to obtain the data below, cardboard box traps with a chemical attractant were placed every 300-500 m (ASK SAMSON TO INTERPRET THIS PART). Then, every month, the 
boxes were checked for presence of the AHB. 

It was initially thought that the data would follow a normal distribution. 
#Samson's part about why the normal distribution is not a good fit and how he evaluated it mathematically

#The Gamma Distribution is a continuous probability density function that is used to model the time required to perform some operation. Just as the Poisson distribution is the 
time-continuous distribution of the binomial, so is the gamma distribution the time-continuous analog of the negative binomial.
The Gamma is a prediction of the time of the "rth" random arrival of some event. In this case, we were looking at the rth bee

A Gamma distribution was chosen to model the unimodal, skewed distribution which takes on only positive values. 

Here they look at the reciprocal of speed, 
the "transit time" which models instead, the time required to travel a fixed distance. 


# bTHINGS TO FIGURE OUT
how to make a slider apply to this data

#Shortcomings: This data does not show the impact of the environment--it assumes completely random with no outisde factors. Mites....