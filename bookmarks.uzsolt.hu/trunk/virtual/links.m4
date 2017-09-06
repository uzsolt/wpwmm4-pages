m4_divert(-1)
_INCL(header.m4)
_2_BODY(
  <nav>m4_include(`gen/navbar.html')</nav>
  _SCRIPT(list_links.sh _DIRECTORY)
)
_PR_ALL
