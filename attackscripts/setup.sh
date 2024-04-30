#!/bin/bash

# Change directory to /home/qwietai/jackspoilt
cd /home/qwietai/jackspoilt

# Remove attackscripts/attack.json if it exists
if [ -f attackscripts/attack.json ]; then
    rm attackscripts/attack.json
    echo "Removed attackscripts/attack.json"
else
    echo "No attackscripts/attack.json found"
fi

# Run Maven exec:java with specified main class
mvn exec:java -Dexec.mainClass="EncodeExploit"
if [ $? -ne 0 ]; then
    echo "Error running Maven command: mvn exec:java -Dexec.mainClass=\"EncodeExploit\""
    exit 1
fi
echo "Successfully ran Maven command: mvn exec:java -Dexec.mainClass=\"EncodeExploit\""

# Change prompt to /home/qwietai/jackspoilt/attackscripts
PS1="/home/qwietai/jackspoilt/attackscripts $ "
export PS1

echo "Changed prompt to /home/qwietai/jackspoilt/attackscripts"

exit 0
