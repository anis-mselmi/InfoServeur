get_local_ip() {
  if has_command hostname; then
    hostname -I 2>/dev/null | awk '{print $1}'
  else
    missing
  fi
}

get_public_ip() {
  if has_command curl; then
    curl -s --max-time 3 https://api.ipify.org || missing
  elif has_command wget; then
    wget -qO- https://api.ipify.org || missing
  else
    missing
  fi
}
