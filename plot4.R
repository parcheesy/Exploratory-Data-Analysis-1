############################################################

##FILE: "plot4.R"
##TITLE: "Coursera Exploratory Data Analysis Course Project 1"

##DESCRIPTION:
## 1. Imports household electric power consumption data between 2/1/2007 and 2/2/2007
## 2. Exports four line plots displaying various variable changes over time to file "plot4.png"

############################################################
# Import dplyr package for subsetting and working with data
library(dplyr)

###### 1. Import household electric power consumption data between 2/1/2007 and 2/2/2007

# Helper functions to aid in extracting only observations between 2/1/2007 and 2/2/2007

extract_between_dates_helper <- function(filename, d1, d2) {
        d1 <- as.Date(d1)
        d2 <- as.Date(d2)
        con <- file(filename, open="r")
        readLines(con, 1)
        s <- 1
        b <- FALSE
        while( (d <- as.Date(read.table(con, nrow=1, sep=";")[1,1], format="%d/%m/%Y")) <= d2) {
                if(d==d1 && !b) {
                        b <- TRUE
                        beg <- s
                }
                s <- s + 1
        }
        end <- s 
        close(con)
        c(beg, end)
}

extract_between_dates <- function(filename, d1, d2) {
        indexes <- extract_between_dates_helper(filename, d1, d2)
        header <- as.matrix(read.table(filename, nrow=1, sep=";"))[1,]
        tbl <- read.table(filename, skip=indexes[1], nrow=(indexes[2]-indexes[1]), sep=";", col.names=header, na.strings=c("NA", "?"))
        attr(tbl, "indexes") <- indexes
        tbl
}

# Extract observations from household power data between 2/1/2007 and 2/2/2007 
tbl <- extract_between_dates("household_power_consumption.txt", "2007-02-01", "2007-02-02")

###### 2. Export four line plots to file "plot4.png"

# Add column of dates and times in POSIXct format
tbl <- mutate(tbl, datetime = as.POSIXct(paste(Date,Time), format="%d/%m/%Y %H:%M:%S"))

# Set parameters to allow for four plots and open PNG graphic device in "plot4.png" 
png("plot4.png")
par(mfrow=c(2,2))

# Add first plot of time versus global active power
with(tbl, plot(datetime, Global_active_power, type="n", xlab="", ylab="Global Active Power"))
with(tbl, lines(datetime, Global_active_power))

# Add second plot of time versus voltage
with(tbl, plot(datetime, Voltage, type="n"))
with(tbl, lines(datetime, Voltage))

# Add third plot of time versus energy sub metering
with(tbl, plot(datetime, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering"))
with(tbl, lines(datetime, Sub_metering_1, col="black"))
with(tbl, lines(datetime, Sub_metering_2, col="red"))
with(tbl, lines(datetime, Sub_metering_3, col="blue"))
legend("topright", lty=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), bty="n")

# Add fourth plot of time versus global reactive power
with(tbl, plot(datetime, Global_reactive_power, type="n"))
with(tbl, lines(datetime, Global_reactive_power))
dev.off()

