#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Estimates of GDP per capita for country."),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        
        sidebarPanel(
            sliderInput("date",
                        "Date interval:",
                        step = 366,
                        timeFormat = "%Y",
                        min = as.Date("1950-01-01","%Y-%m-%d"),
                        max = as.Date("2010-01-01","%Y-%m-%d"),
                        value = c(as.Date("1950-01-01","%Y-%m-%d"),
                                  as.Date("2010-01-01","%Y-%m-%d"))),
            selectInput("country","Country",c("Austria","Belgium","Denmark",
                                              "United Arab Emirates", "Mexico",
                                              "Chile","Brazil"))
        ),

        # Show a plot of the generated distribution
        mainPanel(
            p("This app uses the madisson data set to show 
              the GDP per capita of many countries."),
            p("You only have to slide the date interval in order to stablish the
              years that will be graphed, the select control permits you select
              the contry that will be used."),
            plotOutput("distPlot")
        )
    )
))
