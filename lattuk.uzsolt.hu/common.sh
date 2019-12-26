# $Id$
LISTAFILE=lista.csv
CACHEFILE=cache/film.csv

PORTBEGIN=https://port.hu/adatlap/film/tv/
MAFABBEGIN=https://www.mafab.hu/movies/

# $1 - port azonosító
generate_port_link() {
  printf "%splaceholder/movie-%d" "${PORTBEGIN}" "$1"
}

# $1 - mafab azonosító
generate_mafab_link() {
  printf "%s%d" "${MAFABBEGIN}" "$1"
}
