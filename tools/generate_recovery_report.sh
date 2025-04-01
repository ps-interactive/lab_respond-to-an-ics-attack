#!/bin/bash
# Script to automatically generate a recovery report

echo "Generating recovery implementation report..."

# Create the report file
cat > /home/ubuntu/lab/reports/recovery_report.txt << 'EOL'
ICS ATTACK RECOVERY IMPLEMENTATION REPORT
========================================

RECOVERY ACTIONS PERFORMED
------------------------
1. Safety Parameter Restoration:
   - MAX_TEMP_THRESHOLD: Reset from 115.0 to 95.0
   - ALARM_TRIGGER_DELAY: Reset from 300 to 30
   - SAFETY_OVERRIDE: Reset from 1 to 0
   All parameters have been verified to be at safe operating values.

2. Malicious File Removal:
   - Removed unauthorized modbus.py script from Engineering Workstation
   - Scanned for and removed any additional malicious files
   - Verified system integrity

3. Credential Management:
   - Reset operator account credentials
   - Implemented multi-factor authentication
   - Applied principle of least privilege to control system access

4. Network Security Hardening:
   - Blocked external IP 185.142.236.35
   - Implemented stricter firewall rules between IT and OT networks
   - Enhanced network monitoring for suspicious connections

5. System Hardening:
   - Applied security patches to Historian server
   - Implemented whitelist for control system commands
   - Enhanced logging and monitoring

VERIFICATION RESULTS
------------------
1. System Integrity:
   - All affected systems have been scanned and verified
   - No unauthorized processes or services detected
   - All services are running normally

2. Safety System Functionality:
   - Cooling system operating within normal parameters
   - Temperature monitoring functioning correctly
   - Alarm systems responding appropriately to test conditions

3. Network Security:
   - No unauthorized connections detected
   - Proper segmentation between IT and OT networks verified
   - Enhanced monitoring in place

RECOMMENDATIONS FOR FUTURE PREVENTION
-----------------------------------
1. Implement Security Awareness Training:
   - Focus on phishing and social engineering awareness
   - Proper credential management practices
   - Recognition of suspicious activities

2. Enhance Technical Controls:
   - Multi-factor authentication for all privileged accounts
   - Regular security patching of all systems
   - Network segmentation and monitoring

3. Improve Operational Procedures:
   - Regular security assessments of ICS environment
   - Change management procedures for control system modifications
   - Regular backup and recovery testing

4. Develop Incident Response Plan:
   - Specific to ICS environments
   - Regular tabletop exercises
   - Clear roles and responsibilities
EOL

echo "Recovery implementation report generated at /home/ubuntu/lab/reports/recovery_report.txt"
