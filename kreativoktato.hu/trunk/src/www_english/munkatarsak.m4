_LAYOUT(`munkatarsak_en.m4')
_2_HEAD(_TITLE(`EKO - Our colleagues'))
_2_BODY(
  m4_esyscmd(`scripts/tagok.sh nevjegy en')
  <div id="main">
  `m4_esyscmd(`scripts/tagok.sh bemutatkozas en')'
  </div>
)
