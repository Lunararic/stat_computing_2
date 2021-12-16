author="student5@uth.tmc.edu"

roman_trans =function(x){
	ifelse(x=="I", 1,
		ifelse(x=="V", 5,
			ifelse(x=="X", 10,
				ifelse(x=="L", 50,
					ifelse(x=="C", 100,
						ifelse(x=="D", 500,
							ifelse(x=="M", 1000, NA)))))))
}

roman_trans <- Vectorize(roman_trans)