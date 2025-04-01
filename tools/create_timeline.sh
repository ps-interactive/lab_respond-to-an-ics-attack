#!/bin/bash
# Script to create a basic timeline from all data sources

echo "Creating incident timeline..."
echo "============================="

# Extract timestamps and events from historian logs
awk '{print $1, $2, "HISTORIAN", $3, $4, $5, $6, $7, $8, $9, $10, $11, $12}' /home/ubuntu/lab/evidence/logs/historian_logs.txt > /home/ubuntu/lab/reports/timeline.txt

# Extract timestamps and events from network connections
awk -F, '{print $1, "NETWORK", "source="$2, "destination="$4, "protocol="$6}' /home/ubuntu/lab/evidence/network/connections.csv >> /home/ubuntu/lab/reports/timeline.txt

# Extract timestamps and events from process history
awk -F, '{print $1, "PROCESS", "host="$2, "process="$3, $4, $5, $6}' /home/ubuntu/lab/evidence/system/process_history.txt >> /home/ubuntu/lab/reports/timeline.txt

# Extract timestamps and events from ICS commands
awk -F, '{print $1, "ICS_COMMAND", "source="$2, "destination="$3, "function="$5, "register="$6, "value="$7}' /home/ubuntu/lab/evidence/ics/plc_commands.txt >> /home/ubuntu/lab/reports/timeline.txt

# Sort the timeline by timestamp
sort -k1,2 /home/ubuntu/lab/reports/timeline.txt > /home/ubuntu/lab/reports/timeline_sorted.txt
mv /home/ubuntu/lab/reports/timeline_sorted.txt /home/ubuntu/lab/reports/timeline.txt

echo "Timeline created at /home/ubuntu/lab/reports/timeline.txt"
