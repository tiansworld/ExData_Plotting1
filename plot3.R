# Read data and subsetting
# If you want to run this code correctly on your computer, 
# you should change data location to your own location. 
# In this code, household_power_consumption.txt is supposed 
# to stored in default R working directory. And the png plot
# directory is at "rprog/ExData_Plotting1/".

active_power <- read.csv("household_power_consumption.txt",sep=";",comment.char="",stringsAsFactor=F,na.strings="?")

sub_power <- subset(active_power, Date=="1/2/2007"|Date=="2/2/2007")

# Change data time format
#if ("dplyr" %in% installed.packages()) {
#    library(dplyr)
#    power_df <- tbl_df(sub_power)
#    time_string <- paste(power_df$Date,power_df$Time) #merge data and time into one variable
#    power_df <- mutate(power_df,Date_Time=time_string) # Add new column name Date_Time
#    power_df <- mutate(power_df,Date_Time=strptime(Date_Time,"%d/%m/%Y %H:%M:%S") %>% as.character())
#} else {
    Date_Time <- paste(sub_power$Date,sub_power$Time) #merge data and time into one variable
    Date_Time <- strptime(Date_Time,"%d/%m/%Y %H:%M:%S")
    power_df <- cbind(sub_power,Date_Time) #Add new column
#}
# plot
with(power_df, {
    plot(Date_Time,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
    lines(Date_Time,Sub_metering_2,col="red")
    lines(Date_Time,Sub_metering_3,col="blue")
    legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1  ","Sub_metering_2  ","Sub_metering_3  ")) ## The option and spaces are added to avoid legend text from exceeding the board of the legend box in 480x480px png file.

})
# Save the plot to png file
dev.copy(png, "rprog/ExData_Plotting1/plot3.png", width=480, height=480, units="px")
dev.off()
