temp<-tempfile()
par(mfrow = c(1,1))
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp,method = "curl")
house<-read.table(unz(temp,"household_power_consumption.txt"),sep=";",na.strings = "?",header = TRUE)
house$Date<-as.Date(house$Date,"%d/%m/%Y")
subhouse<-subset(house,Date==as.Date("01/02/2007",format="%d/%m/%Y")|Date==as.Date("02/02/2007",format="%d/%m/%Y"))
hist(subhouse[,3],col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.copy(png,"plot1.png")
dev.off()

