## ============ PLOT 3 ==============
## ====== STUDENT: Jorge I Lopez ====

## Imports ----------------------
library(lubridate)

## Set working directory --------
## insert your folder location below:
##path <- "D:/MIS DOCUMENTOS/Documents/COURSERA-WD/ExploratoryGraphs/ExData_Plotting1"
setwd(path)

## Read the file ---- REMEBER TO HAVE THE FILE= household_power_consumption.txt IN THE WORKING DIRECTORY
consumeAll <- read.table(file=paste0(path,"/household_power_consumption.txt"), header = TRUE, sep = ";")
consume <- consumeAll[dmy(consumeAll$Date) == as.Date("2007-02-01") | dmy(consumeAll$Date) == as.Date("2007-02-02") ,]
## Another option:  strptime(head(consumeAll$Date), format = "%d/%m/%Y")

## Open png file
png(filename = paste0(path,"/plot3.png"), width = 480, height = 480, units = "px")
## plotting the data

plot( dmy_hms(paste0(consume$Date," ",consume$Time)),
      consume$Sub_metering_1, 
      type = "l", ylab = "Energy sub metering", xlab = "")
lines(dmy_hms(paste0(consume$Date," ",consume$Time)),
      consume$Sub_metering_2, col="red")
lines(dmy_hms(paste0(consume$Date," ",consume$Time)),
      consume$Sub_metering_3, col="blue")
legend(x="topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty= 1,col = c("black","red","blue"))

## Closing png file
dev.off()

## Finish...
message(paste0("Graph generated succesfully. Stored in: ", path))