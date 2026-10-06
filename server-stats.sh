#!/bin/bash

echo "========================================"
echo "       SERVER PERFORMANCE STATS"
echo "========================================"

echo ""
echo "Memory Usage"
echo "------------"

memory_total=$(free | awk '/Mem:/ {print $2}')
memory_used=$(free | awk '/Mem:/ {print $3}')
memory_free=$(free | awk '/Mem:/ {print $4}')

echo "Total: $memory_total KB"
echo "Used: $memory_used KB"
echo "Free: $memory_free KB"

echo ""
echo "Memory Usage"
echo "------------"

disk_size=$(df -h / | awk 'NR==2 {print $2}')
disk_used=$(df -h /| awk 'NR==2 {print $3}')
disk_avail=$(df -h /| awk 'NR==2 {print $4}')
echo "Size:$disk_size G"
echo "Used: $disk_used M"
echo "Free: $disk_avail G"

echo ""
echo "Top 5 Processes by CPU Usage"
echo "-----------------------------"

ps -eo pid,pcpu,pmem,comm --sort=-pcpu | head -n 6