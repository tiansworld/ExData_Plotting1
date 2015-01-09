# Read data and subsetting
active_power <- read.csv("rprog/household_power_consumption.txt",sep=";",comment.char="",stringsAsFactor=F,na.strings="?")

sub_power <- subset(active_power, Date=="1/2/2007"|Date=="2/2/2007")

# Change data time format
if ("dplyr" %in% installed.packages()) {
    library(dplyr)
    power_df <- tbl_df(sub_power)
    time_string <- paste(power_df$Date,power_df$Time) #merge data and time into one variable
    power_df <- mutate(power_df,Date_Time=time_string) # Add new column name Date_Time
}
    Date_Time <- paste(sub_power$Date,sub_power$Time) #merge data and time into one variable
    power_df <- cbind(sub_power,Date_Time) #Add new column

# plot
plot(strptime(power_df$Date_Time,"%d/%m/%Y %H:%M:%S"),power_df$Global_active_power,pch=22,xlab="",ylab="Global Active Power (Kilowatts)")






