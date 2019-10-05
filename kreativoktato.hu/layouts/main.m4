m4_divert(-1)
m4_define(`LANG',`hu')
_2_HEAD(
  _CHARSET(`utf-8')
  _CSS(`/css/eko.css')
  <link rel='shortcut icon' type="image/ico" href="/pict/favicon.ico"/>
)
_2_BODY(_SCRIPT(`menu.sh' m4_ifdef(`CATEGORY',CATEGORY,_FILE)))m4_dnl
_2_BODY(m4_ifdef(`_outside_maindiv',`_outside_maindiv'))m4_dnl
_LAYOUT_PRE(`<div id="main">')
_LAYOUT_POST(`</div>')
