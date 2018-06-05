#!/bin/sh

echo ${0%/*}
echo "$0"
user=`ls -la /dev/console | cut -d " " -f 4`

dateVar=$(date +"%Y.%m.%d")
dateVar+="_"
timeVar=$(date +"%H.%M.%S")

logpath="/Users/$user/Library/Logs/CyanSoft/MacShinyUninstall_console1_log_"
fullLogPath="$logpath$dateVar$timeVar.txt"

ls -lOeR@ "./" >> $fullLogPath

echo "starting nohup  UninstallScript.sh" >> $fullLogPath

dir=${0%/*}
UninstallScript="$dir/UninstallScript.sh"
echo "UninstallScript:$UninstallScript" >> $fullLogPath

if [ ! -f "$UninstallScript" ]
then
	echo "UninstallScript.sh not in $dir  use hardcoded path"
	UninstallScript="/Library/Application Support/CyanSoft/MacShiny/Uninstall.app/Contents/Resources/UninstallScript.sh"
fi

ls -lOeR@ "$UninstallScript" >> $fullLogPath

nohup sh "$UninstallScript" nosw </dev/null >/dev/null 2>&1 &