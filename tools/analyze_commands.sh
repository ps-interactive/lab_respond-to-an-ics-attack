#!/bin/bash
# Simple script to analyze PLC commands

echo "PLC Command Analysis"
echo "===================="

echo -e "\nWrite operations to critical registers:"
grep "WRITE_REGISTER" ../evidence/ics/plc_commands.txt

echo -e "\nOperations by source IP:"
awk -F, '{print $2}' ../evidence/ics/plc_commands.txt | sort | uniq -c

echo -e "\nHistory of register 4034 (SAFETY_OVERRIDE):"
grep "4034" ../evidence/ics/plc_commands.txt
