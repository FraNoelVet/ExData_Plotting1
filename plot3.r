DB<-read.table("household_power_consumption.txt",header=T,sep=";")
db<-DB[DB$Date=="1/2/2007" | DB$Date=="2/2/2007",]

		#I chose to use lubridate's function, that are more easy to handle
library(lubridate)
a<-dmy(db$Date)
b<-hms(db$Time)
db$time<-a+hours(hour(b))+minutes(minute(b))+seconds(second(b))

		#reformating of all columns
db$Sub_metering_1<-as.numeric(as.character(db$Sub_metering_1))
db$Sub_metering_2<-as.numeric(as.character(db$Sub_metering_2))
db$Sub_metering_3<-as.numeric(as.character(db$Sub_metering_3))
		#I am french, so to have the names of day in english, I change the system set up
Sys.getlocale("LC_TIME")->zone
Sys.setlocale("LC_TIME", "English")

#graph 3
with(db,plot(time,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"))
with(db,lines(time,Sub_metering_2,col="red"))
with(db,lines(time,Sub_metering_3,col="blue"))
legend("topright",col=c("black","red","blue" ),bty="o",lty=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

		#create the png file
dev.copy(png, file =("plot3.png"),width = 480, height = 480, units = "px")
dev.off() 

		#resetting of system to its initial state (french for me)
Sys.setlocale("LC_TIME", zone)