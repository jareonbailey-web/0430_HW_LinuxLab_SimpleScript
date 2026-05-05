#!/usr/bin/env bash
# =============================================================================
# r i n g s . s h
# A script inspired by Aesop Rock's "Rings" — themes of memory, growth,
# the slow accumulation of years, and reading the record inside yourself.
# =============================================================================

# ── Colors & Styles ──────────────────────────────────────────────────────────
RESET='\033[0m'
BOLD='\033[1m'
DIM='\033[2m'
ITALIC='\033[3m'

BARK='\033[38;5;130m' # woody brown
RING='\033[38;5;178m' # amber/gold
CANOPY='\033[38;5;28m' # deep forest green
HOLLOW='\033[38;5;240m' # grey ash
SKY='\033[38;5;75m' # muted blue
SCAR='\033[38;5;196m' # red — the hard years
PULSE='\033[38;5;229m' # near-white glow

# ── Helpers ───────────────────────────────────────────────────────────────────
slow_print() {
    local text="$1"
    local delay="${2:-0.03}"
    while IFS= read -r -n1 char; do
        printf "%s" "$char"
        sleep "$delay"
    done <<< "$text"
    echo
}

pause() { sleep "${1:-1}"; }

center() {
    local text="$1"
    local width
    width=$(tput cols 2>/dev/null || echo 80)
    local padding=$(( (width - ${#text}) / 2 ))
    printf "%${padding}s%s\n" "" "$text"
}

draw_ring() {
    local year="$1"
    local label="$2"
    local color="$3"
    local width="$4"
    local bar
    bar=$(printf '─%.0s' $(seq 1 "$width"))
    echo -e "${color}${BOLD} ┌${bar}┐${RESET}"
    echo -e "${color}${BOLD} │${RESET} ${ITALIC}${year} — ${label}${RESET} ${color}${BOLD}│${RESET}"
    echo -e "${color}${BOLD} └${bar}┘${RESET}"
}

spinner() {
    local pid=$1
    local msg="$2"
    local frames=('⠋' '⠙' '⠹' '⠸' '⠼' '⠴' '⠦' '⠧' '⠇' '⠏')
    local i=0
    while kill -0 "$pid" 2>/dev/null; do
        printf "\r${HOLLOW} %s %s${RESET}" "${frames[$((i % ${#frames[@]}))]}" "$msg"
        sleep 0.1
        ((i++))
    done
    printf "\r%-60s\r" " "
}

# ── Title Card ────────────────────────────────────────────────────────────────
clear
echo
echo -e "${BARK}${BOLD}"
center "██████╗ ██╗███╗ ██╗ ██████╗ ███████╗"
center "██╔══██╗██║████╗ ██║██╔════╝ ██╔════╝"
center "██████╔╝██║██╔██╗ ██║██║ ███╗███████╗"
center "██╔══██╗██║██║╚██╗██║██║ ██║╚════██║"
center "██║ ██║██║██║ ╚████║╚██████╔╝███████║"
center "╚═╝ ╚═╝╚═╝╚═╝ ╚═══╝ ╚═════╝ ╚══════╝"
echo -e "${RESET}"
echo -e "${HOLLOW}${ITALIC}"
center "count the rings inside the wood"
center "each one a year that held or couldn't"
echo -e "${RESET}"
pause 1.5

# ── Act I: The Tree ───────────────────────────────────────────────────────────
echo
echo -e "${CANOPY}${BOLD} [ ACT I — THE TREE ]${RESET}"
echo -e "${HOLLOW} ─────────────────────────────────────────────────────────${RESET}"
echo
slow_print " Every tree that ever stood had a record buried in its chest." 0.025
pause 0.5
slow_print " Not written. Grown. Pressed into rings by the weight of every season." 0.025
pause 0.5
slow_print " The good years are wide. The hard ones thin as a held breath." 0.025
pause 1

echo
echo -e "${BARK} Counting...${RESET}"
echo

# Animate ring growth
for i in $(seq 1 5); do
    pad=$(printf '%*s' $((i * 3)) '')
    echo -e "${RING}${pad}○${RESET}"
    sleep 0.2
done
for i in $(seq 4 -1 1); do
    pad=$(printf '%*s' $((i * 3)) '')
    echo -e "${BARK}${pad}·${RESET}"
    sleep 0.15
done

pause 1

# ── Act II: The Record ────────────────────────────────────────────────────────
echo
echo -e "${SKY}${BOLD} [ ACT II — THE RECORD ]${RESET}"
echo -e "${HOLLOW} ─────────────────────────────────────────────────────────${RESET}"
echo

slow_print " Cut the cross-section. Hold it to the light." 0.03
slow_print " Here is where it rained for forty days and held." 0.03
slow_print " Here is the summer the beetles came and left their name." 0.03
slow_print " Here is the year something broke near the root." 0.03
echo

pause 0.8

# Render "rings" as timeline
echo -e "${RING}${BOLD} ── ANNUAL RECORD ──────────────────────────────────────────${RESET}"
echo

YEARS=(
    "Y-01:First light, roots still shallow, everything enormous:${CANOPY}:28"
    "Y-04:Drought — the ring is thin, almost a rumor:${SCAR}:20"
    "Y-09:Good rain, something opened up in the canopy above:${RING}:34"
    "Y-13:Fire nearby — scorched the bark but held the core:${SCAR}:24"
    "Y-17:Wide ring. Roots hit water. Everything grew quiet and deep:${CANOPY}:38"
    "Y-22:Storm stripped the crown — regrew slower, different angle:${HOLLOW}:28"
    "Y-28:The best year. You can see it from a hundred feet away:${PULSE}:36"
    "Y-??:Still growing. Ring not yet closed:${SKY}:22"
)

for entry in "${YEARS[@]}"; do
    IFS=':' read -r year label color width <<< "$entry"
    draw_ring "$year" "$label" "${!color}" "$width"
    sleep 0.3
    echo
done

# ── Act III: The Reading ──────────────────────────────────────────────────────
echo
echo -e "${PULSE}${BOLD} [ ACT III — THE READING ]${RESET}"
echo -e "${HOLLOW} ─────────────────────────────────────────────────────────${RESET}"
echo

slow_print " They can read you when you're gone." 0.03
slow_print " Count what you carried. Count what you lost." 0.03
slow_print " The rings don't lie — they just don't explain themselves." 0.03
echo
pause 0.5

# Simulate dendrochronology "scan"
echo -e "${BARK} Initiating core sample analysis...${RESET}"
echo
(sleep 2) &
spinner $! "reading the record"

echo -e "${DIM} ┌──────────────────────────────────────────────────────┐${RESET}"
echo -e "${DIM} │${RESET} ${BOLD}SAMPLE ID :${RESET} $(hostname)-$(whoami)-$(date +%Y) ${DIM}│${RESET}"
echo -e "${DIM} │${RESET} ${BOLD}RINGS :${RESET} $(date +%Y) — $(($(date +%Y) - 1))... ${DIM}│${RESET}"
echo -e "${DIM} │${RESET} ${BOLD}TIMESTAMP :${RESET} $(date '+%A, %B %d %Y — %H:%M') ${DIM}│${RESET}"
echo -e "${DIM} │${RESET} ${BOLD}SYSTEM :${RESET} $(uname -s) / $(uname -m) ${DIM}│${RESET}"
echo -e "${DIM} │${RESET} ${BOLD}UPTIME :${RESET} $(uptime | sed 's/.*up //' | cut -d',' -f1) ${DIM}│${RESET}"
echo -e "${DIM} └──────────────────────────────────────────────────────┘${RESET}"

echo
pause 0.5

# ── Closing ───────────────────────────────────────────────────────────────────
echo
echo -e "${BARK}${BOLD}"
slow_print " The question was never how many." 0.03
slow_print " It was always: what did the wide ones cost?" 0.03
echo -e "${RESET}"
echo
echo -e "${HOLLOW}${ITALIC}"
center "─ rings.sh — a record of something still standing ─"
echo -e "${RESET}"
echo