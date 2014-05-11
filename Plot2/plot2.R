destfile <- "./household_power_consumption.txt"
test1 <- read.table(destfile,header=TRUE,sep = ";",colClasses = "character",na.strings = "?")
test1[,1] <- as.Date(test1[,1],"%d/%m/%Y")
test2 <- subset(test1,(test1[,1] == '2007-02-01' | test1[,1] == '2007-02-02'))
test2 <- within(test2, datetime <- paste(test2$Date, test2$Time, sep = ' '))
test2$datetime <- strptime(test2$datetime,format="%Y-%m-%d %H:%M:%S")

test2[,3] <- as.character(test2[,3])
test2[,4] <- as.character(test2[,4])
test2[,5] <- as.character(test2[,5])
test2[,6] <- as.character(test2[,6])
test2[,7] <- as.character(test2[,7])
test2[,8] <- as.character(test2[,8])
test2[,9] <- as.character(test2[,9])

test2[,3] <- as.numeric(test2[,3])
test2[,4] <- as.numeric(test2[,4])
test2[,5] <- as.numeric(test2[,5])
test2[,6] <- as.numeric(test2[,6])
test2[,7] <- as.numeric(test2[,7])
test2[,8] <- as.numeric(test2[,8])
test2[,9] <- as.numeric(test2[,9])

plot(test2[,c(10,3)],type="l",xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(png,'plot2.png')
dev.off()



