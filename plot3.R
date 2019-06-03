data <- read.table("household_power_consumption.txt",header=TRUE, sep=";",dec=".", stringsAsFactors=FALSE)


data <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

png("plot2.png", width=480, height=480)
with(data, {  plot(Global_active_power~Datetime, type="l",ylab="Global Active Power (kilowatts)", xlab="")})
dev.off()