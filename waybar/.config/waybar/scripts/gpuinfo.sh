#!/usr/bin/env bash

gpu_type="nvidia"

if [[ "$gpu_type" == "nvidia" && $(command -v nvidia-smi) ]]; then
  data=$(nvidia-smi --query-gpu=temperature.gpu,utilization.gpu --format=csv,noheader,nounits)
  IFS=',' read -ra vals <<< "$data"
  temp=${vals[0]// /}
  util=${vals[1]// /}
  icon=""
  color="#FFA500"
  echo "{\"text\":\"$icon ${temp}°C\", \"tooltip\":\"NVIDIA GPU\nTemp: $temp°C\nUtil: $util%\", \"class\":\"gpu\"}"
  exit 0
fi

if command -v sensors &> /dev/null; then
  temp=$(sensors | grep -m 1 -E 'edge|Package id' | awk '{print int($2)}')
  icon=""
  echo "{\"text\":\"$icon ${temp}°C\", \"tooltip\":\"CPU Temp: ${temp}°C\", \"class\":\"gpu\"}"
  exit 0
fi

echo '{"text":"󰇚", "tooltip":"No GPU data"}'
