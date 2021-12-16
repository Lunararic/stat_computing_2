author="student4@uth.tmc.edu"

roman_trans <-function(x) {
	roman_num <- data.frame(symbol = c("I", "V", "X", "L", "C", "D", "M"),value = c(1,5,10,50,100,500,1000))
	return( roman_num[roman_num$symbol == x, 2] )
}


roman_trans <- Vectorize(roman_trans)