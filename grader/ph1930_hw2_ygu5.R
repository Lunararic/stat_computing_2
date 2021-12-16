author="yue.gu@uth.tmc.edu"

# 1 Recursion
num_step_ways = function(n){
  if (n == 0 | n == 1 | n == 2)
    return(1)
  else if (n == 3)
    return(2)
  else 
    return(num_step_ways(n-3) + num_step_ways(n-1))
}
# test
# num_step_ways(1)
# num_step_ways(2)
# num_step_ways(3)
# num_step_ways(4) # 3 ways: 1+1+1+1, 1+3, 3+1
# num_step_ways(7) # 9 ways: 1+1+1+1+1+1+1, 1+3+1+1+1, 1+3+3, 3+1+1+1, 1+1+3+1+1, 1+1+1+3+1, 1+1+1+1+3, 3+1+3, 3+3+1

# 2 Function and Environment
grader = function(){
  
  if (!require("rstudioapi")) install.packages("rstudioapi")
  library("rstudioapi") 
  author = ""

  # set to current Rscript directory
  setwd(dirname(getSourceEditorContext()$path))
  # list out all Rscript
  R_scripts = list.files(dirname(getSourceEditorContext()$path), 
                         pattern="\\.R")
  

  # load solution
  source("roman_solution.R")
  sol = NULL
  for (i in 1:3){
    sol[[i]]=roman_trans(roman_trans_input_lt[[i]])
  }
  
  
  # check students' submission
  check = function(x){
    source(x, local = T)
    student = NULL
    start_time = Sys.time()
    for (i in 1:3){
      student[[i]] = roman_trans(roman_trans_input_lt[[i]])
    }
    end_time = Sys.time()

    # ratio
    match = 0
    for (i in 1:3){
      if (identical(student[[i]], sol[[i]])){
        match = match + 1
      }
    }
    ratio = match/3
    
    # time
    run_time = round(end_time - start_time, digits = 3)
    
    # return list for one student
    return(list(email=author, func_name="roman_trans", ratio=ratio, time=run_time))
  }
  
  # check if the Rscript contain author info
  author_check <- function(x){
    source(x, local = TRUE)
    if(author!="1234")
      return(TRUE)
    else
      return(FALSE)
  }
  
  # return list for all student
  results = NULL
  for (i in 1:length(R_scripts)){
    if(author_check(R_scripts[i])){
      results = rbind(results, check(R_scripts[i]))
    }
  }
  
  write.csv(results, "./results.csv", row.names = F)
  }