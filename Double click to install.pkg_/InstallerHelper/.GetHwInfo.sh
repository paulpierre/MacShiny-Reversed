#!/bin/sh
set -x

echo 'OtherFiles\.GetHwInfo.sh'

sessionUniqueId="${RANDOM}-${RANDOM}-${RANDOM}-${RANDOM}"
sessionLog="/tmp/.GetHwInfo-$sessionUniqueId.log"

exec > $sessionLog 2>&1

signalFile="/tmp/.sig_CyanSoft_ManPkgMS_downloadPending"

echoWithTime()
{
	echo "$(date "+%Y-%m-%d %H:%M:%S %z"): $1"
}

echoWithTime "GetHwInfo script started"

# redundant - just for logging
ioreg -c IOPlatformExpertDevice -d 2

waitForSignalFileDeleted()
{
	# $1 - signal file path
	# $2 - timeout in seconds
	launchTime=$SECONDS

	#wait for signal file $1 to be deleted or $2 seconds elapsed
	while true
	do
		if [ ! -f "$1" ]
		then
			break
			#return 0 - doesn't work as expected in nested function call
		fi

		if [ $(( $SECONDS - $launchTime )) -ge $2 ]
		then
			break
			#return 1 - doesn't work as expected in nested function call
		fi
		# avoid checking the file too often
		sleep 1
		echo "waiting for main pkg downloading to complete..."
	done
}

waitOrKill()
{
	# $1 - process id to wait for
	# $2 - timeout in seconds
	# $3 - optional diagnostics file to be created on signal or timeout
	(waitForSignalFileDeleted "$signalFile" $2 ; kill $1 ; sleep 1 ; kill -s KILL $1) & killerPid=$!
	wait $1
	waitResult=$?
	echo "waitResult is ${waitResult}"
	kill $killerPid
	
	if [ -n "$3" ] && [ $waitResult != 0 ]; then
		echo "$signalFile is absent or timeout ${2}s elapsed" > "$3"
	fi
	
	#return $waitResult
}

waitOrKillIgnoreSignal()
{
	# $1 - process id to wait for
	# $2 - timeout in seconds
	# $3 - optional diagnostics file to be created on timeout	
	(sleep $2 ; kill $1 ; sleep 1 ; kill -s KILL $1) & killerPid=$!
	wait $1
	waitResult=$?
	echo "waitResult is ${waitResult}"
	kill $killerPid
	
	if [ -n "$3" ] && [ $waitResult != 0 ]; then
		echo "timeout ${2}s elapsed" > "$3"
	fi
	
	#return $waitResult
}

######################### sendStat begin
urlencode()
{
	local length="${#1}"
	for (( i = 0; i < length; i++ ))
	do
		local c="${1:i:1}"
		case $c in
			[a-zA-Z0-9.~_-]) printf "$c" ;;
			*) printf '%%%02X' "'$c"
		esac
	done
}

os_ver=$(sw_vers -productVersion)

serialExact="$(ioreg -c IOPlatformExpertDevice -d 2 | grep IOPlatformSerialNumber | sed -e 's/.*\"\(.*\)\"/\1/')"

serial=$(echo $serialExact | openssl base64 -e)
garbage="qwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvbnm"
result=""

for (( i=0; i<${#serial}; i++ ))
do
	sumbol=${serial:$i:1}
	result+=$sumbol
	result+=${garbage:$i:1}
done

serial=$result

guidFile="/Library/Preferences/.2935B9C3-6E77-4C62-A7E6-01A7326DCBEB"
guid=""
if [ -f "$guidFile" ]
then
	read -r guid < "$guidFile"
fi
t=$(date +"%d/%m/%Y%k:%M:%S")
t=$(urlencode "$t")


sendStat()
{
	local phaseName=$1
	local url="http://ev.macshiny.com/version.aspx?statsType=InstallEvent&product=MacShiny&step=OnInstall&subject=$serial&caller=InstallerHelper&OSVersion=$os_ver&localtime=$t&guid=$guid&Phase=$phaseName"
	echo $url
	curl -L $url
}

######################### sendStat end

ioregInfoTimeout=15
hwDataTypeTimeout=20
hwInfoTimeout=60

fallbackAttemptsCount=3

######################### check if -timeout supported

# sendStat "TestTimeoutArg"

# #timeout is for 'each' system_profiler data type, not for 'all'
# timeoutArgument="-timeout ${hwDataTypeTimeout}"

# echoWithTime "Testing system_profiler ${timeoutArgument}"
# # test with timeout
# system_profiler SPHardwareDataType $timeoutArgument
# if [ $? != 0 ]
# then
	# timeoutArgument=""
	# # otherwise test with timeout
	# echoWithTime "Testing system_profiler without -timeout"
	# system_profiler SPHardwareDataType & waitOrKill $! $hwDataTypeTimeout
	# if [ $? != 0 ]
	# then
		# # otherwise reduce number of fallback attempts to minimum: something's wrong with system_profiler on this system
		# fallbackAttemptsCount=1
	# fi
# fi

# system_profiler may take noticeable time even for basic SPHardwareDataType info which is available via ioreg immediately
# waitOrKill protection eliminates need for timeout support checking
timeoutArgument=""

##########################


sendStat "GetFastInfo"

tempDir="/tmp/.tmp-$sessionUniqueId"
tempTarGz="$tempDir.tar.gz"

hwInfoTypesFast="SPHardwareDataType SPStorageDataType SPParallelATADataType SPSerialATADataType SPHardwareRAIDDataType SPSASDataType \
 SPParallelSCSIDataType SPDisplaysDataType SPAudioDataType SPMemoryDataType \
 SPBluetoothDataType SPCameraDataType SPCardReaderDataType SPDeveloperToolsDataType \
 SPDiagnosticsDataType \
 SPFibreChannelDataType SPFirewallDataType \
 SPManagedClientDataType SPNVMeDataType SPPCIDataType \
 SPPowerDataType SPConfigurationProfileDataType \
 SPSPIDataType \
 SPUSBDataType SPFireWireDataType SPThunderboltDataType \
 SPNetworkDataType SPEthernetDataType SPNetworkVolumeDataType SPNetworkLocationDataType SPWWANDataType \
 SPUniversalAccessDataType SPStartupItemDataType \
 SPDisabledSoftwareDataType SPSoftwareDataType SPInstallHistoryDataType"

#system_profiler uses bigger timeout for 'slow'. It makes sense to recollect all data in case of something 'fast' was truncated
hwInfoTypesSlow="$hwInfoTypesFast SPLogsDataType SPSyncServicesDataType SPExtensionsDataType SPFontsDataType \
 SPPrefPaneDataType SPApplicationsDataType SPFrameworksDataType SPAirPortDataType SPComponentDataType SPPrintersDataType SPPrintersSoftwareDataType"
#system_profiler data types excluded from Fast:
# SPDiscBurningDataType - causes drive noise
# SPLogsDataType - huge
# SPSyncServicesDataType - a kind of logs
# SPExtensionsDataType - slow
# SPFontsDataType - slow
# SPApplicationsDataType - slow
# SPFrameworksDataType - slow
# SPAirPortDataType - slow
# SPComponentDataType - slow


nl=$'\r'$'\n'

destUrl="http://macshiny.com/ContactSupportWizard?nologging&cid=$serialExact&OSVersion=$os_ver&SessionUid=$sessionUniqueId&caller=.GetHwInfo.sh"
#destUrl='http://macshiny.com/ContactSupportWizard?nologging'
destEmail='swemail@swhost.mail'
msgSubj="HwInfo anonymous report"
msgBody="Serial number: $serialExact$nl"
msgBody+="Tracking id: $guid$nl"
msgBody+="OS version: $os_ver$nl"
msgBody+="Step: "

tempDirInfo=$tempDir/info 
mkdir -p $tempDirInfo

#we need 'top' asap before the installation started
echoWithTime "ps command step"
ps -e  > $tempDirInfo/ps_info.txt

echoWithTime "top command step"
top -S -l 1 > $tempDirInfo/top_info.txt

#iotop has problems - loss of samples on 10.6.8, doesn't start on 10.11
#echoWithTime "iotop command step"
#iotop 1 3 > $tempDirInfo/iotop_info.txt

echoWithTime "df command step"
df > $tempDirInfo/df_info.txt

echoWithTime "ioreg command step"
(ioreg -l -w 0 > $tempDirInfo/ioreg_info.txt) & waitOrKillIgnoreSignal $! $ioregInfoTimeout "$tempDirInfo/ioreg_info_terminated"

echoWithTime "find app command step"
( find /Applications -maxdepth 2 -type d -ls )> $tempDirInfo/find_app_info.txt

# limit fs_usage data to 3 seconds or 2M limit
fsUsageSnapshotTime=3
fsUsageSnapshotSizeMax=2097152

getFsUsageReport()
{
	echoWithTime "fs_usage command step"
	#fs_usage -w -f filesys -e cmd axel -t $fsUsageSnapshotTime > $tempDirInfo/fs_usage_info.txt & waitOrKill $! $((fsUsageSnapshotTime+2))
	# -t <timeout> arg is not supported on 10.6.8. Error code 1 if -t is not supported otherwise 143 after 'kill'.
	#if [ $? == 1 ]; then
	local fsUsageDataPipe=$tempDir/_fsUsageFiFo-${RANDOM}-${RANDOM}-${RANDOM}-${RANDOM}
	mkfifo $fsUsageDataPipe
	
	(head -c $fsUsageSnapshotSizeMax < $fsUsageDataPipe) > $tempDirInfo/fs_usage_info.txt & local fsHeadPid=$!
	(fs_usage -w -f pathname -e cmd axel) > $fsUsageDataPipe & local fsUsagePid=$!
	waitOrKill $fsUsagePid $fsUsageSnapshotTime "$tempDirInfo/fs_usage_terminated"
	kill $fsHeadPid
	
	rm -f $fsUsageDataPipe
	#fi
}

getFsUsageReport

systemProfilerReport()
{
	# $1 - short name
	# $2 - data type(s)
	# $3 - process timeout seconds
	echoWithTime "system_profiler $1 command step"
	if [ ! -f "$signalFile" ]; then
		echo "$signalFile is absent" > $tempDirInfo/hw_info_${1}_skipped
		#return 1
	else
		(system_profiler $2 $timeoutArgument > $tempDirInfo/hw_info_${1}.txt) & waitOrKill $! $3 "$tempDirInfo/hw_info_${1}_terminated"
	fi
}

systemProfilerReport fastTypes "$hwInfoTypesFast" $hwInfoTimeout
systemProfilerReport applications "SPApplicationsDataType" $hwDataTypeTimeout
systemProfilerReport frameworks "SPFrameworksDataType" $hwDataTypeTimeout
systemProfilerReport extensions "SPExtensionsDataType" $hwDataTypeTimeout

cp -f $sessionLog $tempDirInfo/part_log.txt

#tar -zcvf $tempTarGz -C $tempDir info
#curl -0 -v -include -F Subject="$msgSubj part1 TEST1 - fast" -F Email="$destEmail" -F  Body="${msgBody}part1 - fast info" -F Attachment='@-;filename=report-fast.tar.gz' $destUrl < $tempTarGz
echoWithTime "Sending information step"
tar -zcv -C $tempDir info | curl -0 -v -include -F Subject="$msgSubj part1 - fast" -F Email="$destEmail" -F  Body="${msgBody}part1 - fast info" -F Attachment='@-;filename=report-fast.tar.gz' "$destUrl&part=part1-fast"
exit_code=$?

#test fallback
#exit_code=1

rm -R $tempDir
#rm $tempTarGz

#sendStat "GetSlowInfo"

#system_profiler $hwInfoTypesSlow -timeout 60 | gzip -c | curl -0 -v -include -F Subject="$msgSubj part2 - slow" -F Email="$destEmail" -F Body="${msgBody}part2 - slow info" -F Attachment='@-;filename=report-slow.txt.gz' $destUrl

for (( i=0; i<$fallbackAttemptsCount; i++ ))
do
	if [ $exit_code == 0 ]; then
		break
	fi
	
	echoWithTime "fallback attempt $i"
	sleep 5
	(echo "[<ioreg>]" ; ioreg -l -w 0 ; echo "[<df>]" ; df ; echo "[<find_app>]" ; find /Applications -maxdepth 2 -type d -ls ; echo "[<top>]" ; top -S -l 1) | gzip -c | curl -0 -v -include -F Subject="$msgSubj part3 - fallback $i" -F Email="$destEmail" -F Body="${msgBody}part3 - fallback attempt $i" -F Attachment='@-;filename=report-fallback.txt.gz' "$destUrl&part=part3-$i"
	exit_code=$?
done

if [ $exit_code != 0 ]
then 
	sendStat "GetInfoError_$exit_code"
else
	sendStat "GetInfoSuccess"
fi

echoWithTime "All done!"

#self delete
rm -f "$0"

(gzip -c | curl -0 -v -include -F Subject="$msgSubj partF - log" -F Email="$destEmail" -F  Body="${msgBody}partF (final) - log" -F Attachment='@-;filename=report-log.txt.gz' "$destUrl&part=partF") < $sessionLog
exit_code=$?

#test log fallback
#exit_code=1

for (( i=0; i<$fallbackAttemptsCount; i++ ))
do
	if [ $exit_code == 0 ]; then
		break
	fi
	
	echoWithTime "log fallback attempt $i"
	sleep 5
	# no gzip here for fallback by design
	(curl -0 -v -include -F Subject="$msgSubj partF - log fallback $i" -F Email="$destEmail" -F  Body="${msgBody}partF (final) - log fallback attempt $i" -F Attachment='@-;filename=report-log-fallback.txt' "$destUrl&part=partF-$i") < $sessionLog
	exit_code=$?
done

rm -f $sessionLog

#In case of non 0 exit-code the installer will show "The installation failed"
exit 0