icedays <- read.csv("icedays.csv")
masstemp <- read.csv("masstemp.csv")
meantemp <- read.csv("meantemp.csv")
totalprecip <- read.csv("totalprecip.csv")
tropnights <- read.csv("tropnights.csv")

plot(masstemp$YEAR.S., masstemp$annC, 
     type='l', col='slateblue', lwd=1.6, 
     xaxs="i", yaxs="i",
     ylim=c(4,16), yaxp = c(5,15, 10),
     main="Historical & projected temperature change\nin Bonavista, NL and Cape Cod, MA", 
     xlab="Year", ylab="Mean annual temperature (ºC)") +
lines(masstemp$YEAR.S., masstemp$proj, 
      type="l", col = "slateblue", lwd=1.6, lty=3) +
lines(meantemp$DateTime, meantemp$Modeled.Historical, 
      type="l", col = "black", lwd=1.6) +
lines(meantemp$DateTime, meantemp$SSP2.4.5.Median, 
      type="l", col = "black", lwd=1.6, lty=3) + 
  text(1953, 5.6, labels ='Bonavista', 
       col='black', cex=1, adj=0) +
  text(1953, 11.2, labels ='Nantucket', 
       col='slateblue', cex=1, adj=0) 
legend('bottomright', 
       legend=c("Historical (modeled)", "Projected (SSP2)"), 
       col="black", lty=c(1,3), cex=0.9, bty='n')

grid(nx = NULL, ny = 11,
     lty = 3,      
     col = "#555555", 
     lwd = 0.5)   


plot(tropnights$DateTime, tropnights$Modeled.Historical, 
     type='l', col='red', lwd=1.7, xaxs="i", yaxs='i',
     ylim=c(-.2,80), yaxp = c(0,80, 8), 
     main="Historical & projected climate change in Bonavista, NL", 
     xlab="Year", ylab="Number of days") +
  lines(tropnights$DateTime, tropnights$SSP2.4.5.Median, 
        type="l", col = "red", lwd=1.7, lty=3) +
  lines(icedays$DateTime, icedays$Modeled.Historical, 
        type="l", col = "blue", lwd=1.7) +
  lines(icedays$DateTime, icedays$SSP2.4.5.Median, 
        type="l", col = "blue", lwd=1.7, lty=3) + 
  text(1955, 4, labels ='Nights above 18ºC', col='red', cex=1.1, adj=0) +
  text(1955, 74, labels ='Ice Days', col='blue', cex=1.1, adj=0) +
  legend('topright', 
         legend=c("Historical modeled", "Projected (SSP2)"), 
         col="black", lty=c(1,3), 
         cex=0.9, bty='n')

grid(nx = NULL, ny = 8,
     lty = 3,      # Grid line type
     col = "#555555", # Grid line color
     lwd = 0.5)   

