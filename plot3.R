# Reading the data
dat = read.table('household_power_consumption.txt', sep=';', 
                 header=TRUE, na.strings='?', 
                 colClasses=c('character', 
                              'character', 'numeric', 
                              'numeric', 'numeric', 
                              'numeric', 'numeric',
                              'numeric', 'numeric'))
dat_subset = subset(dat, Date=='1/2/2007' | Date=='2/2/2007')
dat_subset$DateTime = strptime(paste(dat_subset$Date, dat_subset$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

# Ploting the image
png('plot3.png', width=504, height=504)
old.par <- par(bg=NA)
par(mfrow=c(1, 1))
plot(dat_subset$DateTime, dat_subset$Sub_metering_1,
     ylab = 'Energy sub metering',
     xlab = '',
     type = 'n')
lines(dat_subset$DateTime, dat_subset$Sub_metering_1, col='black')
lines(dat_subset$DateTime, dat_subset$Sub_metering_2, col='red')
lines(dat_subset$DateTime, dat_subset$Sub_metering_3, col='blue')
legend("topright", c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), 
       col=c('black', 'red', 'blue'), lty=1)
dev.off()
par(old.par)