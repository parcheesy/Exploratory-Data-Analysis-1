## Exploratory Data Analysis Course Project 1

### Description

Ths respository contains materials for submission of the first course project in the Coursera Exploratory Data Analysis course.

The goal is to examine how household energy usage varies over a 2-day period in February, 2007 by constructing four plots.

### Raw Data

The data used in this project is the "individual household electric power consumption Data Set" from the UC Irvine Machine Learning Repository. The data set can be downloaded from:  https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

The raw data contains measurements of electric power consumption in one household with a one-minute sampling rate over a period of 4 years.

The following are descriptions of the 9 variables in the data set:

1. Date: Date in format dd/mm/yyyy
2. Time: time in format hh:mm:ss
3. Global_active_power: household global minute-averaged active power (in kilowatt)
4. Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
5. Voltage: minute-averaged voltage (in volt)
6. Global_intensity: household global minute-averaged current intensity (in ampere)
7. Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
8. Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
9. Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.

### Contents of Repository

This respository contains the following:

+plot1.R : script that exports a histogram of global active power
+plot1.png : histogram of global active power
+plot2.R : script that exports a line plot of time versus global active power
+plot2.png : line plot of time versus global active power
+plot3.R : script that exports a line plot of time versus energy sub metering
+plot3.png : line plot of time versus energy sub metering
+plot4.R : script that exports four line plots displaying various variable changes over time
+plot4.png : four line plots displaying various variable changes over time

## Important Notes About Script
Each script contains code that exports specific data over the 2-day period between 2/1/2007 and 2/2/2007 from the larger data set in order to preserve memory. This takes a minute and is the cause of delays when running each script.

In order for each script to properly access the raw data it should share a directory with the raw data file "household_power_consumption.txt". Otherwise the scripts may be altered to set the working directory to the location of "household_power_consumption.txt".

## Description of Scripts
Each script performs the following two steps:

1. Imports the household electric power consumption data between 2/1/2007 and 2/2/2007.

2. Exports a plot or plots to the PNG file corresponding to the script name.
