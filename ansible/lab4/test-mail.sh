#!/bin/bash

# Email Configuration
recipient="gomaaa447@gmail.com"
subject="Disk Usage Report"
body="Disk Usage Report:\n\n$(df -h)\n\nDisk Usage Summary:\n\n$(du -sh /home/*)"

# Send Email Function
send_email() {
    echo -e "$body" | mail -s "$subject" "$recipient"
}

# Main Function
main() {
    # Run Disk Usage Report
    echo -e "Disk Usage Report:\n"
    df -h

    echo -e "\nDisk Usage Summary:\n"
    du -sh /home/*

    # Send Email
    send_email
}

# Execute Main Function
main

