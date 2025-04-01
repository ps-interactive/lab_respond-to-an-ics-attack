#!/bin/bash
# Script to automatically generate a forensic analysis report

echo "Generating forensic analysis report..."

# Create the report file
cat > /home/ubuntu/lab/reports/forensic_analysis.txt << 'EOL'
DETAILED FORENSIC ANALYSIS REPORT
================================

ATTACK VECTOR ANALYSIS
---------------------
Initial Access:
The attacker gained initial access to the environment by compromising operator credentials. After three failed login attempts using the admin account, they successfully logged in with the operator account at 23:45:01, suggesting they may have obtained these credentials through a previous attack or social engineering.

Lateral Movement:
After gaining access to the Engineering Workstation (172.31.24.15), the attacker established connections to the Historian Server (172.31.37.30) and subsequently to Control System PLCs (172.31.64.20). This lateral movement allowed them to pivot from the IT network to the OT network where critical control systems were located.

Privilege Escalation:
The attacker used the operator account, which already had privileges to modify control system parameters. They didn't need further privilege escalation as the operator account had sufficient access to make the malicious changes to safety parameters.

MALWARE ANALYSIS
---------------
File Information:
A malicious Python script named "modbus.py" was downloaded from an external server (185.142.236.35) using wget. The script was made executable with chmod and then executed multiple times with different parameters.

Functionality:
The malware was designed to interface with Modbus protocol and modify critical PLC registers. It specifically targeted three safety-critical parameters: MAX_TEMP_THRESHOLD (register 4032), ALARM_TRIGGER_DELAY (register 4033), and SAFETY_OVERRIDE (register 4034). The script allowed the attacker to write new values to these registers, effectively bypassing safety mechanisms.

Communication:
The malware communicated with the external IP 185.142.236.35 over port 443, indicating a possible encrypted command and control channel. The attacker also exported historian data to their local machine, suggesting data exfiltration as part of the attack.

IMPACT ASSESSMENT
---------------
Systems Affected:
- Engineering Workstation (172.31.24.15)
- Historian Server (172.31.37.30)
- Control System PLCs (172.31.64.20)

Operational Impact:
The attack modified critical control parameters that could affect the cooling system operation. The data collection service was also restarted, potentially causing a temporary loss of monitoring capability.

Safety Implications:
The attack has serious safety implications:
1. Increased MAX_TEMP_THRESHOLD from 95.0°C to 115.0°C, which exceeds safe operating temperatures
2. Extended ALARM_TRIGGER_DELAY from 30 seconds to 300 seconds, significantly delaying emergency response
3. Enabled SAFETY_OVERRIDE (set to 1), which bypasses built-in safety protections
These changes together could lead to dangerous overheating conditions without proper alarms or safety mechanisms.

ROOT CAUSE DETERMINATION
---------------------
Primary Cause:
The root cause of the incident was unauthorized access to the operator account, which had privileges to modify critical control system parameters without sufficient security controls or validation.

Contributing Factors:
1. Lack of multi-factor authentication for operator accounts
2. Insufficient network segmentation between IT and OT networks
3. Inadequate monitoring of critical parameter changes
4. Absence of validation checks for safety-critical parameter modifications

Timeline of Key Events:
23:42:12 - Initial failed login attempt with admin account
23:45:01 - Successful login with operator account
23:45:00 - Connection established to Modbus port on Historian
23:45:02 - First execution of modbus.py script to modify MAX_TEMP_THRESHOLD
23:48:15 - Modification of ALARM_TRIGGER_DELAY
23:48:55 - SAFETY_OVERRIDE parameter enabled
23:50:22 - Historian data exported to attacker machine
00:15:44 - Service restart to maintain persistence
EOL

echo "Forensic analysis report generated at /home/ubuntu/lab/reports/forensic_analysis.txt"
