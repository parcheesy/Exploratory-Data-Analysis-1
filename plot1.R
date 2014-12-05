############################################################

##FILE: "plot1.R"
##TITLE: "Coursera Exploratory Data Analysis Course Project 1"

##DESCRIPTION:
## 1. Imports household electric power consumption data between 2/1/2007 and 2/2/2007
## 2. Exports a histogram of global active power to file "plot1.png"

############################################################
# Import dplyr package for subsetting and working with data
library(dplyr)

###### 1. Import household electric power consumption data between 2/1/2007 and 2/2/2007

# Helper functions to aid in extracting only select observations 

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

# Add column of dates and times in POSIXct format
tbl <- mutate(tbl, datetime = as.POSIXct(paste(Date,Time), format="%d/%m/%Y %H:%M:%S"))

###### 2. Export histogram of global active power to file "plot1.png"

png("plot1.png")
with(tbl, hist(Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red"))
dev.off()

