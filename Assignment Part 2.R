Write a function that reads a directory full of files and reports the number of completely observed cases in each data file.

The function should return a data frame where the first column is the name of the file and the second column is the number of complete cases. 

You can see some example output from this function below. 
The function that you write should be able to match this output. Please save your code to a file named complete.R.
To run the submit script for this part, make sure your working directory has the file complete.R in it.

source("complete.R")
complete("specdata", 1)



complete <- function(directory, id=1:332){
  datafiles <- list.files('C:\\Users\\gulmu\\specdata', pattern = "*.csv", full.names = T)
  nobs <- numeric()
  for (i in id) {
    readsfile <-sum(complete.cases(read.csv(datafiles[i])))
    nobs <- c(nobs, readsfile)
  }
  #we used here data.frame function, which was used just to return output in data.frame. 
  return(data.frame(id, nobs))
}

complete("specdata",1:332)


cc <- complete("specdata", c(6, 10, 20, 34, 100, 200, 310))
print(cc$nobs) 
cc <- complete("specdata", 54)
print(cc$nobs)


cc <- complete("specdata", 332:1)
use <- sample(332, 10)
print(cc[use, "nobs"])
set.seed(42)
cc <- complete("specdata", 332:1)
use <- sample(332, 10)
print(cc[use, "nobs"])
