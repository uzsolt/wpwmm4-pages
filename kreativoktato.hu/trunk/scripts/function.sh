CLASS_CELL="dcell"
CLASS_ROW="drow"
CLASS_HEAD="dheading"
CLASS_TABLE="dtable"

divtable_begin() {
  printf "<div class='${CLASS_TABLE} $1'>\n"
}

divtable_end() {
  printf "</div>\n"
}

# $1 - cella tartalma
# $2 (opcionális) - további osztályok
divtable_cell() {
  printf "    <div class='${CLASS_CELL} %s'>%s</div>\n" "$2" "$1"
}

# $1 - szükséges osztály
# $2 - opcionális osztályok
# $... - cellák:
#  - első a tartalom
#  - második a plusz osztály
divtable_row_general() {
  printf "  <div class='%s %s'>\n" "$1" "$2"
  shift; shift

  while [ $# -gt 0 ]; do
    divtable_cell "${1}" "${2}"
    shift; shift
  done

  printf "  </div>\n"
}

# $... - cellák tartalmai
#  - első a tartalom
#  - második a plusz osztály
divtable_row() {
  divtable_row_general "${CLASS_ROW}" "" "$@"
}

# $... - cellák tartalmai
#  - első a tartalom
#  - második a plusz osztály
divtable_row_heading() {
  divtable_row_general "${CLASS_HEAD}" "" "$@"
}
