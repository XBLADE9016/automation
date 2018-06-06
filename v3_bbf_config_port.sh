#!/bin/bash
#author: Adelcis Villarroel
#v3
#DESCRIPTION: SCRIPT TO RENAME PORTS FROM DEFAULT AND BASE SWITCH WHEN FC-FC ROUTING and VF IS IN PLACE
#
#			!!!!! PLEASE BEFORE RUNNING THE SCRIPT!!!! 
#	ADJUST THE VALUES OF THE VARIABLES FROM BELOW ACCORDING TO YOUR CONFIGURATION
#	           CHANGE THE SLOT/PORT NUMBERS ACCORDING TO YOUR DESIGN
#
USER="" #ex. carlos
PASS="" #ex. 12345
FID=""	#ex. 11
NAME_1="" #ex. reserv_ISL16Gb_DSSW1_BSSW1
NAME_2="" #ex. reserv_ISL16Gb_DSSW2_BSSW1
NAME_3="" #ex. reserv_ISL16Gb_BSSW1_DSSW1
NAME_4="" #ex. reserv_ISL16Gb_BSSW1_DSSW2
HOST_FILE_1="" #ex. /home/user/Documents/host1.txt
HOST_FILE_2="" #ex. /home/user/Documents/host2.txt
HOST_FILE_3="" #ex. /home/user/Documents/host3.txt

echo ""
echo "CONFIGURING PORTS FROM DS SW1 -> BS SW1 ----------------------------|"
echo ""
for i in `cat ${HOST_FILE_1}`; do
	echo "--------------------------------${i}";
		sshpass -p ${PASS} ssh ${USER}@${i} 'portname SLOT/PORT -n '${NAME_1}';
						     portname SLOT/PORT -n '${NAME_1}';
						     portname SLOT/PORT -n '${NAME_1}';
						     portname SLOT/PORT -n '${NAME_1}''
done
echo ""
cho "CONFIGURING PORTS FROM DS SW2 -> BS SW1 ----------------------------|"
echo ""
for i in `cat ${HOST_FILE_2}`; do
	echo "--------------------------------${i}";
		sshpass -p ${PASS} ssh ${USER}@${i} 'portname SLOT/PORT -n '${NAME_2}';
						     portname SLOT/PORT -n '${NAME_2}';
						     portname SLOT/PORT -n '${NAME_2}';
						     portname SLOT/PORT -n '${NAME_2}''
done
echo ""
echo "CONFIGURING PORTS FROM BS SW1 -> DS SW1/SW2 ------------------------|"
echo ""
for i in `cat ${HOST_FILE_3}`; do
	echo "------------------------------- $i" >> temp_file.txt
	sshpass -p ${PASS} ssh ${USER}@${i} 'fosexec --fid '${FID}' -cmd "portname SLOT/PORT -n '${NAME_3}'";
	                                     fosexec --fid '${FID}' -cmd "portname SLOT/PORT -n '${NAME_3}'";
	                                     fosexec --fid '${FID}' -cmd "portname SLOT/PORT -n '${NAME_3}'";
	                                     fosexec --fid '${FID}' -cmd "portname SLOT/PORT -n '${NAME_3}'";
	                                     fosexec --fid '${FID}' -cmd "portname SLOT/PORT -n '${NAME_4}'";
	                                     fosexec --fid '${FID}' -cmd "portname SLOT/PORT -n '${NAME_4}'";
	                                     fosexec --fid '${FID}' -cmd "portname SLOT/PORT -n '${NAME_4}'";
	                                     fosexec --fid '${FID}' -cmd "portname SLOT/PORT -n '${NAME_4}'"' >> temp_file.txt
done
sed '/^\s*$/d' temp_file.txt
rm temp_file.txt
echo ""
echo "VERIFYING PORTS FROM DS SW1 -> BS SW1 ----------------------------|"
echo ""
for i in `cat ${HOST_FILE_1}`; do
	echo "--------------------------------${i}";
		sshpass -p ${PASS} ssh ${USER}@${i} 'portname SLOT/PORT;
						     portname SLOT/PORT;
						     portname SLOT/PORT;
						     portname SLOT/PORT'
done
echo ""
echo "VERIFYING PORTS FROM DS SW2 -> BS SW1 ----------------------------|"
echo ""
for i in `cat ${HOST_FILE_2}`; do
	echo "--------------------------------${i}";
		sshpass -p ${PASS} ssh ${USER}@${i} 'portname SLOT/PORT;
						     portname SLOT/PORT;
						     portname SLOT/PORT;
						     portname SLOT/PORT'
done
echo ""
echo "VERIFYING PORTS FROM BS SW1 -> DS SW1/SW2 ------------------------|"
echo ""
for i in `cat ${HOST_FILE_3}`; do
	echo "------------------------------- $i" >> temp_file.txt
	sshpass -p ${PASS} ssh ${USER}@${i} 'fosexec --fid '${FID}' -cmd "portname SLOT/PORT";
	                                     fosexec --fid '${FID}' -cmd "portname SLOT/PORT";
					     fosexec --fid '${FID}' -cmd "portname SLOT/PORT"; 
					     fosexec --fid '${FID}' -cmd "portname SLOT/PORT";
					     fosexec --fid '${FID}' -cmd "portname SLOT/PORT"; 
					     fosexec --fid '${FID}' -cmd "portname SLOT/PORT"; 
					     fosexec --fid '${FID}' -cmd "portname SLOT/PORT"; 
					     fosexec --fid '${FID}' -cmd "portname SLOT/PORT"' >> temp_file.txt
done
sed '/^\s*$/d' temp_file.txt
rm temp_file.txt
echo ""
echo "######################################################################"
echo "############################END OF SCRIPT#############################"
echo "######################################################################"
echo ""
