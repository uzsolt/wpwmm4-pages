#!/bin/sh

. "scripts/function.sh"

if [ "$1" = "en" ]; then
  STR_JELLEMZO="Criteria"
  STR_MIREJO="What is it good for?"
  STR_FELADATLAP="You can create tests."
  STR_VERSENY="You can create tests (competitions)."
  STR_REGISZTRACIO="Registration"
  STR_GMAIL="You can use it with Gmail account"
  STR_INGYEN="Free"
  STR_KEZELO="Dashboard"
  STR_EGYSZERU="Easy"
  STR_EGYSZERU_INTER="Easy and interactive"
  STR_BONYOLULT="Complicated"
  STR_MAGYARUL="Available in hungarian"
  STR_IGEN="yes"
  STR_NEM="no"
  STR_KERDESTIPUSOK="Types of questions"
  STR_EGYSZERU="simple choice questions"
  STR_TOBBHELYES="multiple-choice questions"
  STR_IGAZHAMIS="true or false"
  STR_SKALA="range"
  STR_SZOVEGES="essay"
  STR_KEP="insert images"
  STR_KITOLTO="How can the user use the platform?"
  STR_LINK="Link is necessary"
  STR_ID_OPT="the identification is optional"
  STR_ID_KOTELEZO="identification (name and/or email address is compulsory)"
  STR_PIN_KOTELEZO="PIN is necessary"
  STR_HANYAN="How many user can use it?"
  STR_KORLATLAN="unlimited"
  STR_HAVI_SZAZ="It is free up to 100 filling"
  STR_IDOKORLAT="Is there a timeframe?"
  STR_NINCS="No"
  STR_KERDESENKENT="It can be set per questions"
  STR_TANARI="Is teacher control necessary?"
  STR_ONALLOAN="No, it can be used independently"
  STR_OSSZPONTSZAM="Is the total score available at the end of the test?"
  STR_RESZEREDMENY="it shows the fastest users after each questions too"
else
  STR_JELLEMZO="Jellemző"
  STR_MIREJO="Mire jó?"
  STR_FELADATLAP="Feladatlapok létrehozására"
  STR_VERSENY="Tesztek (versenyek) létrehozására"
  STR_REGISZTRACIO="Regisztráció"
  STR_GMAIL="GMail fiókkal"
  STR_INGYEN="ingyenes"
  STR_KEZELO="Kezelőfelület"
  STR_EGYSZERU="egyszerű"
  STR_EGYSZERU_INTER="egyszerű és interaktív"
  STR_BONYOLULT="bonyolult"
  STR_MAGYARUL="Magyarul elérhető"
  STR_IGEN="igen"
  STR_NEM="nem"
  STR_KERDESTIPUSOK="Kérdés típusok"
  STR_EGYSZERU="egyszerű választásos"
  STR_TOBBHELYES="több helyes válasz"
  STR_IGAZHAMIS="igaz-hamis"
  STR_SKALA="skála"
  STR_SZOVEGES="szöveges választ igénylő"
  STR_KEP="kép beszúrás"
  STR_KITOLTO="Hogyan használhatja a kitöltő"
  STR_LINK="link birtokában"
  STR_ID_OPT="az azonosítás opcionális"
  STR_ID_KOTELEZO="azonosítás (név és/vagy email cím) kötelező"
  STR_PIN_KOTELEZO="PIN-kód birtokában"
  STR_HANYAN="Hányan használhatják?"
  STR_KORLATLAN="korlátlan"
  STR_HAVI_SZAZ="havi 100 kitöltésig ingyenes"
  STR_IDOKORLAT="Van-e időkorlát?"
  STR_NINCS="nincs"
  STR_KERDESENKENT="kérdésenként beállítható"
  STR_TANARI="Szükséges-e tanári irányítás?"
  STR_ONALLOAN="nem, önállóan is használható"
  STR_OSSZPONTSZAM="Van-e összpontszám?"
  STR_RESZEREDMENY="minden kérdés után is összesíti a leggyorsabb játékosokat"
fi

CLASS_COLHEAD="colhead"
CLASS_GOOD="good"
CLASS_BAD="bad"

divtable_begin

divtable_row_heading \
  "${STR_JELLEMZO}" "" \
  "_HREF(\`https://docs.google.com/forms/d/e/1FAIpQLSe28J_7pQOzps9kxLI1PFkn5hEzvQTgul5L06HQgSFzoiBJ7A/viewform',\`Google Forms')" "" \
  "_HREF(\`https://app.involve.me/association-for-creative-education/new-project-2444',\`Involve.me')" "" \
  "_HREF(\`https://www.classmarker.com/online-test/start/?quiz=mb65e41762c772d0',\`Classmarker')" "" \
  "_HREF(\`https://www.fyrebox.com/play/what-do-you-know-about-sd_2pPxrBBB5',\`Fyrebox')" "" \
  "_HREF(\`https://play.kahoot.it/v2/?quizId=0050b90c-1011-4a15-ab85-849c73b10053',\`Kahoot!')" ""

divtable_row \
  "${STR_MIREJO}" "${CLASS_COLHEAD}" \
  "${STR_FELADATLAP}" "" \
  "${STR_FELADATLAP}" "" \
  "${STR_FELADATLAP}" "" \
  "${STR_FELADATLAP}" "" \
  "${STR_VERSENY}" ""
divtable_row \
  "${STR_REGISZTRACIO}" "${CLASS_COLHEAD}" \
  "${STR_GMAIL}" "" \
  "${STR_INGYEN}" "${CLASS_GOOD}" \
  "${STR_INGYEN}" "${CLASS_GOOD}" \
  "${STR_GMAIL}" "" \
  "${STR_GMAIL}" ""
divtable_row \
  "${STR_KEZELO}" "${CLASS_COLHEAD}" \
  "${STR_EGYSZERU}" "${CLASS_GOOD}" \
  "${STR_EGYSZERU_INTER}" "${CLASS_GOOD}" \
  "${STR_BONYOLULT}" "${CLASS_BAD}" \
  "${STR_EGYSZERU_INTER}" "${CLASS_GOOD}" \
  "${STR_EGYSZERU}" "${CLASS_GOOD}"
divtable_row \
  "${STR_MAGYARUL}" "${CLASS_COLHEAD}" \
  "${STR_IGEN}" "${CLASS_GOOD}" \
  "${STR_NEM}" "${CLASS_BAD}" \
  "${STR_NEM}" "${CLASS_BAD}" \
  "${STR_IGEN}" "${CLASS_GOOD}" \
  "${STR_NEM}" "${CLASS_BAD}"
divtable_row \
  "${STR_KERDESTIPUSOK}" "${CLASS_COLHEAD}" \
  "" "" \
  "" "" \
  "" "" \
  "" "" \
  "" ""
divtable_row \
  "${STR_EGYSZERU}" "" \
  "${STR_IGEN}" "${CLASS_GOOD}" \
  "${STR_IGEN}" "${CLASS_GOOD}" \
  "${STR_IGEN}" "${CLASS_GOOD}" \
  "${STR_IGEN}" "${CLASS_GOOD}" \
  "${STR_IGEN}" "${CLASS_GOOD}"
divtable_row \
  "${STR_IGAZHAMIS}" "" \
  "${STR_NEM}" "${CLASS_BAD}" \
  "${STR_NEM}" "${CLASS_BAD}" \
  "${STR_IGEN}" "${CLASS_GOOD}" \
  "${STR_IGEN}" "${CLASS_GOOD}" \
  "${STR_NEM}" "${CLASS_BAD}"
divtable_row \
  "${STR_TOBBHELYES}" "" \
  "${STR_IGEN}" "${CLASS_GOOD}" \
  "${STR_NEM}" "${CLASS_BAD}" \
  "${STR_IGEN}" "${CLASS_GOOD}" \
  "${STR_IGEN}" "${CLASS_GOOD}" \
  "${STR_NEM}" "${CLASS_BAD}"
divtable_row \
  "${STR_SKALA}" "" \
  "${STR_NEM}" "${CLASS_BAD}" \
  "${STR_IGEN}" "${CLASS_GOOD}" \
  "${STR_NEM}" "${CLASS_BAD}" \
  "${STR_NEM}" "${CLASS_BAD}" \
  "${STR_NEM}" "${CLASS_BAD}"
divtable_row \
  "${STR_SZOVEGES}" "" \
  "${STR_NEM}" "${CLASS_BAD}" \
  "${STR_IGEN}" "${CLASS_GOOD}" \
  "${STR_NEM}" "${CLASS_BAD}" \
  "${STR_NEM}" "${CLASS_BAD}" \
  "${STR_NEM}" "${CLASS_BAD}"
divtable_row \
  "${STR_KEP}" "" \
  "${STR_NEM}" "${CLASS_BAD}" \
  "${STR_IGEN}" "${CLASS_GOOD}" \
  "${STR_NEM}" "${CLASS_BAD}" \
  "${STR_NEM}" "${CLASS_BAD}" \
  "${STR_NEM}" "${CLASS_BAD}"
divtable_row \
  "${STR_KITOLTO}" "${CLASS_COLHEAD}" \
  "${STR_LINK}, ${STR_ID_OPT}" "${CLASS_GOOD}" \
  "${STR_LINK}" "" \
  "${STR_LINK}, ${STR_ID_KOTELEZO}" "${CLASS_BAD}" \
  "${STR_LINK}" "" \
  "${STR_PIN_KOTELEZO}" ""
divtable_row \
  "${STR_HANYAN}" "${CLASS_COLHEAD}" \
  "${STR_KORLATLAN}" "${CLASS_GOOD}" \
  "${STR_KORLATLAN}" "${CLASS_GOOD}" \
  "${STR_HAVI_SZAZ}" "${CLASS_BAD}" \
  "${STR_KORLATLAN}" "${CLASS_GOOD}" \
  "${STR_KORLATLAN}" "${CLASS_GOOD}"
divtable_row \
  "${STR_IDOKORLAT}" "${CLASS_COLHEAD}" \
  "${STR_NINCS}" "${CLASS_BAD}" \
  "${STR_NINCS}" "${CLASS_BAD}" \
  "${STR_NINCS}" "${CLASS_BAD}" \
  "${STR_NINCS}" "${CLASS_BAD}" \
  "${STR_KERDESENKENT}" "${CLASS_GOOD}"
divtable_row \
  "${STR_TANARI}" "${CLASS_COLHEAD}" \
  "${STR_ONALLOAN}" "${CLASS_GOOD}" \
  "${STR_ONALLOAN}" "${CLASS_GOOD}" \
  "${STR_ONALLOAN}" "${CLASS_GOOD}" \
  "${STR_ONALLOAN}" "${CLASS_GOOD}" \
  "${STR_IGEN}" ""
divtable_row \
  "${STR_OSSZPONTSZAM}" "${CLASS_COLHEAD}" \
  "${STR_IGEN}" "${CLASS_GOOD}" \
  "${STR_NEM}" "${CLASS_BAD}" \
  "${STR_IGEN}" "${CLASS_GOOD}" \
  "${STR_NEM}" "${CLASS_BAD}" \
  "${STR_IGEN} (${STR_RESZEREDMENY})" "${CLASS_GOOD}"

divtable_end
