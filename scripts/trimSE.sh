#!/usr/bin/env bash

######################################################
#	# trimSE.sh #
#	TRIMMOMATIC LAUNCHER
#	EXECUTE TRIMMOMATIC TASK FOR SINGLE READS
#	TRIMS LOW QUALITY BASES FROM FASTQ FILES.
#
#	AUTHOR: JAVIER MONTALVO-ARREDONDO.
#	VERSION: 0
#	CONTACT: buitrejma@gmail.com
#	DEPARTAMENTO DE BIOTECNOLOGIA
#	UNIVERSIDAD AUTONOMA AGRARIA ANTONIO NARRO
#	CALZADA ANTONIO NARRO 1923 SAN BUENAVISTA
#	SALTILLO COAHUILA CP. 25315
######################################################

PROGRAM="trimmomatic"

#
#	PARSING ARGUMENTS
#

while getopts "hi:o:I:S:L:T:M:P:" opt
do
	if [ -z $opt ];
	then
		echo "[ trimSE ][ERROR!] - Empty arguments!"
		clear
		#usage
	fi
	case $opt in
		h)
			clear
			usage
			;;
		i)
			INPUT=$OPTARG
			if [ -z $INPUT ];
			then
				echo "[ trimSE ][ERROR!] - Empty input file name!"
				exit 1
			fi
			;;
		o)
			OUTPUT=$OPTARG
			if [ -z $OUTPUT ];
			then
				echo "[ trimSE ][ ERROR! ] - Empty output file name!"
				exit 1
			fi
			;;
		I)
			ILLUMINACLIP=$OPTARG
			if [ -z $ILLUMINACLIP ];
			then
				echo "[ trimSE ][ WARNI! ] - Default ILLUMINACLIP options were selected!"
				ILLUMINACLIP="ILLUMINACLIP:~/src/Trimmomatic-0.38/adapters/TrueSeq3-SE.fa:2:30:10"
			fi
			;;
		S)
			SLIDINGWINDOW=$OPTARG
			if [ -z $SLIDINGWINDOW ];
			then
				echo "[ trimSE ][ WARNI! ] - Default SLIDINGWINDOW options were selected!"
				SLIDINGWINDOW="SLIDINGWINDOW:4:15"
			fi
			;;
		L)
			LEADING=$OPTARG
			if [ -z $LEADING ];
			then
				echo "[ trimSE ][ WARNI! ] - Default LEADING options were selected!"
				LEADING="LEADING:26"
			fi
			;;
		T)
			TRAILING=$OPTARG
			if [ -z $TRAILING ];
			then
				echo "[ trimSE ][ WARNI! ] - Default TRAILING options were selected!"
				TRAILING="TRAILING:26"
			fi
			;;
		M)
			MINLEN=$OPTARG
			if [ -z $MINLEN ];
			then
				echo "[ trimSE ][ WARNI! ] - Default MINLEN options were selected!"
				MINLEN="MINLEN:36"
			fi
			;;
		P)
			PHRED=$OPTARG
			PHRED="-phred${PHRED}"
			;;
	esac
done

#
#	PRINTING SELECTED PARAMETERS
#

echo $ILLUMINACLIP
echo $SLIDINGWINDOW
echo $LEADING
echo $TRAILING
echo $MINLEN


#
#	EXECUTING MAIN PROGRAM
#

$PROGRAM SE $PHRED $INPUT $OUTPUT $ILLUMINACLIP $SLIDINGWINDOW $LEADING $TRAILING $MINLEN

