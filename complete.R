complete <- function(directory, id = 1:332) {
  # How many in the file?
  countComplete<-function(file) {
    sum(complete.cases(read.csv(paste0(directory,"/",sprintf("%0003d",file),".csv"))))
  }

  nobs=sapply(id, countComplete)
  data.frame(id,nobs)
  

  
}