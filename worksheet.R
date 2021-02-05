library(maddison)
library(dplyr)
data("maddison")

plotCountry<-function(aCountry="Austria",fromYear="1950",toYear="2010"){
  fromYearasDate=as.Date(paste(fromYear,"-01-01",sep=""))
  toYearasDate=as.Date(paste(toYear,"-01-01",sep=""))
  dataFiltered<-filter(maddison,
                       !is.null(gdp_pc),
                       country==aCountry,
                       year>fromYearasDate,
                       year<toYearasDate)
  plot(dataFiltered$year,dataFiltered$gdp_pc, type="l")
}
