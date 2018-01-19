## ============ PLOT 4 ==============
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
png(filename = paste0(path,"/plot4.png"), width = 480, height = 480, units = "px")
## plotting the data

par(mfrow = c(2,2), mar=c(2,2,2,2))
## -------------------- PLOT 1 ---------------------
plot( dmy_hms(paste0(consume$Date," ",consume$Time)),
      consume$Global_active_power, 
      type = "l", ylab = "Global Active Power", xlab = "", yaxt="n")
axis(side = 2, at = c(0,1000,2000,3000), labels = c("0","2","4","6"))
## -------------------- PLOT 2 ---------------------
plot( dmy_hms(paste0(consume$Date," ",consume$Time)),
      consume$Voltage, 
      type = "l", ylab = "Voltage", xlab = "datatime")
## -------------------- PLOT 3 ---------------------
plot( dmy_hms(paste0(consume$Date," ",consume$Time)),
      consume$Sub_metering_1, 
      type = "l", ylab = "Energy sub metering", xlab = "")
lines(dmy_hms(paste0(consume$Date," ",consume$Time)),
      consume$Sub_metering_2, col="red")
lines(dmy_hms(paste0(consume$Date," ",consume$Time)),
      consume$Sub_metering_3, col="blue")
legend(x="topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty= 1,col = c("black","red","blue"))
## -------------------- PLOT 4 ---------------------
plot( dmy_hms(paste0(consume$Date," ",consume$Time)),
      consume$Global_reactive_power, 
      type = "l", ylab = "Global_reactive_power", xlab = "datatime")

## Closing png file
dev.off()

## Finish...
message(paste0("Graph generated succesfully. Stored in: ", path))