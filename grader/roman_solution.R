e1 <- rlang::env('I'= 1,'V'= 5,'X'= 10,'L'= 50,'C'= 100,'D'= 500,'M'= 1000)
roman_trans <- function(x) {
	return(as.numeric(e1[[x]]))
}

roman_trans <- Vectorize(roman_trans)

roman_trans_input_lt <- list(rep("M", 1e4),
	 sample(c("I", "V", "X", "L", "C", "D", "M"), 1e4, replace=TRUE),
	 sample(c("I", "V", "X", "L", "C", "D", "M"), 1e2, replace=TRUE) )


