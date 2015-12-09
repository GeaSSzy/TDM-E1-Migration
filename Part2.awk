($1 != "MSC"){
	Result = "E1Migration_"Fname"_"$1"_ADD_E1s.txt"
	Fallback="FallB_E1Migration_"Fname"_"$1"_ADD_E1s.txt"
	Sync0 = "cat >>E1Migration_"Fname"_"$1"_ADD_E1s.txt" 
	Sync1 = "cat >>FallB_E1Migration_"Fname"_"$1"_ADD_E1s.txt"
	print "NTBLE:SNT=RTDMA-" $3";" >>Result
	print "EXDRI:R=" $7 ",DEV=MRALT-" $6+1 "&&-" $6+31 ",MISC1=" $5 ";" |Sync0
	print "EXDRE:DEV=MRALT-" $6+1 "&&-" $6+31 ";" >>Fallback
	print "NTBLI:SNT=RTDMA-" $3 ";" |Sync1
}

END{		
	close(Result)
	close(Fallback) 
	close(Sync0)
	close(Sync1)	

}

