author="student2@uth.tmc.edu"

roman_trans <-function(x) {
	dic1=c("I","V","X","L","C","D","M")
	dic2 =c(1,5,10,50,100,500,1000)
	idx =match(x, dic1)
	out =dic2[idx]
	out
}

roman_trans <- Vectorize(roman_trans)
