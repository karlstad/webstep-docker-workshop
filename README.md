# Image scanning
Image scanning handler hovedsaklig om å scanne direkte og indirekte dependencies i Docker imaget. Det er ikke det samme som statisk kode-analyse, men scanner base imaget og eventuelle dependencies som installeres i Dockerfilen.

Det man for eksempel finner med image scanning er sårbarheter som er avdekket i base image versjoner. Man kan ikke ta for gitt at nye sårbarheter fiskes umiddelbart i mye brukte base imager som f.eks. Debian, Node, Ubuntu osv. En del image scanning verktøy vil også gi oppgraderingsforslag til versjoner hvor gitte sårbarheter er håndtert