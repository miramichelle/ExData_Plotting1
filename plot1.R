plot1 <-function(fileName){
     
     #load data from file, with date and time as characters and all other values as numeric, replacing ? marks with NA
     epc = read.table(fileName,header=TRUE,sep=";",colClasses=c(rep("character",2),rep("numeric",7)),na.strings="?")
     
     #convert date to R Date format in order to subset data to the 2 days of interest according to instructions
     epc$Date<-strptime(epc$Date,"%d/%m/%Y")
     
     #subset data according to this line in instructions
     #"We will only be using data from the dates 2007-02-01 and 2007-02-02. "
     epc <-subset(epc, Date >="2007-02-01" & Date <="2007-02-02")
     
     #setup device for the 480x480 pixels required in instructons based on a standard screen rs. of 96 pix/inch (5x96=480)
     dev.new(width=5,height=5, res=96)
     #name the file we are going to save
     png("plot1.png")
     
     #draw the histogram with features matching the instructions
     hist(epc$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
     
     #close the drawing device
     dev.off()
     
}
