#### PLOT 4 ####

# Download data
url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
f = file.path(getwd(), "electricpowercons.zip")
download.file(url,f)
unzip(f)

# Read data
data = read.table("household_power_consumption.txt", sep=";", 
                  header = TRUE,dec = ".", stringsAsFactors=FALSE)

# Subset data from 01/02/2007 to 02/02/2007
df = data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Create datetime and convert to date variable
df$datetime = paste(df$Date,df$Time,sep=" ")
df$datetime = strptime( df$datetime,"%d/%m/%Y %H:%M:%S")

# Transform Global active power to numeric
df$Global_active_power=as.numeric(df$Global_active_power)

# Change layout
par(mfrow=c(2,2),mar=c(4,4,2,2))

# Create plot 1
plot(df$datetime,df$Global_active_power, type="l",
     ylab= "Global Active Power (kilowatts)",
     xlab= "")


# Create plot  2
plot(df$datetime,df$Voltage, type="l",
     ylab= "Voltage",
     xlab= "datetime")


# Create plot 3
plot(df$datetime,df$Sub_metering_1,type="n",ylab= "Energy sub metering", xlab = "")
lines(df$datetime,df$Sub_metering_1)
lines(df$datetime,df$Sub_metering_2, col = "red")
lines(df$datetime,df$Sub_metering_3, col ="blue")
legend("topright", lty=1,legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"), cex = 0.6)


# Create plot 4
plot(df$datetime,df$Global_reactive_power, type="l",
     ylab= "Global_reactive_power",
     xlab= "datetime")


# Save as png
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()






