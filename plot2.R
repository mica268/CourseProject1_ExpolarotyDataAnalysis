#### PLOT 2 ####

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

# Create plot
plot(df$datetime,df$Global_active_power, type="l",
     ylab= "Global Active Power (kilowatts)",
     xlab= "")

# Save plot as png
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()




