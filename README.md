## 1a
Her må følgende secrets være konfiguret for å kunne kjøre github actions: 
- AWS_ACCESS_KEY_ID
- AWS_SECRET_ACCESS_KEY

etter mye surr, fordi jeg klarte å skrive Environment feil i template.yaml, klarte jeg etterhvert å få den til å kjøre:
![image](https://github.com/Matsjohaa/Devops-Exam/assets/97464729/0b01fe14-b893-4ae5-9ea4-15bb0f125d60)

## 1b
```
FROM python:3.9
WORKDIR /app
COPY . .
RUN pip install -r requirements.txt
CMD ["python3","./app.py"]
````

![image](https://github.com/Matsjohaa/Devops-Exam/assets/97464729/92b7599e-49d8-44cb-9c2d-902e74752ed9)
![image](https://github.com/Matsjohaa/Devops-Exam/assets/97464729/0fb1d50e-1261-458d-a234-759dcf87f5f9)



## 2a

![image](https://github.com/Matsjohaa/Devops-Exam/assets/97464729/ceca8e16-b139-412f-91ff-b22d0942cb2e)

![image](https://github.com/Matsjohaa/Devops-Exam/assets/97464729/9326e817-2ba8-40f0-9a8a-7642546372d9)

## 2b
![image](https://github.com/Matsjohaa/Devops-Exam/assets/97464729/51bf8897-cb53-40c6-a967-0bff618d9a98)
og den nyeste pushen får taggen "Latest":
![image](https://github.com/Matsjohaa/Devops-Exam/assets/97464729/053d2e5c-20d8-4053-bab0-cc708d919dd3)


todo: fikse så tag macther commit

## 3a
satt opp følgende variabler:
```
variable "service_name" {
    description = "Name of AppRunner service"
    type = string
}

variable "aws_iam_policy"{
    description = "IAM policy name"
    type = string
}

variable "aws_apprunner_role"{
    description = "iam role name"
    type = string
}

variable "ecr_repo"{
    description = "url to ecr_repo"
    type = string
}
```

satt opp følgende for å prøve å endre cpu og memory konfigurasjonen, men hadde problemer med å kjøre terraform apply på oppgave 3b, så endte opp med å måtte kommentere det ut.
```
instance_configuration {
    instance_role_arn = aws_iam_role.role_for_apprunner_service.arn
    #cpu = 256
    #memory = 1024
  }
```

## 3b
konfigurer variabel-verdier her:
```
export TF_VAR_service_name=apprunner_2018
        export TF_VAR_ecr_repo=244530008913.dkr.ecr.eu-west-1.amazonaws.com/kandidat2018
        export TF_VAR_aws_apprunner_role=2018_iam_role
        export TF_VAR_aws_iam_policy=2018_iam_policy
```
lot være å sette default verdier i variables.tf, så dersom man kjører terraform apply, kan man sette inn sine egene verdier.

Ikke de beste commit meldingene akkurat, men her fikk jeg workflow filen til å kjøre:
![image](https://github.com/Matsjohaa/Devops-Exam/assets/97464729/16adda43-c9d3-460f-a085-a720ab3992e2)

og her man at apprunner servicen er oppe å kjører:
![image](https://github.com/Matsjohaa/Devops-Exam/assets/97464729/89f6b791-fcf4-4295-978c-0463550195b5)



## 5a

Kontinuerlig intergrasjon(ci) er praktisen innen utvikling hvor utviklere kan integrere kodenendringer til et repository gjennom en versjonskontroll, vanligvis git.
På denne måten kan man kontinuerlig integrere og test koden hver gang det blir gjort endringer gjennom automatiserte verktøy.

<strong>Fordeler ved bruk av ci:</strong>
Rask feiloppdagelse:
ved bruk av CI vil feil og problemer oppdages tidligere automatisk. Da oppdager man også om det funker på en annen maskin enn sin egen.
Økt produktivitet:
Siden CI tar seg å automatisere bygging testing, og deployment, vil utviklere ha mulighet til å fokusere arbeidet sitt på andre ting.
På denne måten vil også ny funksjonalitet også bli levert raskere.

<strong>Hvordan jobber man med CI i praksis?</strong>
I et github repo er CI ofte tilknyttet bruket av GitHub actions, som kan foreksempel hete ".github/workflows/deploy_ecr.yml".
Deretter, kan utviklere jobbe parallelt på forkjellige grener, og hver gang det blir gjort et push til repoet, vil CI-workflowen automatisk kjøres
og sikre at det ikke ødelegger eksiterende funksjonalitet.

## 5b
<strong>SCRUM/smidig</strong>
SCRUM er en smidig metodikk for utviklere. Den baserer seg på korte sprinter, en til noen uker langer, hvor alle har utdelt sin oppgave som de skal få undagjort innen sprinten er over.
Flere ganger i løpet av sprinten, har man møter hvor man snakker om det man har gjort, og om man har støtt på noen problemer, her kan man få hjelp av medkolegaer om nødvendig.
Når sprinter er over, ser man godt om man fikk gjort arbeidet som planlagt, og en ny sprint starter.

Her er noen av hovedtrekkene til SCRUM: 
- Det er vanlig å ha roller i et SCRUM prosjekt. Det er blandt annet en SCRUMmaster, product owner og et team som utfører arbeidet.
-SCRUM har et tett arbeid med product owner, noe som fremmer kontinuelig tilpassing til prosjektet gjennom sprintene.

Her er noen av forledelene til SCRUM:
- SCRUM kan motivere lag til å jobbe raskere og mer effektivt
- Store prosjekter kan deles inn i mindre sprints, noe som gir bedre oversikt over prosjektet, tillater effektiv bruk av tid og resusser, og man får et bedre falkeblikk over hva som er gjort, og hva som må gjøres gjennom hyppige møter.
-SCRUM oppmunterer tungt til samarbeid. Parkoding og code review er noen av teknikkene som brukes, noe som kan forbedre kodeferdighetene til den enkelte utvikleren. Det er også vanlig å hjelpe hverandre hvis noen sitter fast, eller er sikker på hvor de skal gå videre.
-Med tett tilknytting til product owner og hyppige levereringer, så blir kunden ofte mer fornøyd med sluttproduktet.
  

Her er noen av utfordringene til SCRUM:
- Prosjektet kan bli krevende dersom noen av medlemmene ikke er så erfaren.
- Å ta i bruk SCRUM i større grupper kan være utfordernde
- Avhengig av teamets selvstyringsevne, og motivasjon.

<strong>Devops</strong>

Her er noen av hovedtrekkene til Devops:
-Kontinuerlig integrasjon (CI): Automaserting av bygging, testing og deployment.
-Automasering av oppgaver som ofte må gjøres flere ganger, for å oppnå mer effektive prosseser.
- Feedback er også et viktig prinsipp i devops. Det baserer seg på kontinuerlig innsamling av tilbakemeldinger fra systemet.

Her er noen av forledelene til Devops:
- Raskere: etter man har satt opp et script for devops riktig engang, vil det bli raskere å bygge og deploye senere.
- Høyere kvalitet: med devops i bruk kan man ha en sikkerhetsnett for å oppdage feil tidlig hvis det er satt opp riktig. på denne måten blir det mindre feil i koden, og man har et bedre produkt
- Med bruk av Feedback kan man kontinuerlig overvåke programmet, og gir mulighet til å oppdage problemer med engang.
  
Her er noen av utfordringene til Devops:
- Høye kostader: å ta ibruk devops kan ofte være dyrt for bedrifter.
- Ingen standar: det finnes ingen stadar måte å sette opp devops på, det baserer seg mer på hva man er ute etter. Derfor kan devops ofte bli komplisert.
- avhengighet av automatisering: Det kan fort skje at man stoler blindt på automatiseringen, dette kan være en risiko dersom det skjer noe feil, men tilbakemeldinge sier ikke noe om det, så trur man at alt er som det skal være, når noe egentlig har skjedd feil.

<strong>sammenligning</strong>
-Programvarekvalitet: Scrum har fokus på hyppige leveranser, og å tilpasse seg til kundens ønske, som øker til mer fornøyd kunde. Hos devops øker kvaliteten med automatisering av tester og deployment, og at man har mulighet til overvåking for å raskere oppdage problemer.
-Leveransetempo: ved bruk av smidig med hyppige leveranser, og et klart fokus på hva oppgaven din er kan det endelige produktet komme bli raskere ferdig. Devops kan være ideelt for orginsasjoner som ønsker raske leveranser ofte, slik at man i høy grad slipper komplekse rempetetivitet av demployment.
- Devops fokkuserer på programvare levering, mens scrum fokuserer mest på programvare utvikling.
Ofte vil det beste være å ta ibruk en kombinasjon av begge deler, hvor man bruker SCRUM for utvikliningen, og tar ibruk devops for å auutomatisere levering av programvaret for å oppnå mest effektiv bruk av ressuser.



## 5c

<strong>-Kontinuerlig overvåking i produksjon:</strong> Implementer et system (cloudwatch) som analyserer brukeratferden og hvordan ytelsen er i produksjon. Da får man informasjon om hvordan brukere faktisk utnytter seg av den nye funksjonaliteten, og om den funngerer slikt som tiltenkt, og om det er noen eventuellt problemer. 

<strong>-Deployments til et testmiljø:</strong> før man lanserer funksjonaliteten til produksjon er det lurt å teste det på et testmiljø først. Her kan man få bedre innsikt om det er noen feil, og om det er muligheter for å gjøre det mer brukervennlig

<strong>-Automatiserte tester:</strong> implementer automatiserte tester som dekker den nye funksjonaliteten som har blitt lagd.

<strong>-Feilrapportering/kundeservice og brukerundersøkelser:</strong> Det kan også være lurt å ha et kundeservice system/avdeling som tar imot henvendelser fra kunder dersom det skulle oppstå noen problemer/spørsmål til den nye funksjonaliteten. Brukerundersøkelser etter funksjonaliteten har vært ute en stund kan hjelpe på å se om den fungerer som tiltenkt, og om kundene syntes den er brukervennlig nok.



