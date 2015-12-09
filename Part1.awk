BEGIN{
	"date '+%y %m %d'" | getline
	Year = $1
	Month = $2
	Day = $3
}
($1 != "MSC"){
	Result = "E1Migration_"Fname"_"$1"_ADD_E1s.txt"
	Fallback="FallB_E1Migration_"Fname"_"$1"_ADD_E1s.txt"
	Sync0 = "cat >>E1Migration_"Fname"_"$1"_ADD_E1s.txt" 
	Sync1 = "cat >>FallB_E1Migration_"Fname"_"$1"_ADD_E1s.txt"
	Row[$1]++ 
	for( nodename in Row)
	if(Row[nodename] == 1){
	print "!************************************!" >Result
    print "!* AIRTELNG                         *!" >Result
    print "!* MIP IMPLEMENTATION               *!" >Result
    print "!* NODE-SPECIFIC FILE               *!" >Result
    print "!* Network Preparation              *!" >Result
    printf("!* E1Migration_%s_ADD_E1s      *!\n", nodename) >Result
    print "!* Prepared by ELPPQTV              *!" >Result
    printf("!* Completed on 20%s-%s-%s          *! \n", Year,Month,Day) >Result
    print "!************************************!" >Result
    printf("\n\n\n") >Result
    printf("@L+ C:\\AIRTELNG\\%s\\1_Network_Preparation\\MSC\\LOG\\E1migration_%s_ADD_E1s.log\n",Fname,nodename) >Result

    printf("\n\n\n") >Result

    print"IOEXP;! Exchange Identity !">Result
    print"CACLP; ! Date and Time ! ">Result
    printf("\n") >Result
    print"!****************************************!">Result
    printf("!************* Add to %s ***********!\n",nodename)>Result
    print"!****************************************!">Result
    printf("\n\n\n") >Result	

	print"!************************************!">Fallback
	print"!* AIRTELNG                         *!">Fallback
	print"!* MIP IMPLEMENTATION               *!">Fallback
	print"!* NODE-SPECIFIC FILE               *!">Fallback 
	print"!* Network Preparation              *!">Fallback
    printf("!* E1Migration_%s_ADD_E1s      *!\n", nodename) >Fallback
	print"!* Prepared by ELPPQTV              *!">Fallback
    printf("!* Completed on 20%s-%s-%s          *! \n", Year,Month,Day) >Fallback
	print"!************************************!">Fallback
    printf("\n\n\n") >Fallback 
	printf("  @L+ C:\\AIRTELNG\\3_FallBack\\%s\\MSC\\LOG\\FallB_E1Migration_%s_ADD_E1s.log\n",Fname,nodename)>Fallback  

    printf("\n\n\n") >Fallback
	
	print"  IOEXP;	! Exchange Identity !">Fallback
	print"  CACLP; 	! Date and Time ! ">Fallback

    printf("\n") >Fallback
	
	print"!***************************************************************!">Fallback  
	printf("! DELETE MRALT DEVICES CREATED IN THE TARGET MSC (%s)      !\n",nodename)>Fallback
	print"!***************************************************************!">Fallback
    printf("\n\n\n") >Fallback



	}
}
($1 != "MSC"){
	print "NTCOI:SNT=RTDMA-" $3",EXTP=" $4 ",SNTV=0,MG=" $2 ";" >Result	
	print "EXDUI:SNT=RTDMA-" $3",DEV=MRALT-" $6 "&&-" $6+31 ";"|Sync0
	print "BLODI:DEV=MRALT-" $6"&&-" $6+31";" >Fallback
	print "EXDAE:DEV=MRALT-" $6+1"&&-" $6+31 ";" |Sync1
#	print "NTBLE:SNT=RTDMA-" $3";"|Sync1
#	print "EXDRI:R=" $7 ",DEV=MRALT-" $6+1 "&&-" $6+31 ",MISC1=" $5 ";" |Sync2
#	print "EXDAI:DEV=MRALT-" $6+1 "&&-" $6+31 ";" |Sync3
#	print "BLODE:DEV=MRALT-" $6 "&&-" $6+31 ";"|Sync4
}

END{		
	close(Result) 
	close(Fallback)
	close(Sync0)  
	close(Sync1)    
}

