_LAYOUT(`munkatarsak.m4')
_2_HEAD(_TITLE(`EKO - Önkéntesek'))
_2_BODY(
  m4_esyscmd(`scripts/onkentesek.sh nevjegy')
  <div id="main">
  `m4_esyscmd(`scripts/onkentesek.sh bemutatkozas')'
  </div>
)
