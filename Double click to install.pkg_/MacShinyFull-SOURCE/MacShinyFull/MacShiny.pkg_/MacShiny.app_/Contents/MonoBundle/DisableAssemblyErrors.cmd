echo "allow to load assemblies with delay signed"
echo "dont run this on a test machine. Dev. machine only!"

#
# visual studio 2013:
#
"C:\Program Files (x86)\Microsoft Visual Studio 12.0\Common7\Tools\VsDevCmd.bat"

#
# 7fb75ee5d4d8bf5d ==> \build\public\Ramka.PublicKey
#
sn -Vr *,7fb75ee5d4d8bf5d