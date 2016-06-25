#!/bin/bash
format="+%b-%d-%Y"
today=`date $format`
if [ -z "$KEEPASSX_DATABASE" ]; then
    echo "Need to set KEEPASSX_DATABASE"
    exit 1
fi
for db in "$KEEPASSX_DATABASE"/*.kdbx
do
    filename=$(basename "$db")
    cp "$db" /tmp/$today-$filename
done
cd /tmp/
tar cvzf "$KEEPASSX_DATABASE"/$today-keepassx-backup.tar.gz *.kdbx
rm /tmp/*.kdbx
