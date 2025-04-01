#!/bin/bash
# Script to analyze the root cause of the incident

echo "Root Cause Analysis"
echo "=================="

echo -e "\nInitial access vector analysis:"
echo "Examining login attempts before successful compromise:"
grep "LOGIN" /home/ubuntu/lab/evidence/logs/historian_logs.txt

echo -e "\nLateral movement analysis:"
echo "Examining connections from compromised workstation to other systems:"
grep "172.31.24.15" /home/ubuntu/lab/evidence/network/connections.csv

echo -e "\nPrivilege escalation analysis:"
echo "Examining configuration changes made with operator credentials:"
grep "CONFIGURATION CHANGE" /home/ubuntu/lab/evidence/logs/historian_logs.txt

echo -e "\nPersistence mechanism analysis:"
grep "SERVICE RESTART" /home/ubuntu/lab/evidence/logs/historian_logs.txt
