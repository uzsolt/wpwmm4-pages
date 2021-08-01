m4_divert(-1)m4_dnl
_INCL(`base.m4')m4_dnl
_INCL(`base_hu.m4')m4_dnl
_LAYOUT_PRE(`<div id="main">')
m4_define(`imi',m4_dnl
`<a href="$4"><div class="iconmenuitem">
  <div class="iconmenuitem_icon"><img src="$1" alt="$2"></div>
  <div class="iconmenuitem_text">$3</div>
</div></a>')m4_dnl
m4_define(`imiall',m4_dnl
`<div class="iconmenu">
  imi(`STATIC/pict/projects/fasf_icon_news.png',`News',`News',
  `fasf_news.html')
  imi(`STATIC/pict/projects/fasf_icon_description.png',`Description',
  `Description',`fasf_description.html')
  imi(`STATIC/pict/projects/fasf_icon_digitalguide.png',`Digital guide',
  `Digital guide',`fasf_digguide.html')
  imi(`STATIC/pict/projects/fasf_icon_competition.png',`Competition',
  `Competition',`fasf_competition.html')
  imi(`STATIC/pict/projects/fasf_icon_contact.png',`Contact',`Contact',
  `fasf_contact.html')
</div>')
_LAYOUT_POST(`</div>'eko_footer)
