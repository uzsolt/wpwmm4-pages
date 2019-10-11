_INCL(`base.m4')
_LAYOUT(`munkatarsak.m4')
_2_HEAD(_TITLE(`EKO - Munkatársaink'))
_2_BODY(
  m4_esyscmd(`scripts/tagok.sh nevjegy')
  <div id="main">
  m4_esyscmd(`scripts/tagok.sh bemutatkozas')
  </div>
)
