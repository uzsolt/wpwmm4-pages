#!/bin/sh

MESSAGE_HU=
DISMISS_HU="Megértettem!"
LINK_HU="Bővebben"

# "background": "#eaf7f7",
create_js() {
  cat << EOF
window.cookieconsent.initialise({
  "palette": {
      "popup": {
        "background": "#333",
        "text": "#aaa"
      },
      "button": {
        "background": "#56cbdb",
        "text": "#ffffff"
      }
  },
  "theme": "edgeless",
  "position": "bottom-right",
  "content": {
    "message": "$1",
    "dismiss": "$2",
    "link": "$3",
  }
});
EOF
}

create_js \
  "Az oldalon történő látogatása során cookie-kat (sütiket) használunk. Ezen fájlok információkat szolgáltatnak számunkra a felhasználó oldallátogatási szokásairól, de nem tárolnak személyes információkat." \
  "Megértettem!" \
  "Bővebben" > ${1}/js/cookie_hu.js

create_js \
  "This website uses cookies. These files provide us with information on the visitors' website browsing habits but do not keep their personal data." \
  "Accept" \
  "More" > ${1}/js/cookie_en.js
