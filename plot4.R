plot4 <-function(fileName){
     
     #load data from file, with date and time as characters and all other values as numeric, replacing ? marks with NA
     epc = read.table(fileName,header=TRUE,sep=";",colClasses=c(rep("character",2),rep("numeric",7)),na.strings="?")
     
     #convert date to R Date format in order to subset data to the 2 days of interest according to instructions
     epc$Date<-strptime(paste(epc$Date,epc$Time),"%d/%m/%Y %H:%M:%S")
     
     #subset data according to this line in instructions
     #"We will only be using data from the dates 2007-02-01 and 2007-02-02. "
     epc <-subset(epc, Date >="2007-02-01" & Date <"2007-02-03 ")
     
          
     #setup device for the 480x480 pixels required in instructons based on a standard screen rs. of 96 pix/inch (5x96=480)
     dev.new(width=5,height=5, res=96)
    
     #name the file we are going to save
    png("plot4.png")
   
    #set up a 2x2 graph grid that will place images begining in top left
    par(mfrow=c(2,2))
    
    #place image from plot2
    plot(epc$Date,epc$Global_active_power,type="n",ylab="Global Active Power (kilowatts)",xlab="")
    lines(epc$Date,epc$Global_active_power,type="l")
    
    #create voltage graph
    plot(epc$Date,epc$Voltage,type="n",ylab="Voltage",xlab="datetime")
    lines(epc$Date,epc$Voltage,type="l")
    
    #place image from plot3
   plot(epc$Date,epc$Sub_metering_1,type="n",ylab="Energy submetering",xlab="")
   lines(epc$Date,epc$Sub_metering_1,type="l")
   lines(epc$Date,epc$Sub_metering_2,type="l",col="red")
   lines(epc$Date,epc$Sub_metering_3,type="l", col="blue")
   legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1),bty="n")
   
   #create reactive power graph
   plot(epc$Date,epc$Global_reactive_power,type="n",ylab="Global_reactive_power",xlab="datetime")
   lines(epc$Date,epc$Global_reactive_power,type="l")
   
   
   #close the drawing device
     dev.off()
   
     #return the data.frame
     epc
}
