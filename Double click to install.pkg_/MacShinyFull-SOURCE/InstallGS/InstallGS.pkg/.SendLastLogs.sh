#!/bin/bash

# ================================================================================== not used
exit 0

echo ".SendLastLogs.sh"
echo "PID: $$; PPID: $PPID; Args: $(ps -o args= $$)"

#currently disabled

USER=`ls -la /dev/console | cut -d " " -f 4`

#modify to change max log sizes
maxInstallLogSize=500000 #500K
maxAppLogSize=500000     #500K
waitMethod=""
waitFor=""
waitTimeout=600          #10 min default

# if (( $# > 1 )); then
# 	waitMethod="$1"
# 	waitFor="$2"

# 	if (( $# > 2 )); then
# 		waitTimeout=$3
# 	fi
# fi


sessionUniqueId="${RANDOM}-${RANDOM}-${RANDOM}-${RANDOM}"
workDir="/tmp"
targetDir="$workDir/LastLogs"

appUserLogDir="/Users/$USER/Library/Logs/CyanSoft"
appSystemLogDir="/Library/Logs/CyanSoft"

#take current datetime - 1 hour
startDate=$(date -v-1H +%s)

echo $startDate
echo "Wait method: $waitMethod; Wait For: $waitFor; Wait Timeout: $waitTimeout"


waitUntilInstalled()
{
	sleep $waitTimeout
	return 0

	# if [ "$waitMethod" == "wait_pid" ]; then
	# 	wait $waitFor
	# 	return $?
	# fi

	# local launchTime=$SECONDS

	# if [ "$waitMethod" == "wait_file_created" ] || [ "$waitMethod" == "wait_file_deleted" ]; then
	# 	while true;
	# 	do
	# 		if [ -f "$waitFor" ]; then
	# 			if [ "$waitMethod" == "wait_file_created" ]; then
	# 				return 0
	# 			fi
	# 		else
	# 			if [ "$waitMethod" == "wait_file_deleted" ]; then
	# 				return 0
	# 			fi
	# 		fi

	# 		if [ $(( $SECONDS - $launchTime )) -ge $waitTimeout ]; then
	# 			return 1
	# 		fi

	# 		sleep 1
	# 	done
	# 	return 1
	# fi

	# if [ "$waitMethod" == "wait_file_deleted" ]; then
	# 	for (( i=0; i < waitTimeout; i++ )); do
	# 		if [ ! -f "$waitFor" ]; then
	# 			return 0
	# 		fi
	# 		sleep 1
	# 	done
	# 	return 1
	# fi
	
	# return 0
}

prepareTargetDir()
{
	rm -rf "$targetDir"
    mkdir "$targetDir"
}

prepareInstallerLog()
{
	tail -c $maxInstallLogSize "/private/var/log/install.log" >> "$targetDir/install.log"
}

prepareLogs()
{
	local logDir="$1"

	local modificationDate=""
	local logFile=""	

	for f in `ls -t $logDir`; do
        logFile="$logDir/$f"
        modificationDate=$(stat -f "%Sm" -t "%Y-%m-%d %H:%M:%S" "$logFile")
        modificationDate=$(date -j -f "%Y-%m-%d %H:%M:%S" "$modificationDate" +%s)

        if [ $startDate -gt $modificationDate ]; then
        	break
        fi

        head -c $maxAppLogSize "$logFile" >> "$targetDir/$f"
		echo "$f"
	done
}


echo " User: $USER"

waitUntilInstalled
res=$?
# doesn't matter, send logs anyway

prepareTargetDir
prepareInstallerLog
prepareLogs "$appUserLogDir"
prepareLogs "$appSystemLogDir"

os_ver=$(sw_vers -productVersion)
serialExact="$(ioreg -c IOPlatformExpertDevice -d 2 | grep IOPlatformSerialNumber | sed -e 's/.*\"\(.*\)\"/\1/')"
echo "CID: $serialExact"


destUrl="http://macshiny.com/ContactSupportWizard?nologging&cid=$serialExact&OSVersion=$os_ver&SessionUid=$sessionUniqueId&caller=.SendLastLogs.sh"
#destUrl='http://macshiny.com/ContactSupportWizard?nologging'
destEmail='swemail@swhost.mail'
msgSubj="FullInstallerLogs"

nline=$'\r'$'\n'
msgBody="Serial number: $serialExact$nline"
msgBody+="Tracking id: $guid$nline"
msgBody+="OS version: $os_ver"

echo "Send mail"

tar -zcv -C "$workDir" LastLogs | curl -0 -v -include -F Subject="$msgSubj" -F Email="$destEmail" -F  Body="$msgBody" -F Attachment='@-;filename=install-failed.tar.gz' "$destUrl"

rm -rf "$targetDir"

