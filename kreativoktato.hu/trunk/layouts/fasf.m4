m4_divert(-1)m4_dnl
_INCL(`base.m4')m4_dnl
_2_HEAD(
  _CSS(STATIC`/css/fasf.css')
)
m4_define(`fasflogo',`<a href="/"><img src="STATIC/pict/projects/fasf_logo.png" alt="FASF logo" class="fasf_logo"></a>')
m4_define(`fasftitle',`<h1>$1</h1>')
m4_define(`_menuitem',
`<div class="menuitem $1">
  <a href="$3">$2</a>
</div>')
m4_define(`_menubar',m4_dnl
`<div id="menubar">
  _menuitem(m4_ifelse($1,1,active,inactive),`NEWS',`fasf_news.html')
  _menuitem(m4_ifelse($1,2,active,inactive),`ABOUT US',`fasf_description.html')
  _menuitem(m4_ifelse($1,3,active,inactive),`FAST FASHION',`fasf_digguide.html')
  _menuitem(m4_ifelse($1,4,active,inactive),`COMPETITION',`fasf_competition.html')
  _menuitem(m4_ifelse($1,5,active,inactive),`CONSORTIUM',`fasf_consortium.html')
  _menuitem(m4_ifelse($1,6,active,inactive),`CONTACT US',`fasf_contact.html')
</div>')
m4_define(`FASFPICT',`STATIC/pict/projects/fasf')
_2_BODY(
<div id='topmenu'>
_HREF(`https://www.facebook.com/fastartslowfashion',`<img src=STATIC/pict/projects/fasf_icon_facebook.png>')
_HREF(`https://www.youtube.com/channel/UCy_1JiVslee1ZgZB7gV3JYw',`<img src=STATIC/pict/projects/fasf_icon_youtube.png>')
_HREF(`https://www.linkedin.com/company/fasf-fast-art-slow-fashion',`<img src=STATIC/pict/projects/fasf_icon_linkedin.png>')
_HREF(`https://www.instagram.com/fastartslowfashion/',`<img src="STATIC/pict/projects/fasf_icon_instagram.png" alt="Instagram," class="soclogo">')
</div>
<div id='logo'>fasflogo</div>
)
_LAYOUT_POST(
<div><img src="STATIC/pict/projects/fasf_eu_logo.jpg" alt="FASF EU logo" id="fasfeulogo"></div>)
