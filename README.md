# Multi stage builds

For å få mest nytte av et multi stage build, er det viktig å først være kjent med hvilke base imager man burde velge.
Alle Docker images bygges basert på et base image. Det vil si imaget man refererer til etter `FROM` kommandoen i Dockerfilen.
Forskjellen i image størrelse kan være veldig stor avhengig av hvilket base image man bruker.

### Demo
[Dockerfile-start](Dockerfile-start) er et eksempel på en helt enkel Dockerfile for en node applikasjon som gjerne brukes som eksempel i den del Docker tutorials. Det resulterende imaget vil fungere helt fint og kjøre applikasjonen som forventet, men det er mulig å gjøre noen enkle grep for å gjøre imaget mindre og mer sikkert.

Start med å bygge og inspisere imaget som bygges ved å kjøre:
```
$ docker build -t workshop-start -f Dockerfile.start create-react-app
$ docker image ls workshop-start
```

Som man ser av outputen ender man opp med et image som er 1.23GB stort. Uten noen sammenligning har man kanskje ikke noe forhold til det, så la oss se om det kan gjøres mindre.

<details>
<summary>Iterasjon 1: Velg et mindre base image og spesifiser versjonsnummeret for å få determinitiske bygg</summary>
Man vil alltid unngå å komme i en situasjon hvor noe ikke lenger fungerer og man ender i situasjonen hvor "Jammen, det fungerte i går og vi har ikke endret noe". Derfor på samme måte som man låser versjonen på dependencies man har i koden, låser man også versjonen i base imagene man bruker.
</details>

<details>
<summary>Iterasjon 2: Multi stage build</summary>
Motivasjonen bak å ha multi stage builds er at det er forskjell på build og run dependencies. Build dependencies inneholder gjerne mange biblioteker man ikke trenger for å kjøre applikasjonen. Det er derfor ingen grunn til å ha de med i det endelige imaget.
</details>

Ved å inspisere det endelige imaget ved å kun ta med nødvendige runtime dependencies og velge et minimalt base imaget ender vi opp med et image på rundt 174MB