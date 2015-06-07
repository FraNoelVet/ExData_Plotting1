DB<-read.table("household_power_consumption.txt",header=T,sep=";")
db<-DB[DB$Date=="1/2/2007" | DB$Date=="2/2/2007",]

		#reformating of the column of interstall columns
db$Global_active_power<-as.numeric(as.character(db$Global_active_power))
		

		#drawing the histo
with(db,hist(Global_active_power,main ="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red"))

		#create the png file
dev.copy(png, file =("plot1.png"),width = 480, height = 480, units = "px")
dev.off() 
		