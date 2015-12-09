#!/bin/bash
#Program:
#  This program create E1 Add/Fallback for Mip
#Format:
#MSC	MGW	Existing SNT	EXTP	CIC	Devices	Route
#IBMSS02	IBMGW05	408	2-2-115312	353	6528	ADO1BTO&ADO1BTI
#IBMSS02	IBMGW05	409	2-2-115313	385	6560	ADO1BTO&ADO1BTI
#IBMSS02	IBMGW05	410	2-2-115314	417	6592	ADO1BTO&ADO1BTI
#IBMSS02	IBMGW05	411	2-2-115315	449	6624	ADO1BTO&ADO1BTI
#IBMSS02	IBMGW05	412	2-2-115316	481	6656	ADO1BTO&ADO1BTI
#IBMSS02	IBMGW05	413	2-2-115317	513	6688	ADO1BTO&ADO1BTI
#MSC	MGW	Existing SNT	EXTP	CIC	Devices	Route
#IBMSS03	IBMGW05	379	2-2-115318	545	7648	ADO1BTO&ADO1BTI
#IBMSS03	IBMGW05	380	2-2-115319	577	7680	ADO1BTO&ADO1BTI
#IBMSS03	IBMGW05	381	2-2-115320	609	7712	ADO1BTO&ADO1BTI
#IBMSS03	IBMGW05	382	2-2-115321	641	7744	ADO1BTO&ADO1BTI
#IBMSS03	IBMGW05	383	2-2-115322	673	7776	ADO1BTO&ADO1BTI
#IBMSS03	IBMGW05	384	2-2-115323	705	7808	ADO1BTO&ADO1BTI
#MSC	MGW	Existing SNT	EXTP	CIC	Devices	Route
#IBMSS04	IBMGW05	170	2-2-115324	737	19456	ADO1BTO&ADO1BTI
#IBMSS04	IBMGW05	171	2-2-115325	769	19488	ADO1BTO&ADO1BTI
#IBMSS04	IBMGW05	172	2-2-115326	801	19520	ADO1BTO&ADO1BTI
#IBMSS04	IBMGW05	173	2-2-115327	833	19552	ADO1BTO&ADO1BTI
#IBMSS04	IBMGW05	174	2-2-115328	865	19584	ADO1BTO&ADO1BTI
#IBMSS04	IBMGW05	175	2-2-115329	897	19616	ADO1BTO&ADO1BTI
#
#Notice:
#1. There is only first number is needed for CIC and Devices. And SNT alse only needs the number.
#2. The type of SNT is RTDMA, and the type of Device is MRALT.
#3. The header 'MSC	MGW	Existing SNT	EXTP	CIC	Devices	Route'is not needed, but if there is a header, please make the first column name is "MSC".
#4. Please make the date as order'MSC,MGW,Existing SNT,EXTP,CIC,Devices,Route'. 
#5. The division between date is space or tab.
#
#
while (($#>0))
do
	input=$1
awk -f Part1.awk -v Fname="${input%.*}" $1
awk -f Part2.awk -v Fname="${input%.*}" $1
awk -f Part3.awk -v Fname="${input%.*}" $1
awk -f Part4.awk -v Fname="${input%.*}" $1
shift 
done