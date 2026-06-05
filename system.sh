get_hostname() {
  hostname 2>/dev/null || missing
}

get_current_user() {
  whoami 2>/dev/null || echo "${USER:-Unavailable}"
}

get_os() {
  if [[ -r /etc/os-release ]]; then
    awk -F= '/^PRETTY_NAME=/{gsub(/"/, "", $2); print $2}' /etc/os-release
  else
    uname -s 2>/dev/null || missing
  fi
}

get_kernel() {
  uname -r 2>/dev/null || missing
}

get_uptime() {
  uptime -p 2>/dev/null || missing
}

get_datetime() {
  date '+%Y-%m-%d %H:%M:%S' 2>/dev/null || missing
}
