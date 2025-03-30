# lab_respond-to-an-ics-attack

ICS ATTACK INCIDENT RESPONSE LAB
================================

In this lab, you'll respond to a simulated cyber attack against a nuclear facility's Industrial Control Systems (ICS).

Scenario:
A potential security incident has been reported at a nuclear facility. There are concerns that critical control systems, including those managing cooling operations, have been compromised. As an incident responder, your task is to investigate, analyze, and help recover from this security breach.

Lab Organization:
- incident_alert.txt - Initial incident alert
- facility_documentation.txt - Documentation about the facility
- evidence/ - Directory containing pre-collected evidence
  - network/ - Network connection data
  - logs/ - System and application logs
  - system/ - System state information
  - ics/ - ICS/SCADA-specific data
- reports/ - Directory for your analysis reports
- tools/ - Directory for analysis tools

Challenge 1: Triage and Collect Artifacts
1. Review the incident alert and facility documentation
2. Examine pre-collected evidence
3. Analyze logs to identify suspicious activity
4. Document your initial findings

Useful Commands:
- grep - Search for patterns in text files
  Example: grep "LOGIN FAILURE" evidence/logs/historian_logs.txt
  
- awk - Process and analyze text data
  Example: awk -F, '$3=="172.31.37.30" {print $0}' evidence/network/connections.csv
  
- sort - Sort lines in text files
  Example: sort -k1,1 evidence/ics/plc_commands.txt

- uniq - Report or filter out repeated lines
  Example: cut -d, -f2 evidence/network/connections.csv | sort | uniq -c

Good luck with your investigation!
