ystem Monitoring Script

DISK_THRESHOLD=${DISK_THRESHOLD:-80}
MEMORY_THRESHOLD=${MEMORY_THRESHOLD:-80}

LOG_DIR="logs"
LOG_FILE="$LOG_DIR/system_monitor.log"

mkdir -p "$LOG_DIR"

log_message() {
	    echo "$1" | tee -a "$LOG_FILE"
    }

log_message "=================================="
log_message "SYSTEM MONITORING REPORT"
log_message "Date: $(date)"
log_message "=================================="

Disk Monitoring
log_message ""
log_message "Checking Disk Usage..."
df -P -x tmpfs -x devtmpfs | awk 'NR>1 {print $5, $6}' |
while read -r usage mount; do
usage=${usage%\%}

if [ "$usage" -ge "$DISK_THRESHOLD" ]; then
log_message "WARNING: Disk usage on $mount is ${usage}%"
else
log_message "OK: Disk usage on $mount is ${usage}%"
fi
#
done
#
#                                 # Memory Monitor
log_message ""
log_message "Checking Memory Usage..."

MEMORY_USAGE=$(free | awk '/^Mem:/{ 
	if ($2 > 0) printf "%.0f", ($3/$2)*100
                                   }')

if [ "$MEMORY_USAGE" -ge "$MEMORY_THRESHOLD" ]; then
log_message "WARNING: High memory usage: ${MEMORY_USAGE}%"
else
log_message "OK: Memory usage is ${MEMORY_USAGE}%"
fi
#
# # Top CPU Processes
#
log_message ""
log_message "Top 5 CPU Consuming Processes:"
#
ps -eo pid,comm,%cpu --sort=-%cpu |
head -n 6 | tee -a "$LOG_FILE"
#
#                                             # Top Memory Processes
#
log_message ""
log_message "Top 5 Memory Consuming Processes:"
#
ps -eo pid,comm,%mem --sort=-%mem |
head -n 6 | tee -a "$LOG_FILE"
#
log_message ""
log_message "Monitoring Completed Successfully."
log_message "Log saved to: $LOG_FILE"
#
