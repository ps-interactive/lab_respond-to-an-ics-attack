#!/bin/bash
# Simple script to analyze network connections

echo "Network Connection Analysis"
echo "=========================="

echo -e "\nTop source IPs:"
awk -F, '{print $2}' /home/ubuntu/lab/evidence/network/connections.csv | sort | uniq -c | sort -nr

echo -e "\nTop destination IPs:"
awk -F, '{print $4}' /home/ubuntu/lab/evidence/network/connections.csv | sort | uniq -c | sort -nr

echo -e "\nConnections to external IPs:"
awk -F, '{if ($4 !~ /^172\.31\./) print $0}' /home/ubuntu/lab/evidence/network/connections.csv
echo -e "\nModbus protocol connections:"
grep "MODBUS" /home/ubuntu/lab/evidence/network/connections.csv
