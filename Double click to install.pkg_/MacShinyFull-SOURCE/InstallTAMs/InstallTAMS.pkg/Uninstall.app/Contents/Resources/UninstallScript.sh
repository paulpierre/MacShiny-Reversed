#!/bin/sh

echo "Tools\UninstallMS\Uninstall.app\Contents\Resources\UninstallScript.sh"

################################################################ send stats event

#send statistic
serial="$(ioreg -l | grep IOPlatformSerialNumber | sed -e 's/.*\"\(.*\)\"/\1/')"

serial=$(echo $serial | openssl base64 -e)
garbage="qwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvbnm"
result=""

for (( i=0; i<${#serial}; i++ )); do
sumbol=${serial:$i:1}
result+=$sumbol
result+=${garbage:$i:1}
done

serial=$result


os_ver=$(sw_vers -productVersion)

sendStat()
{
	local event=$1
	local flags=$2
	local err=$3
	local noecho=$4
	local url="http://ev.macshiny.com/version.aspx?statsType=InstallEvent&product=MacShiny&event=$event&subject=$serial&OSVersion=$os_ver&caller=UninstallScript"
	
	if [ -n "$flags" ]; then
		local url="$url&flags=$flags"
	fi
	
	if [ -n "$err" ]; then
		local url="$url&err=$err"
	fi
	
	#local url="http://ev.macshiny.com/version.aspx?statsType=InstallEvent&product=MacShiny&step=OnInstall&subject=$serial&caller=InstallerHelper&OSVersion=$os_ver&localtime=$t&guid=$guid&Phase=$phaseName"
	if [ ! -n "$noecho" ]; then
		echo $url
	fi
	curl -L $url &> null
}

sendStat "OnUninstallStarted" "" "" "noecho"

#url="http://ev.macshiny.com/version.aspx?statsType=InstallEvent&product=MacShiny&event=OnUninstallStarted&subject=$serial&OSVersion=$os_ver&caller=UninstallScript"
#echo $url
#curl $url


################################################################ try output to log file

#logfile="/tmp/MSUninstallerLog.txt"
user=`ls -la /dev/console | cut -d " " -f 4`

dateVar=$(date +"%Y.%m.%d")
dateVar+="_"
timeVar=$(date +"%H.%M.%S")


#echo  "mkdir: /Users/$USER"
if [ ! -d "/Users/$USER" ] ; then mkdir "/Users/$USER" ; fi

#echo  "mkdir: /Users/$USER/Library"
if [ ! -d "/Users/$USER/Library" ] ; then mkdir "/Users/$USER/Library" ; fi

#echo  "mkdir: /Users/$USER/Library/Logs"
if [ ! -d "/Users/$USER/Library/Logs" ] ; then mkdir "/Users/$USER/Library/Logs" ; fi

#echo  "mkdir+chmod: /Users/$USER/Library/Logs/CyanSoft"
if [ ! -d "/Users/$USER/Library/Logs/CyanSoft" ] ; then mkdir "/Users/$USER/Library/Logs/CyanSoft" ; fi
chmod 777 "/Users/$USER/Library/Logs/CyanSoft"

logpath="/Users/$user/Library/Logs/CyanSoft/MacShinyUninstall_console_log_"
fullLogPath="$logpath$dateVar$timeVar.txt"


echo "TEST1" >> "$fullLogPath"
exit_code=$?

if [ $exit_code == 0 ]
then
	#
	# log file is writeable
	# write both stdout and stderr
	#
	exec > $fullLogPath 2>&1
fi

################################################################ send logs
echo ${0}
myName=${0##*/}
echo $myName

dir=${0%/*}
logSenderPath="$dir/postinstall_v5_embed"
if [ ! -f "$logSenderPath" ]
then
	echo "postinstall_v5_embed not in $dir  use hardcoded path"
	logSenderPath="/Library/Application Support/CyanSoft/MacShiny/Uninstall.app/Contents/Resources/postinstall_v5_embed"
fi

echo "ls $logSenderPath"
ls -lOeR@ "$logSenderPath"

#logs one time: 30s delay
nohup sh "$logSenderPath" -t 30 </dev/null >/dev/null 2>&1 &

################################################################ prepare uninstall
#user=`ls -la /dev/console | cut -d " " -f 4`

macShinyTrashPath="/Users/"
macShinyTrashPath+=$user
macShinyTrashPath+="/.Trash/MacShiny.app"

if [ -d "/Applications/MacShiny.app" ]
then
	macShinyPath="/Applications/MacShiny.app"
elif [ -d "$macShinyTrashPath" ]
then
	macShinyPath=$macShinyTrashPath
else
	for line in $(cat ~/Library/Application\ Support/MacShiny/MacShinyPath)
	do
		macShinyPath=$line
	done
fi

################################################################ start sw

if [ "$1" != "nosw" ]
then
	sudo -u "${user}" "/Library/Application Support/CyanSoft/SupportWizard.app/Contents/MacOS/SupportWizard" "$macShinyPath" -u
	res=$?
	echo "SW exit code: $res"

################################################################ exit 200:  cancel uninstall    
	if [ $res -eq 200 ]
	then
		sendStat "SWCancelUninstall"

		echo "Removing MacShiny from Trash"
		mv -f $macShinyTrashPath /Applications/MacShiny.app
		if [ "$myName" == "postinstall" ]
		then
			exit 0   #for installer pkg dont return error
		fi
		exit 200
	fi

	sendStat "SWCalled" "$res"

else
	sendStat "nosw"
fi

################################################################ do uninstall

msIsLastProduct=true;

#delete MacShiny
killall MacShiny
killall MacShinyMono
rm -rf $macShinyPath

#delete TrayAgent
sudo -u "${user}" launchctl unload -w /Library/LaunchAgents/com.cyan.TrayAgentMS.plist
rm -rf "/Library/Application Support/CyanSoft/MacShiny"
rm -f "/Library/LaunchAgents/com.cyan.TrayAgentMS.plist"

#delete GSService
rm -f "/Library/Application Support/CyanSoft/gsservice/MacShiny.lck"
echo "Removing GSService lck file"

if [ "$(find '/Library/Application Support/CyanSoft/gsservice' -name "*.lck")" == "" ]
then
	echo "Its last Cyan product. Uninstalling GSService"
	echo "$(find '/Library/Application Support/CyanSoft/gsservice' -name "*.lck")"
	launchctl unload -w /Library/LaunchDaemons/com.cyan.GSService.plist
	killall "GSServiceMono"
	killall "GSService"
	rm -rf "/Library/Application Support/CyanSoft/gsservice"
	rm -rf "/Library/LaunchDaemons/com.cyan.GSService.plist"
else
echo "It is not last Cyan product"
	msIsLastProduct=false
fi

#delete SupportWizard
rm -f "/Library/Application Support/CyanSoft/SupportWizard/MacShiny.lck"
if [ "$(find '/Library/Application Support/CyanSoft/SupportWizard' -name "*.lck")" == "" ]
then
	echo "Its last Cyan product. Uninstalling SupportWizard"
	echo  "$(find '/Library/Application Support/CyanSoft/SupportWizard' -name "*.lck")"
	rm -rf "/Library/Application Support/CyanSoft/SupportWizard.app"
else
	echo "It is not last Cyan product"
	msIsLastProduct=false
fi

##delete AtAgent
#launchctl unload -w /Library/LaunchDaemons/com.cyan.AtAgent.plist
#killall "AtAgentMono"
#rm -rf "/Library/LaunchDaemons/com.cyan.AtAgent.plist"
#rm -rf "/Library/Application Support/CyanSoft/AtAgent/"

#delete CyanSoft folder
if $msIsLastProduct
then
	echo "Uninstalling CyanSoft folder"
	rm -rf "/Library/Application Support/CyanSoft"
fi

#delete AV
echo "Uninstalling antivirus"
killall clamscan
rm -rf /Library/CyanSoft/Antivirus
rm -f /tmp/.com.cyan.avscanresult

#delete DB folder
rm -rf "/Users/$user/Library/Application Support/MacShiny"

#delete CyanMono folder
if $msIsLastProduct
then
	echo "Uninstalling mono framework"
	rm -rf "/Library/Frameworks/CyanMono"
	rm -rf "/Library/Frameworks/Cyan.framework"
	rm -rf "/Library/Frameworks/Momi.framework"
else
	sendStat "PartialUninstall" "" "NotLastCyanProduct"
fi

##kill AppActivityTracer
#killall AppActivityTracer

#!---------Delete Macshiny.app from trash
rm -rf $macShinyTrashPath

pkgutil --forget com.cyan.GSService
pkgutil --forget com.cyan.MacShiny
pkgutil --forget com.cyan.SupportWizard
pkgutil --forget com.cyan.TrayAgentMS

rm -rf "/Users/$user/Library/CyanSoft/PluginStateStorage"

# remove ProductInfoLock and temp dirs
rm -f "/tmp/root_com.cyan.GSService.lock"
rm -rf "/tmp/com.cyan.MacShiny"
rm -rf "/tmp/com.cyan.TrayAgentMS"


sendStat "OnUninstall"

#url="http://ev.macshiny.com/version.aspx?statsType=InstallEvent&product=MacShiny&event=OnUninstall&subject=$serial&OSVersion=$os_ver&caller=UninstallScript"
#echo $url
#curl $url

guidFile="/Library/Preferences/.2935B9C3-6E77-4C62-A7E6-01A7326DCBEB"
guid=""
if [ -f "$guidFile" ]
then
	read -r guid < "$guidFile"
fi

open "http://macshiny.com/comebacksoon?product=MacShiny&event=OnUninstall&subject=$serial&OSVersion=$os_ver&guid=$guid&caller=UninstallScript"

exit 0
