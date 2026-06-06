get_hostname() {
  hostname 2>/dev/null || echo "${HOSTNAME:-$(cat /etc/hostname 2>/dev/null || missing)}"
}

get_current_user() {
  whoami 2>/dev/null || id -un 2>/dev/null || echo "${USER:-${LOGNAME:-Unavailable}}"
}

get_os() {
  if [[ -r /etc/os-release ]]; then
    awk -F= '/^PRETTY_NAME=/{gsub(/"/, "", $2); print $2}' /etc/os-release
  elif has_command sw_vers; then
    echo "macOS $(sw_vers -productVersion)"
  elif [[ -r /etc/redhat-release ]]; then
    cat /etc/redhat-release
  elif [[ -r /etc/issue ]]; then
    head -n1 /etc/issue | cut -d' ' -f1-3
  else
    uname -s 2>/dev/null || missing
  fi
}

get_kernel() {
  uname -r 2>/dev/null || missing
}

get_uptime() {
  if uptime -p >/dev/null 2>&1; then
    uptime -p
  elif [[ -f /proc/uptime ]]; then
    local uptime_sec
    uptime_sec=$(cut -d. -f1 /proc/uptime)
    local mins=$(( (uptime_sec / 60) % 60 ))
    local hours=$(( (uptime_sec / 3600) % 24 ))
    local days=$(( uptime_sec / 86400 ))
    local uptime_str=""
    [[ $days -gt 0 ]] && uptime_str="${days} days, "
    [[ $hours -gt 0 ]] && uptime_str="${uptime_str}${hours} hours, "
    uptime_str="${uptime_str}${mins} minutes"
    echo "$uptime_str"
  else
    local raw_uptime
    raw_uptime=$(uptime 2>/dev/null)
    if [[ -n "$raw_uptime" ]]; then
      echo "$raw_uptime" | awk -F'up ' '{print $2}' | awk -F',' '{print $1}'
    else
      missing
    fi
  fi
}

get_datetime() {
  date '+%Y-%m-%d %H:%M:%S' 2>/dev/null || missing
}
