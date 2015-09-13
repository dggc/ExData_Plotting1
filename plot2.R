png('plot2.png')
dat = read.table('household_power_consumption.txt', sep=';', 
                 header=TRUE, na.strings='?', 
                 colClasses=c('character', 
                              'character', 'numeric', 
                              'numeric', 'numeric', 
                              'numeric', 'numeric',
                              'numeric', 'numeric'))
dat_subset = subset(dat, Date=='1/2/2007' | Date=='2/2/2007')
dat_subset$DateTime = strptime(paste(dat_subset$Date, dat_subset$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
plot(dat_subset$DateTime, dat_subset$Global_active_power,
     ylab = 'Global Active Power (kilowatts)',
     xlab = '',
     type = 'l')
dev.off()