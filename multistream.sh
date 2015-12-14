#!/bin/bash
clear
echo "Multi-Streamripper-Script by serious-scribbler v0.1"
echo " "
echo "Script run by -> $USER"
echo ""
echo "-----------------------------------------------"
echo ""
dur="600"
cmd="none"
outfolder=""
infile="none"
timestamp=$(date +'%d-%m-%Y_%H:%M:%S')
logfile="$timestamp"
logfile+=".log"
print_help () {
	echo "yLIST OF AVAILABLE PARAMETERS:"
	echo "-k		-	Kills all instances of streamripper"
	echo "-t <s>	 -	The duration of recording in seconds"
	echo "-d <path>	 - 	The folder where the output files will be saved"
	echo "-help		 - 	Shows thid help"
	echo "-sl <file> -	The textfile to read the radiostation URLs of (line by line)"
	exit 0
}
for i in "$@"
do
	#Check for Command
	if [ "$cmd" != "none" ]; then
		if [ "$cmd" == "t" ]; then
			#Execution duration
			dur="$i"
			cmd="none"
			continue
		fi
		if [ "$cmd" == "f" ]; then
			#Input file
			if [ -f $i ]; then
				infile="$i"
			else
				echo "ERROR: INVALID STREAM-URL-LIST $i"
				exit 0
			fi
			cmd="none"
			continue
		fi
		if [ "$cmd" == "o" ]; then
			#Output directory
			if [ -d $i ]; then
				outfolder="$i"
			else
				echo "ERROR: INVALID INPUT FILE!"
				exit 0
			fi
			cmd="none"
			continue
		fi
		echo "ERROR: UNKNOWN PARAMETER"
		exit 0
	fi
	if [ "$i" == "-t" ]; then
		cmd="t"
		continue
	fi
	if [ "$i" == "-d" ]; then
		cmd="o"
		continue
	fi
	if [ "$i" == "-sl" ]; then
		cmd="f"
		continue
	fi
	if [ "$i" == "-help" ]; then
		print_help
	fi
	if [ "$i" == "-k" ]; then
		killall -g -v streamripper
		exit 0
	fi
done
if [ $infile == "none" ]; then
	print_help
fi
if [ $outfolder == "" ]; then
	print_help
fi
command=""
linenumber=(eval "wc -l < $infile")
lncounter=0
echo "EXECUTING COMMANDS..."
while read line
do
	((lncounter++))
    command="streamripper $line -d $outfolder -m 10 -l $dur -s > $outfolder/stream$lncounter-$logfile &"
	if [ "$line" != "" ]; then
		eval $command
		echo "$command"
	fi
	echo ""
done < "$infile"

exit 0