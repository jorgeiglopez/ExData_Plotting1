## ============ PLOT 1 ==============
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
png(filename = paste0(path,"/plot1.png"), width = 480, height = 480, units = "px")
## Ploting the histogram
hist(as.numeric(consume$Global_active_power), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowats)", xaxt="n")
## Changing X-axis scale
axis(side = 1, at = c(0,1000,2000,3000), labels = c("0","2","4","6"))
## Closing png file
dev.off()

## Finish...
message(paste0("Graph generated succesfully. Stored in: ", path))

