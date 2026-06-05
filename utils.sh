init_colors() {
  RESET='\033[0m'
  BOLD='\033[1m'
  BLUE='\033[34m'
  CYAN='\033[36m'
  GREEN='\033[32m'
  YELLOW='\033[33m'
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
  echo -e "${CYAN}${BOLD}===== $1 =====${RESET}"
  echo
}

print_section() {
  echo -e "${BLUE}${BOLD}--- $1 ---${RESET}"
}

print_row() {
  echo -e "${YELLOW}$1:${RESET} ${GREEN}$2${RESET}"
}

print_section_end() {
  echo
}
