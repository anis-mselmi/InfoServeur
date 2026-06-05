get_cpu_model() {
  if [[ -r /proc/cpuinfo ]]; then
    awk -F: '/model name/{gsub(/^ /, "", $2); print $2; exit}' /proc/cpuinfo
  else
    missing
  fi
}

get_cpu_usage() {
  if [[ ! -r /proc/stat ]]; then
    missing
    return
  fi

  awk '/^cpu / {print int(($2+$4) * 100 / ($2+$3+$4+$5))}' /proc/stat
}
