($1 != "MSC"){
	Result = "E1Migration_"Fname"_"$1"_ADD_E1s.txt"
	Fallback="FallB_E1Migration_"Fname"_"$1"_ADD_E1s.txt"
	Sync0 = "cat >>E1Migration_"Fname"_"$1"_ADD_E1s.txt" 
	Sync1 = "cat >>FallB_E1Migration_"Fname"_"$1"_ADD_E1s.txt"
	print "EXDAI:DEV=MRALT-" $6+1 "&&-" $6+31 ";" >>Result
	print "BLODE:DEV=MRALT-" $6 "&&-" $6+31 ";"|Sync0
	print "EXDUE:DEV=MRALT-" $6 "&&-" $6+31 ";" >>Fallback
	print "NTCOE:SNT=RTDMA-" $3 ";" |Sync1
}

END{		
	close(Result)  
	close(Fallback)
	close(Sync0)    
	close(Sync5)
}

