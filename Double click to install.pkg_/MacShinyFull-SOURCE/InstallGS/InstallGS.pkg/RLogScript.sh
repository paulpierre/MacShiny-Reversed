#!/bin/sh
#
#
#
# Created 2/27/2015

echo "Presets\OtherFiles\RLogScript.sh"

# $1 - path to file with list of files to attach
# $2 - subject of mail
# $3 - email of sender (dummy for anonymous reporting and real for real user)
# $4 - body of message
# $5 - API URL where POST request will be resend as email
# $6 - URL for logging if curl fails request in some reason

if [ "$1" == "" ];
then
    echo "Nothing to attach!"
    curl -0 -v -include -F Subject="$2" -F Email="$3" -F  Body="$4" "$5"
    CURL_EXIT=$?
else
    tar -zcv -T "$1" | curl -0 -v -include -F Subject="$2" -F Email="$3" -F  Body="$4" -F 'Attachment=@-;filename=report.tar.gz' "$5"
    CURL_EXIT=${PIPESTATUS[1]}
    rm -f "$1"
fi

#echo "Curl exit $CURL_EXIT"

if [ $CURL_EXIT -ne 0 ];
then
    echo "Error occurred while sending attachment!"
    curl -0 "$6"
else
    echo "Attachment was sent successfully!"
fi

exit

