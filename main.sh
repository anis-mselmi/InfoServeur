set -o errexit
set -o nounset
set -o pipefail

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$BASE_DIR/utils.sh"
source "$BASE_DIR/system.sh"
source "$BASE_DIR/modules/cpu.sh"
source "$BASE_DIR/modules/memory.sh"
source "$BASE_DIR/modules/disk.sh"
source "$BASE_DIR/modules/network.sh"

main() {
  init_colors
  clear_screen
  print_header "System Information Dashboard"

  print_section "System"
  print_row "Hostname" "$(get_hostname)"
  print_row "Current User" "$(get_current_user)"
  print_row "Operating System" "$(get_os)"
  print_row "Kernel Version" "$(get_kernel)"
  print_row "Uptime" "$(get_uptime)"
  print_row "Date and Time" "$(get_datetime)"
  print_section_end

  print_section "CPU"
  print_row "CPU Model" "$(get_cpu_model)"
  print_row "CPU Usage" "$(get_cpu_usage)%"
  print_section_end

  print_section "Memory"
  print_row "Total RAM" "$(get_total_ram)"
  print_row "Used RAM" "$(get_used_ram)"
  print_row "RAM Usage" "$(get_ram_usage)%"
  print_section_end

  print_section "Disk"
  print_row "Total Disk Space" "$(get_total_disk)"
  print_row "Used Disk Space" "$(get_used_disk)"
  print_row "Available Disk Space" "$(get_available_disk)"
  print_row "Disk Usage" "$(get_disk_usage)%"
  print_section_end

  print_section "Network"
  print_row "Local IP Address" "$(get_local_ip)"
  print_row "Public IP Address" "$(get_public_ip)"
  print_section_end
}

main "$@"
