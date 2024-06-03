#!/bin/bash

# Spuštění Skriptu 1
echo "Running script1.sh..."
./script1.sh textfile.txt
echo "script1.sh completed."
echo

# Spuštění Skriptu 2
echo "Running script2.sh..."
./script2.sh /path/to/directory "search text"
echo "script2.sh completed."
echo

# Spuštění Skriptu 3
echo "Running script3.sh..."
sudo ./script3.sh username
echo "script3.sh completed."
echo

# Spuštění Skriptu 4
echo "Running script4.sh..."
sudo ./script4.sh username
echo "script4.sh completed."
echo

# Spuštění Skriptu 5
echo "Running script5.sh..."
sudo ./script5.sh
echo "script5.sh completed."
echo

echo "All scripts executed."
