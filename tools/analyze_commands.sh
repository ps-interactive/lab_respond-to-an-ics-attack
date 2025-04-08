!/bin/bash
# Self-adjusting script path

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DATA_FILE="$SCRIPT_DIR/../evidence/ics/plc_commands.txt"

echo "PLC Command Analysis"
echo "===================="

echo -e "\nWrite operations to critical registers:"
grep "WRITE_REGISTER" "$DATA_FILE"

echo -e "\nOperations by source IP:"
awk -F, '{print $2}' "$DATA_FILE" | sort | uniq -c

echo -e "\nHistory of register 4034 (SAFETY_OVERRIDE):"
grep "4034" "$DATA_FILE"
