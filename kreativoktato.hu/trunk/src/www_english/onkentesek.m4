_LAYOUT(`munkatarsak_en.m4')
_2_HEAD(_TITLE(`EKO - Volunteers'))
_2_BODY(
  m4_esyscmd(`scripts/onkentesek.sh nevjegy en')
  <div id="main">
  `m4_esyscmd(`scripts/onkentesek.sh bemutatkozas en')'
  </div>
)
