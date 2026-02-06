#!/bin/bash

die() {
    echo "$*" >&2
    exit 1
}

[[ $# -eq 1 ]] || die "1 argument required, $# provided"

log_file=$1


# Top 5 IP addresses with the most requests
echo ----Top 5 IP addresses with the most requests----
awk '{count[$1]++;} END { for (ip in count) printf "%-40s %s requests\n", ip, count[ip] }' $log_file | sort -r -n -k2,2 | head -n 5
echo

# Top 5 most requested paths
echo ----Top 5 most requested paths----
awk -F'"' '{
    path = $2
    sub(/^(GET|POST|PUT|DELETE|HEAD|OPTIONS|PATCH) /, "", path)
    sub(/ HTTP\/[0-9.]+$/, "", path)
    count[path]++
} END { 
    for (path in count) 
        printf "%s %-40s %s requests\n", count[path], path, count[path]
}' $log_file | sort -r -n -k1,1 | head -n 5 | cut -d' ' -f2-
echo

# Top 5 response status codes
echo ----Top 5 response status codes----
grep -o '"[^"]*" [0-9][0-9]*' $log_file | awk '{count[$NF]++;} END { for (code in count) printf "%-40s %s requests\n", code, count[code] }' | sort -r -n -k2,2 | head -n 5
echo

# Top 5 user agents
echo ----Top 5 user agents----
awk -F'"' 'NF >= 6 {count[$6]++;} END { for (agent in count) printf "%s %-125s %s requests\n", count[agent], agent, count[agent] }' $log_file | sort -r -n -k1,1 | head -n 5 | cut -d' ' -f2-
echo

