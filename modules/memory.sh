get_total_ram() {
  if has_command free; then
    free -h | awk '/^Mem:/ {print $2}'
  else
    missing
  fi
}

get_used_ram() {
  if has_command free; then
    free -h | awk '/^Mem:/ {print $3}'
  else
    missing
  fi
}

get_ram_usage() {
  if has_command free; then
    free | awk '/^Mem:/ {print int($3 * 100 / $2)}'
  else
    missing
  fi
}
