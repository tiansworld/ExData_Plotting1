# Read data and subsetting
active_power <- read.csv("rprog/household_power_consumption.txt",sep=";",comment.char="",stringsAsFactor=F,na.strings="?")

sub_power <- subset(active_power, Date=="1/2/2007"|Date=="2/2/2007")


# plot
hist(sub_power$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")






