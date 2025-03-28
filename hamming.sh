#!/usr/bin/env bash

#VARS
str1="$1" #1ST STRAND
str2="$2" #2ND STRAND

#EXCEPTIONS
if [[ "$#" != 2 ]]; then
	echo "Usage: hamming.sh <string1> <string2>"
	exit 1
fi
if [[ ! "${#str1}" -eq "${#str2}" ]]; then
	echo "strands must be of equal length"
	exit 1
fi

#LOGIC
if [[ -z "$str1" && -z "$str2" ]]; then
	echo 0
	exit 0
fi
if [[ "$str1" =~ [ACGT?] && ! "$str1" =~ [^ACGT?] && "$str2" =~ [ACGT?] && ! "$str2" =~ [^ACGT?] ]]; then
		declare -i cnt=0
		for ((i=0;i<${#str1};i++)); do
			if [[ ! "${str1:$i:1}" == "${str2:$i:1}" ]]; then
				cnt+=1
			fi
		done
		#echo "The Hamming distance is $cnt"
		echo "$cnt" #HAMMING DISTANCE
fi
