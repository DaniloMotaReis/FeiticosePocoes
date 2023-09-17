function approach(val1,val2,amout){
	if (val1 < val2){
		
		val1 += amout;
		if ( val1 > val2)
			 return val2;
	} else {
		
		val1 -= amout;
		if (val1 < val2)
			return val2;
	}
	return val1;
}