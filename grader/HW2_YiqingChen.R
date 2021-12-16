author <- "yiqing.chen@uth.tmc.edu"

# 1. Recursion
num_step_ways <- function(n){
  if (n == 2 || n == 1 || n == 0){
    return(1)
  }else if (n == 3){
    return(2)
  }
  else{
    return(num_step_ways(n-3)+num_step_ways(n-1))
  }
}
  
# 2. Function and Environment
grader <- function(){
  rm(list = ls(all.names = TRUE))
  options(warn=-1)
  # List all R files under the path of my script location
  if (!require("rstudioapi")) install.packages("rstudioapi")
  library("rstudioapi") 
  dirname <- dirname(getSourceEditorContext()$path)
  R_files <- list.files(path = as.character(dirname), 
                           pattern = "\\.R$")
  setwd(dirname)
  
  source("roman_solution.R")
  solution <- list()
  for (i in 1:length(roman_trans_input_lt)) {
    solution[[i]] <- roman_trans(roman_trans_input_lt[[i]])
  }
  
  hw_check <- function(file){  # Check if this is a student HW: check if they defined "author" variable.
    source(file,local = TRUE)
    if(author!="yiqing.chen@uth.tmc.edu"){return(TRUE)}
    else{return(FALSE)}
  }
  grading <- function(file){
    source(file,local = TRUE)
    st_func <- ls.str(pos = -1,pattern="roma")

    start <- Sys.time()
    student <- list()
    for (i in 1:length(roman_trans_input_lt)) {
      student[[i]] <- roman_trans(roman_trans_input_lt[[i]])
    }
    end <- Sys.time()
    # ratio
      correct <- 0
    for (i in 1:length(roman_trans_input_lt)){
      if(identical(student[[i]], solution[[i]])) {
        correct <- correct + 1
      }
    }
    ratio <- correct/length(roman_trans_input_lt)
    
    # time 
    time <- signif(end-start,digits = 3)
    return(list(email=author, func_name=as.character(st_func), ratio=ratio,time=as.numeric(time)))
  }
  
  
  grade_book <- list()
  for (i in 1:length(R_files)){
    if(hw_check(R_files[i])){
      grade_book <- rbind(grade_book,grading(R_files[i]))
    }
  }
  write.csv(grade_book, file='grade_book.csv')
}

#Testing:
# grader()
