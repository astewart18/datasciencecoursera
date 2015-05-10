corr <- function(directory, threshold = 0) {
  # Returns a vector
  # How many complete in the file?
  countComplete<-function(file) {
    sum(complete.cases(read.csv(paste0(directory,"/",sprintf("%0003d",file),".csv"))))
  }
  correlation<-vector("numeric")
  for(id in 1:332) {
    if(countComplete(id)>=threshold) {
      mon<-read.csv(paste0(directory,"/",sprintf("%0003d",id),".csv"))
      correlation=c(correlation,cor(mon[,2],mon[,3],use="pairwise.complete.obs"))
    }
  }
  correlation
}