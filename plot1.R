#setwd("C:/Users/Sankar/gitDir/ExData_Plotting1")

fileName <- as.character("../../Desktop/Coursera-R/ExploratoryDA/exdata-data-household_power_consumption/household_power_consumption.txt")

# This reads data from Feb 1, 2007 00:00:00 to Feb 2, 2007 23:59:00.
# This data set has one row per minute of each day since sampling is done every minute.
# The data starts on Dec 16, 2006 at 17:24:00. Number of minutes in that partial day is 396 minutes (rows).
# Each full day has 1440 minutes.
# So in Dec 2006, we have to skip 15 full days from Dec 17-31 and in Jan 2007 we have to skip 31 full days for a total of 46 days.
# This corresponds to 46 x 1440 = 66240 rows.
# So we have to skip a total of 396 + 66240 = 66636 rows and read a total of 2880 rows corresponding to the required two days.
d <- read.table(fileName,header=TRUE,sep=";",skip= 66636,nrow=2880,col.names=colnames(read.table(fileName,sep=";",nrow=1,header=TRUE)))
#d <- gsub("?", "NA", d)

TS <- paste(d$Date,d$Time)
TimeStamp <- as.POSIXlt(strptime(TS, "%d/%m/%Y %H:%M:%S",tz="Europe/Paris"))
electricity <- cbind(TimeStamp,d)

png(filename = "plot1.png",
    width = 480, height = 480)
hist(electricity$Global_active_power,col="red",main="Global Active Power", xlab="Global Active Power (kilowatts)",ylab="Frequency")
dev.off()