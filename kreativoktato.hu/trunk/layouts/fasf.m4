m4_divert(-1)m4_dnl
_INCL(`base.m4')m4_dnl
_INCL(`base_hu.m4')m4_dnl
_LAYOUT_PRE(`<div id="fasf">')
m4_define(`fasflogo',`<img src="STATIC/pict/projects/fasf_logo.png" alt="FASF logo" class="titlelogo">')
m4_define(`fasftitle',`<h1>$1 fasflogo</h1>')
m4_define(`imi',m4_dnl
`<a href="$4"><div class="iconmenuitem imi$5">
  <div class="iconmenuitem_icon"><img src="$1" alt="$2"></div>
  <div class="iconmenuitem_text">$3</div>
</div></a>')m4_dnl
m4_define(`imiall',m4_dnl
`<div class="iconmenu">
  imi(`STATIC/pict/projects/fasf_icon_news.png',`News',`News',
  `fasf_news.html',a)
  imi(`STATIC/pict/projects/fasf_icon_description.png',`Description',
  `Description',`fasf_description.html',b)
  imi(`STATIC/pict/projects/fasf_icon_digitalguide.png',`Digital guide',
  `Digital guide',`fasf_digguide.html',a)
  imi(`STATIC/pict/projects/fasf_icon_competition.png',`Competition',
  `Competition',`fasf_competition.html',b)
  imi(`STATIC/pict/projects/fasf_icon_contact.png',`Contact',`Contact',
  `fasf_contact.html',a)
</div>')
_LAYOUT_POST(
<p><img src="STATIC/pict/projects/fasf_eu_logo.jpg" alt="FASF EU logo" class="projectwidelogo"></p>
`</div>'
eko_footer)
