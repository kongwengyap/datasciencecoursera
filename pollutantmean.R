#library(dplyr)

pollutantmean <- function(directory, pollutant, id = 1:332) {
  

  #obtain list of sensor files  
  list.filenames <- list.files(path = directory,pattern=".csv$")
  
  path <- "."
  finalPath <- paste(path,directory,sep="/")

  
  #create an empty data frame to collect all of the sensor files to be read
  collectorDfr <- data.frame()
  
  
  #subset the list of sensor files
  #newFilenames <- list.filenames[id]
  newFilenames <- paste(finalPath,list.filenames,sep="/")
  
  #list.data <- list()
  #loop to read in the file into dataframe
  for( i in id){
    #list.data[[i]] <- read.csv(newFilenames[i])
    tempDfr <- read.csv(newFilenames[i])
    collectorDfr <- rbind (collectorDfr, tempDfr)
  }
  

  #calculate mean
  mean(collectorDfr[[pollutant]], na.rm = TRUE)
  
  
  
 
}