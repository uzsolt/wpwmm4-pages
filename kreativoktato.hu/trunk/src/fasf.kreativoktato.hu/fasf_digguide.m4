_LAYOUT(`fasf.m4')
_2_HEAD(_TITLE(`EKO - Fast Art Slow Fashion - Digital Guide'))
_menubar(3)
m4_define(`imi',m4_dnl
`<a href="$4"><div class="iconmenuitem">
  <div class="iconmenuitem_icon"><img src="$1" alt="$3"></div>
  <div class="iconmenuitem_text">$2</div>
</div></a>')m4_dnl
<div id="iconmenu">
  imi(`FASFPICT/ff_reading.jpg',`Let&apos;s read about fast fashion',`Reading',
  `digguide_reading.html')
  imi(`FASFPICT/ff_watching.jpg',`Interested? Watch our videos!',
  `Interested? Watch our videos!',`digguide_watching.html')
  imi(`FASFPICT/ff_checking.jpg',`Double-check yourself!',
  `Checking',`digguide_check.html')
  imi(`FASFPICT/ff_quiz.jpg',`Let&apos;s see what you learned! Take our quiz!',
  `Quiz',`digguide_quiz.html')
</div>
