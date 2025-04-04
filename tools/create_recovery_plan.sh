#!/bin/bash
# Script to create a prioritized recovery plan

# Make sure the reports directory exists
mkdir -p /home/ubuntu/lab/reports

# Create the recovery plan and write it to a file
{
echo "ICS Attack Recovery Plan"
echo "======================="
echo -e "\n1. Safety Parameter Restoration:"
echo "The following parameters need to be restored to safe values:"
echo "- MAX_TEMP_THRESHOLD: Reset from 115.0 to 95.0"
echo "- ALARM_TRIGGER_DELAY: Reset from 300 to 30"
echo "- SAFETY_OVERRIDE: Reset from 1.0 to 0"
echo -e "\n2. Service Integrity Checks:"
echo "Verify the integrity of the following services:"
echo "- Historian data collection service"
echo "- Control system communication service"
echo "- Safety monitoring service"
echo -e "\n3. Credential Management:"
echo "Reset credentials for the following accounts:"
echo "- operator (compromised)"
echo "- Implement additional access controls"
echo -e "\n4. Network Security Measures:"
echo "- Block external IPs: 185.142.236.35"
echo "- Implement stricter firewall rules between IT and OT networks"
echo "- Monitor for suspicious connections"
echo -e "\n5. System Hardening:"
echo "- Apply security patches to Historian server"
echo "- Implement whitelist for control system commands"
echo "- Enhance logging and monitoring"
} > /home/ubuntu/lab/reports/recovery_plan.txt

echo "Recovery plan created at /home/ubuntu/lab/reports/recovery_plan.txt"
