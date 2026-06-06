init_colors() {
  if [ -t 1 ] && [ -z "${NO_COLOR:-}" ]; then
    RESET='\033[0m'
    BOLD='\033[1m'
    BLUE='\033[34m'
    CYAN='\033[36m'
    GREEN='\033[32m'
    YELLOW='\033[33m'
    RED='\033[31m'
  else
    RESET=''
    BOLD=''
    BLUE=''
    CYAN=''
    GREEN=''
    YELLOW=''
    RED=''
  fi
}

clear_screen() {
  clear 2>/dev/null || true
}

missing() {
  echo "Unavailable"
}

has_command() {
  command -v "$1" >/dev/null 2>&1
}

print_header() {
  printf "%b%b===== %s =====%b\n\n" "$CYAN" "$BOLD" "$1" "$RESET"
}

print_section() {
  printf "%b%b--- %s ---%b\n" "$BLUE" "$BOLD" "$1" "$RESET"
}

print_row() {
  printf "%b%-25s%b %b%s%b\n" "$YELLOW" "$1:" "$RESET" "$GREEN" "$2" "$RESET"
}

print_section_end() {
  printf "\n"
}
