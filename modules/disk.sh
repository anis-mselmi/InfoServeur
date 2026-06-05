disk_field() {
  if has_command df; then
    df -h / 2>/dev/null | awk -v field="$1" 'NR == 2 {print $field}'
  else
    missing
  fi
}

get_total_disk() {
  disk_field 2
}

get_used_disk() {
  disk_field 3
}

get_available_disk() {
  disk_field 4
}

get_disk_usage() {
  if has_command df; then
    df -h / | awk 'NR == 2 {gsub("%", "", $5); print $5}'
  else
    missing
  fi
}
