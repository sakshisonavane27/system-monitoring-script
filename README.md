system Monitoring Script

## Project Overview

A Bash shell script designed to monitor Linux system
resources and generate alerts when predefined thresholds
are reached.

## Technologies Used

- Linux (Ubuntu)
- Bash Scripting
- Git
- GitHub
- Vim Editor

## Features

- Disk usage monitoring
- Memory usage monitoring
- Top 5 CPU-consuming processes
- Top 5 memory-consuming processes
- Warning alerts
- Automatic log generation
- Configurable thresholds

## Default Thresholds

| Resource | Threshold |
|----------|-----------|
| Disk     | 80%       |
| Memory   | 80%       |

Alerts are displayed when usage reaches or exceeds
the configured threshold.

## How to Run

```bash
chmod 755 system-monitor.sh
./system-monitor.sh
```

## Custom Thresholds
```bash
DISK_THRESHOLD=70 MEMORY_THRESHOLD=75 ./system_monitor.sh
```

## Sample Output

```text
Checking Disk Usage...
OK: Disk usage on / is 53%

Checking Memory Usage...
OK: Memory usage is 10%

Monitoring Completed Successfully.
Log saved to: logs/system_monitor.log
```

Sample values are illustrative.



## Author

DevOps Learning Project

