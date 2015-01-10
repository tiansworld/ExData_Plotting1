# Read data and subsetting
# If you want to run this code correctly on your computer, 
# you should change data location to your own location. 
# In this code, household_power_consumption.txt is supposed 
# to stored in default R working directory. And the png plot
# directory is at "rprog/ExData_Plotting1/".

active_power <- read.csv("./household_power_consumption.txt",sep=";",comment.char="",stringsAsFactor=F,na.strings="?")

sub_power <- subset(active_power, Date=="1/2/2007"|Date=="2/2/2007")


# plot
hist(sub_power$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

# Save plot to png
dev.copy(png,"rprog/ExData_Plotting1/plot1.png",width=480,height=480,units="px")
dev.off()
