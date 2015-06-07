DB<-read.table("household_power_consumption.txt",header=T,sep=";")
db<-DB[DB$Date=="1/2/2007" | DB$Date=="2/2/2007",]

		#I chose to use lubridate's function, that are more easy to handle
library(lubridate)
a<-dmy(db$Date)
b<-hms(db$Time)
db$time<-a+hours(hour(b))+minutes(minute(b))+seconds(second(b))

		#reformating the column of interest
db$Global_active_power<-as.numeric(as.character(db$Global_active_power))

		#I am french, so to have the names of day in english, I change the system set up
Sys.getlocale("LC_TIME")->zone
Sys.setlocale("LC_TIME", "English")

		#drawing this plot
with(db,plot(time,Global_active_power,xlab="",ylab="Global Active Power (killowatts)",type="l"))

		#create the png file
dev.copy(png, file =("plot2.png"),width = 480, height = 480, units = "px")
dev.off() 

		#resetting of system to its initial state (french for me)
Sys.setlocale("LC_TIME", zone)