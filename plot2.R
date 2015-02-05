plot2 <-function(fileName){
     
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
     png("plot2.png")
   
   #plot line
   #type="n" to not plot points
   plot(epc$Date,epc$Global_active_power,type="n",ylab="Global Active Power (kilowatts)",xlab="")
   
   #now that the plot has been "setup" draw the line
   lines(epc$Date,epc$Global_active_power,type="l")
   
   #close the drawing device
     dev.off()
   
     #return the data.frame
     epc
}
