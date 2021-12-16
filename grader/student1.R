author="student1@uth.tmc.edu"

roman_trans <- function(t) {
	symbol <- c("I","V","X","L","C","D","M")    
	value <- c(1,5,10,50,100,500,1000)    
	ind <- which(symbol==t)    
	return(value[ind])
}

