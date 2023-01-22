# Kjør applikasjonen med en non-root bruker
Prinsippet om least privilege gjelder også i containere. For containere er det viktig at tilgangen, spesielt mot Docker hosten er minimal for å unngå privilege escalation.  
Det er i praksis enkelt å gjøre, men krever at man har kontroll på nøyaktig hva applikasjonen trenger tilgang til.  
Når det gjelder sikkerhet er det best å linke til de som kan det.. Her er noen linker om fallgruver og sikkerhetsutfordringer rundt Docker containere:
* https://docs.docker.com/engine/security/#docker-daemon-attack-surface
* https://www.redhat.com/en/blog/understanding-root-inside-and-outside-container
* https://snyk.io/blog/10-docker-image-security-best-practices/