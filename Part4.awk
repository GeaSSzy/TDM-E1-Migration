($1 != "MSC"){
	Result = "E1Migration_"Fname"_"$1"_ADD_E1s.txt"
	Fallback="FallB_E1Migration_"Fname"_"$1"_ADD_E1s.txt"
	Row[$1]++ 
	for( nodename in Row)
	if(Row[nodename] == 1){
	printf("\n\n\n") >>Result
	print"	    !***** END OF FILE *****!" >>Result
	printf("\n\n\n") >>Result
	print"!end of file;">>Result
	print"@C" >>Result

	printf("\n\n\n") >>Fallback
	print"	    !***** END OF FILE *****!" >>Fallback
	printf("\n\n\n") >>Fallback
	print"!end of file;">>Fallback
	print"@C" >>Fallback
	}
}