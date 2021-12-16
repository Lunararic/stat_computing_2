author="student3@uth.tmc.edu"

roman_trans <-function(x) {# create dictionary for translate roman numeral 
	dict <-list('I'= 1,'V'= 5,'X'= 10,'L'= 50,'C'= 100,'D'= 500,'M'= 1000)
    return(dict[[x]])
}

roman_trans <- Vectorize(roman_trans)