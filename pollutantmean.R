#data
https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspecdata.zip
The zip file contains 332 comma-separated-value (CSV) files containing pollution monitoring data for fine particulate matter (PM) air pollution at 332 locations in the United States. Each file contains data from a single monitor and the ID number for each monitor is contained in the file name. For example, data for monitor 200 is contained in the file "200.csv". Each file contains three variables:
  
  Date: the date of the observation in YYYY-MM-DD format (year-month-day)
sulfate: the level of sulfate PM in the air on that date (measured in micrograms per cubic meter)
nitrate: the level of nitrate PM in the air on that date (measured in micrograms per cubic meter)
For this programming assignment you will need to unzip this file and create the directory 'specdata'. Once you have unzipped the zip file, do not make any modifications to the files in the 'specdata' directory. In each file you'll notice that there are many days where either sulfate or nitrate (or both) are missing (coded as NA). This is common with air pollution monitoring data in the United States.

Part 1
Write a function named 'pollutantmean' that calculates the mean of a pollutant (sulfate or nitrate) across a specified list of monitors. The function 'pollutantmean' takes three arguments: 'directory', 'pollutant', and 'id'. Given a vector monitor ID numbers, 'pollutantmean' reads that monitors' particulate matter data from the directory specified in the 'directory' argument and returns the mean of the pollutant across all of the monitors, ignoring any missing values coded as NA.

You can see some example output from this function below. The function that you write should be able to match this output. Please save your code to a file named pollutantmean.R.

"R version 3.4.0 (2017-04-21)"
source("pollutantmean.R")
pollutantmean("specdata", "sulfate", 1:10)

##Version
R version 4.0.4 (2021-02-15)


#create a function named 'pollutantmean'
#The function 'pollutantmean' takes three arguments: 'directory', 'pollutant', and 'id'. Given a vector monitor ID numbers, 'pollutantmean' reads that monitors' particulate matter data from the directory specified in the 'directory' argument and returns the mean of the pollutant across all of the monitors.

pollutantmean <- function(directory, pollutant, id= 1:332){
  datafiles <- list.files("D:\\R-files\\Programming Assignment\\specdata", pattern = "*.csv", full.names = T)
  #create an empty vector
  nobs <- numeric() 
  for (i in id) {
    readfiles <- read.csv(datafiles[i])
    #save files in empty vector
    nobs <- c(nobs, readfiles[[pollutant]])
  }
  mean(nobs, na.rm= T)
}

pollutantmean("specdata", "sulfate", 1:10)


pollutantmean("specdata", "nitrate", 70:72)

pollutantmean("specdata", "nitrate", 23)
