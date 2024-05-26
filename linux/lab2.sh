#!/bin/bash

# Email details
TO="gahmedg906@gmail.com"
SUBJECT="System Report: Storage, CPU, and Memory Usage"
FROM="gomaaa447@gmail.com"

# Collect system information
STORAGE=$(df -h)
CPU=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"%"}')
MEMORY=$(free -h | grep Mem | awk '{print "Total: " $2 "\nUsed: " $3 "\nFree: " $4}')

# Create email body
BODY="System Storage:\n\n$STORAGE\n\nCPU Usage:\n\n$CPU\n\nMemory Usage:\n\n$MEMORY"

# Send the email
echo -e "To: $TO\nFrom: $FROM\nSubject: $SUBJECT\n\n$BODY" | msmtp --debug --from=default -t

# Check if the email was sent successfully
if [ $? -eq 0 ]; then
    echo "Email sent successfully."
else
    echo "Failed to send email."
fi