#!/bin/bash

# Backup the original file
cp src/main/java/io/shiftleft/jackspoilt/App.java.bak src/main/java/io/shiftleft/jackspoilt/App.java
echo "Backed up src/main/java/io/shiftleft/App.java.bak as src/main/java/io/shiftleft/App.java"

# Run Maven clean package
mvn clean package
if [ $? -ne 0 ]; then
    echo "Error running Maven command: mvn clean package"
    exit 1
fi
echo "Successfully ran Maven command: mvn clean package"

# Run Maven dependency tree
mvn dependency:tree
if [ $? -ne 0 ]; then
    echo "Error running Maven command: mvn dependency:tree"
    exit 1
fi
echo "Successfully ran Maven command: mvn dependency:tree"

# Run the application jar
java -jar target/jackspoilt-1.0-SNAPSHOT.jar
if [ $? -ne 0 ]; then
    echo "Error running the application jar: java -jar target/jackspoilt-1.0-SNAPSHOT.jar"
    exit 1
fi
echo "Successfully ran the application jar: java -jar target/jackspoilt-1.0-SNAPSHOT.jar"

exit 0


