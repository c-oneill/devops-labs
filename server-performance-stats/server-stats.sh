#!/bin/bash

# Total CPU usage
echo ----Total CPU usage----

top -l 2 | grep -E "^CPU" | tail -1

echo


# Total memory usage (Free vs Used including percentage)
echo ----Total memory usage----

top -l 2 | grep "PhysMem:" | tail -1 | awk '{

  # Process 'used' value
  if ($2 ~ /G$/) {
    gsub(/G/, "", $2)
    used = $2 * 1000  # Convert GB to MB
  } else {
    gsub(/M/, "", $2)
    used = $2
  }
  
  # Process 'unused' value
  if ($6 ~ /G$/) {
    gsub(/G/, "", $6)
    unused = $6 * 1000
  } else {
    gsub(/M/, "", $6)
    unused = $6
  }
  
  total = used + unused
  
  printf "Total: %iMB\nUsed: %iMB (%.1f%%)\nFree: %iMB (%.1f%%)\n", 
    total, used, (used/total)*100, unused, (unused/total)*100
}'

echo


# Total disk usage (Free vs Used including percentage)
echo ----Total disk usage---- 

df -H | awk '$9 == "/" {
	total = $2
	avail = $4
	used = total - avail
	
	printf "Total: %iGB\nUsed: %iGB (%.1f%%)\nFree: %iGB (%.1f%%)\n", 
		total, used, (used/total)*100, avail, (avail/total)*100
}'

echo


# Top 5 processes by CPU usage
echo "----Top 5 processes by CPU (4s sample)----"

top -o -cpu -l 2 -s 4 -n 5 -stats pid,command,cpu,time | tail -6

echo


# Top 5 processes by memory usage
echo ----Top 5 processes by memory usage----

top -o -mem -l 1 -n 5 -stats pid,command,mem | tail -6

echo


# Optional Additional Stats: os version, uptime, load average, 
# logged in users, failed login attempts etc.

echo ----Uptime---- 

uptime

echo

