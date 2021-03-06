# Reading CSV and Subsetting
power_cons <- read.csv("household_power_consumption.txt",sep= ";",na.strings = "?")
power_cons$Date <- as.Date(power_cons$Date, format = "%d/%m/%Y")
power_cons$Time <- strptime(paste(power_cons$Date, power_cons$Time), "%Y-%m-%d %H:%M:%S") 
subset.power <- power_cons[power_cons$Date >= "2007-02-01" & power_cons$Date <= "2007-02-02",]
subset.power[,3:9] <- sapply(subset.power[,3:9], FUN = function(x) as.numeric(x))


# Creating Plot4

png(file= "./plot4.png")
par(mfrow = c(2,2))
## Subplot Global Active Power
with(subset.power, plot(Time, Global_active_power,type = "l",xlab = "",
                        ylab = "Global Active Power"))

## Subplot Voltage
with(subset.power, plot(Time, Voltage,type = "l",xlab = "datetime",
                        ylab = "Voltage"))

## Subplot Enerrgy Sub metering
with(subset.power, plot(Time, Sub_metering_1,type = "l",xlab = "",
                        ylab = "Energy Sub metering"))
with(subset.power, lines(Time, Sub_metering_2,type = "l",col="red"))
with(subset.power, lines(Time, Sub_metering_3,type = "l",col="blue"))    
legend("topright", colnames(subset.power)[7:9], col=c("black","red","blue"),
       lty =1,bty="n",cex=0.75)

## Subplot Global ReActive Power
with(subset.power, plot(Time, Global_reactive_power,type = "l",xlab = "datetime",
                        ylab = "Global reactive Power"))

dev.off()
