# Write a function named 'pollutantmean' that calculates the mean of a pollutant 
# (sulfate or nitrate) across a specified list of monitors. 
# The function 'pollutantmean' takes three arguments: 'directory', 'pollutant', and 'id'. 
# Given a vector monitor ID numbers, 'pollutantmean' reads that monitors' particulate 
# matter data from the directory specified in the 'directory' argument and returns the mean 
# of the pollutant across all of the monitors, ignoring any missing values coded as NA

pollutantmean <- function(directory, pollutant, id = 1:332) {
  # Should really put in validation that directory exists, and that files exist
  # However, wil only test the positive path for now....
  
  # Should also check for value of pollutant being one of the two expected....
  
  #Could do this as a single line, but for maintainability and reusability 
  # have split is out a little
  
  # Generate the file list
  filelist <- paste0(directory,"/",sprintf("%0003d",id),".csv")
  
  #Read in all the files in the list, then RBIND them into a dataframe
  df <- do.call("rbind", lapply(filelist, read.csv, header = TRUE))
  
  #Now find the mean of the column named for the passed in polutant, and round to three decimals to get the same result as the examples
  round(mean(df[[pollutant]],na.rm=TRUE),digits=3)

  
}