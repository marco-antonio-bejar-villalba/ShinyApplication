#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(maddison)
library(dplyr)
library(ggplot2)
data("maddison")
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    

    
    selectData<-reactive({
        fromYearasDate<-input$date[1]
        toYearasDate<-input$date[2]
        aCountry<-input$country
        dataFiltered<-filter(maddison,
                             !is.null(gdp_pc),
                             country==aCountry,
                             year>fromYearasDate,
                             year<toYearasDate)
        dataFiltered
    })

    output$distPlot <- renderPlot({

        datatoUse<-selectData()
        ggplot(datatoUse,aes(x=year,y=gdp_pc,colour=country))+geom_line()+geom_point()
        #plot(datatoUse$year,datatoUse$gdp_pc, type="l")

    })

})
