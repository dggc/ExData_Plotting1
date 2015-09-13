png('plot1.png')
setClass("dateCol")
setClass("timeCol")
setAs("character","dateCol", function(from) as.Date(from, format="%d/%m/%Y") )
setAs("character","timeCol", function(from) as.Date(from, format="%d/%m/%Y") )
dat = read.table('household_power_consumption.txt', sep=';', 
                 header=TRUE, na.strings='?', 
                 colClasses=c('character', 
                              'character', 'numeric', 
                              'numeric', 'numeric', 
                              'numeric', 'numeric',
                              'numeric', 'numeric'))
dat_subset = subset(dat, Date=='1/2/2007' | Date=='2/2/2007')
hist(dat_subset$Global_active_power, 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)",
     col = "red")
dev.off()