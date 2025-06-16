#!/usr/bin/env bash

model=$(lscpu | awk -F': ' '/Model name/ { gsub(/^ *| CPU.*/, "", $2); print $2 }')
temp=$(sensors 2>/dev/null | grep -m 1 -E "edge|Package id" | awk -F':' '{ print int($2) }')
usage=$(awk -v prev="$(head -1 /proc/stat)" '
  BEGIN {
    split(prev, a); idle1 = a[5]; total1 = 0;
    for (i = 2; i <= 8; i++) total1 += a[i];
    system("sleep 0.1");
    getline < "/proc/stat"; split($0, b); idle2 = b[5]; total2 = 0;
    for (i = 2; i <= 8; i++) total2 += b[i];
    diff_idle = idle2 - idle1;
    diff_total = total2 - total1;
    usage = (diff_total - diff_idle) / diff_total * 100;
    printf("%.1f", usage);
  }')

get_temp_color() {
  case $1 in
    9[0-9]|[1-9][0-9][0-9]) echo "#8b0000" ;; 
    8[0-9]) echo "#d22f2f" ;;
    7[0-9]) echo "#ff471a" ;;
    6[5-9]) echo "#ffa500" ;;
    [4-5][0-9]) echo "#cccccc" ;;
    *) echo "#87ceeb" ;;
  esac
}

color=$(get_temp_color "$temp")

echo "{\"text\":\" <span color='$color'><b>${temp}°C</b></span>\", \"tooltip\":\"$model\\nUsage: ${usage}%\\nTemp: ${temp}°C\"}"
