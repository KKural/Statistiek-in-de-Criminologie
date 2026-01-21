# Hoofdstuk 8: Correlatie- en regressieanalyse

## 1. Symmetrische associatiematen voor kenmerken op metrisch niveau

Dit hoofdstuk is een van de belangrijkste in een inleidend handboek voor toegepaste statistiek voor sociale wetenschappers. Dit hoofdstuk handelt over de lineaire samenhang tussen metrische kenmerken. Je kan je afvragen waarom deze methoden zo populair zijn in de criminologie. Je zou kunnen stellen: veel variabelen zijn toch niet echt van het metrische meetniveau? Veel onderzoek in de criminologie is gebaseerd op indicatoren die worden samengesteld op basis van vragenlijsten. Veel vragenlijsten zijn gebaseerd op uitspraken en die uitspraken hebben een beperkt aantal antwoordcategorieën. De antwoorden uit onderzoek met vragenlijsten kunnen worden verwerkt tot indicatoren die heel gedetailleerde informatie bevatten, alvast informatie die gedetailleerd genoeg is om lineaire correlatie-analyse en lineaire regressie-analyse op toe te passen. Daarnaast bestaan er natuurlijk wel een heleboel kenmerken die van nature uit metrisch zijn van aard. Een voorbeeld is het aantal delicten dat jongeren plegen binnen de tijdspanne van een jaar, het aantal maal dat men slachtoffer wordt van een misdrijf, het aantal keren dat men in de gevangenis werd opgesloten voor een druggerelateerd feit, het aantal (buitenechtelijke) kinderen dat men heeft, hoeveel maanden men leefloon geniet, enz.

Al deze kenmerken kunnen gemeten worden met een grote precisie, en kunnen met criminaliteit of de maatschappelijke reactie op criminaliteit in verband gebracht worden. Criminologen hebben zich sinds de negentiende eeuw heel intensief bezig gehouden met dergelijke vraagstellingen. De biologische school zocht naar biologische oorzaken van delinquent gedrag, de psychologische school zocht naar verbanden tussen de scores op psychologische testen en regelovertredend gedrag. Zulke studies leveren een antwoord op de vraag of er bijvoorbeeld een verband bestaat tussen de scores van iemand op een psychopathieschaal en de frequentie waarmee een persoon gewelddadige handelingen stelt. Dat zijn heel belangrijke vragen want ze leren ons iets over kenmerken zoals psychopathie en de kenmerken waarmee dit samenhangt. Vandaag de dag neemt men in de reclassering en hulpverlening vaak het geïntegreerd biopsychosociaal model, waarbij gekeken wordt naar de samenhang tussen kenmerken gemeten op individueel niveau en kenmerken gemeten op groepsniveau als uitgangspunt.

Eén van de meest volledige overzichtswerken van alle correlaties is het grote correlatiehandboek "The Handbook of Crime Correlates" van de criminologen Lee Ellis, Kevin Beaver en John Wright. Dit handboek bevat een overzicht van kenmerken, gerangschikt volgens type en sterkte.

Om al die interessante studies te kunnen begrijpen, is het belangrijk dat je basisinzichten verkrijgt in de regressie- en correlatieanalyse. Stel je voor dat je niks kent van deze associatiematen en je gebruikt resultaten uit het eerste en beste artikeltje uit een tijdschrift in het kader van een paper die je moet schrijven of erger nog: in het kader van je scriptie. De kans is reëel dat je het artikel foutief interpreteert en ook dat je niet in staat bent het kaf van het koren te onderscheiden. Het duurt wel eventjes voor je dat kan, maar Rome werd ook niet op één dag gebouwd. Zo is het ook gesteld in de criminologie-opleiding. De criminoloog wordt ook niet op een dag gevormd. Gelukkig maar. Criminologen die gedetineerden loslaten op basis van foutief geïnterpreteerde tests, zijn geen goede zaak voor de samenleving. De tijd dat je dacht dat enkel ingenieurs een goede statistische opleiding moeten hebben, is wel degelijk voorbij. Je ontsnapt dus niet aan de lineaire regressie en correlatieanalyse. Maar geloof het of niet, de correlatie- en regressieanalyse kunnen best interessant zijn eenmaal je de logica ervan doorhebt. In het tijdperk van "Big Data" waar alle informatie voor het rapen ligt, en waar zoveel digitale informatie wordt bijgehouden, kan je als (criminologische) data-analist goed aan de slag en beleef je gouden tijden. Genoeg reclamepraat echter. We komen terug tot de orde van de dag.

De lineaire samenhang tussen twee kenmerken van het metrisch niveau kan worden bestudeerd aan de hand van de covariatie, de covariantie en de correlatiecoëfficiënt. Deze symmetrische associatiematen zijn verwant aan elkaar. Zij vormen de basis om de bivariate regressieanalyse te begrijpen. Aan regressieanalyse wordt in een volgende paragraaf aandacht besteed. Stel dat we geïnteresseerd zijn in de samenhang tussen de criminaliteitsgraad in Gentse buurten en het werkloosheidspercentage in diezelfde Gentse buurten. We verzamelen deze metrische gegevens voor alle Gentse buurten. Als blijkt dat hoge criminaliteitsgraden in buurten samenhangen met hoge werkloosheidspercentages, dan is er sprake van een positieve samenhang. Omgekeerd, als blijkt dat hoge criminaliteitsgraden samenhangen met lage werkloosheidsgraden, dan is er sprake van negatieve samenhang. Als er geen samenhang bestaat tussen beide metrische kenmerken dan zal de covariatie, covariantie maar ook de correlatie nul bedragen.

Om de bivariate lineaire samenhang tussen twee metrische kenmerken beter te begrijpen, kunnen we best beroep doen op een puntenwolk of scatterplot. Dit principe hebben we eerder al eens kort uitgelegd. Elk punt representeert een statistische eenheid (bijvoorbeeld een individu, een buurt) en elk punt bevat informatie over een X-variabele en een Y-variabele. Elk punt heeft dus wat we noemen xy-coördinaten. Deze coördinaten worden gegeven voor de kenmerken waarin men geïnteresseerd is, zoals de criminaliteitsgraad en de werkloosheidsgraad. Alle punten vormen samen een puntenwolk.

De puntenwolk is dus de verzameling van alle elementen uit onze steekproef waarbij geldt dat we voor elk element de waarde op de X-variabele en de waarde op de Y-variabele kunnen aflezen.

In de tekening hieronder zien we vier verschillende situaties. We bespreken ze even:
- Links bovenaan kan een puntenwolk gezien worden, waaruit een heel sterk positief verband blijkt te bestaan. Hoge waarden op de X-variabele gaan samen met hoge waarden op de Y-variabele. We spreken van een sterke positieve samenhang.
- Rechts bovenaan zien we eveneens een puntenwolk, maar de relatie tussen X en Y is toch minder uitgesproken. Je moet al veel beter je best doen om daar een sterk verband in te willen zien. Toegegeven, er zit een patroon is, maar de stijging is maar matig. We spreken hier duidelijk van een matig positief verband.
- Links onderaan kan een puntenwolk gezien worden, waaruit een heel sterk negatief verband blijkt te bestaan. Hoge waarden op de X-variabele gaan samen met lage waarden op de Y-variabele. We spreken van een sterke negatieve samenhang.
- Rechts onderaan zien we eveneens een puntenwolk, maar de relatie tussen X en Y is toch minder uitgesproken. Je moet al veel beter je best doen om daar een sterk verband in te willen zien. Toegegeven, er zit een patroon in, maar de daling is maar matig. We spreken hier duidelijk van een matig negatief verband.

### Vormen van lineaire samenhang tussen metrische kenmerken

Omdat elk van de beide kenmerken van het metrische niveau is, kunnen we van elk punt gemakkelijk het rekenkundig gemiddelde berekenen. We kunnen een denkbeeldig punt tekenen in de puntenwolk: het punt gegeven door de gemiddelde score op de X-variabele en de gemiddelde score op de Y-variabele, noemen we het centrale punt van de puntenwolk. Een nog andere benaming hiervoor is het zwaartepunt van de tweedimensionele verdeling. Deze tweedimensionele tegenhanger van het rekenkundige gemiddelde (gedragen door de gemiddelde waarde op variabele X en de gemiddelde waarde op variabele Y) is letterlijk het "zwaartepunt" van de verdeling: het geeft een tweedimensionele centrale waarde in het vlak (x,y). Laat ons beginnen met een illustratie.

Het bepalen van de statistische samenhang tussen twee metrische kenmerken is een indicatie van het samen optreden van afwijkingen ten opzichte van het gemiddelde bij één van de variabelen met afwijkingen ten opzichte van het gemiddelde bij de andere variabele. De richting geeft aan of het over een positief of een negatief verband gaat. Bij een positief verband hangen hoge (lage) waarden van X (Y) samen met hoge (lage) waarden van Y (X). Bij een negatief verband zullen hoge (lage) waarden van X (Y) samengaan met lage (hoge) waarden op Y (X). De sterkte duidt op de mate waarin beide variabelen al dan niet samenhangen. Laten we de waarnemingen in het (x,y)-vlak beschouwen en een assenkruis door het bivariate zwaartepunt tekenen.

**Kwadrant I:** x̄ < x en ȳ < y  
**Kwadrant II:** x < x̄ en ȳ < y  
**Kwadrant III:** x < x̄ en y < ȳ  
**Kwadrant IV:** x̄ < x en y < ȳ

Als het merendeel der (x,y)-waarnemingen in kwadrant II en IV liggen, dan vertonen deze punten een dalende tendens. Als het merendeel der (x,y)-waarnemingen in kwadrant I en III liggen, dan vertonen deze punten een stijgende tendens.

### Voorbeeld: Puntenwolk van de relatie sociale overlast en het percentage alleenstaanden in Gentse buurten

Laten we een voorbeeld geven uit de praktijk van het geografisch criminologisch onderzoek. Als in een puntenwolk de punten een lineair patroon vormen dan is er sprake van een zekere lineaire samenhang tussen de variabelen. In het voorbeeld hierboven is er sprake van een positieve samenhang. De twee variabelen worden hier gepresenteerd onder de vorm van z-scores. Dit wil zeggen dat de variabelen gestandaardiseerd zijn en dat de gemiddelde score nul bedraagt en dat de standaardafwijking één bedraagt. Als je nu naar de Y-as kijkt, dan zie je de waarde van "nul". Idem voor de X-as. Als je deze beide punten met elkaar verbindt, dan heb je het denkbeeldige bivariate zwaartepunt. Uit deze puntenwolk leiden we een zeker patroon af: hoe hoger de score op de variabele "percentage alleenstaanden", hoe hoger de score voor de variabele "sociale overlast". Uit verschillende studies blijkt dat het percentage alleenstaanden één van de sterkste predictoren voor criminaliteit en overlast lijkt te zijn. Vanuit de routine-activiteitentheorie van Marcus Felson werd gewezen op het feit dat alleenstaanden er een andere leefstijl op nahouden dan niet-alleenstaanden (althans gemiddeld genomen). Concreet komt de redenering hier op neer: in buurten waar veel alleenstaanden wonen, er minder informeel toezicht of "guardianship" is. Alleenstaanden gaan vaker uit dan samenwonenden en gezinnen met kinderen, waardoor de huizen en de straten aan minder toezicht worden blootgesteld. Hierdoor ontstaat een situatie waarin minder burgers bereid zijn om in te grijpen als er iets gebeurt. Dit is een interessante voedingsbodem voor criminaliteit, althans vanuit het opportuniteitsperspectief bekeken.

De hierboven geïllustreerde associatie kunnen we statistisch beschrijven aan de hand van drie belangrijke en onderling verworven associatiematen: de covariatie, de covariantie en de correlatie. Alvorens dieper in te gaan op de berekening van deze associatiematen, is het voor een goed begrip noodzakelijk te duiden op de mogelijkheden maar ook op de beperkingen ervan. Covariaties, covarianties en correlaties worden gebruikt om de samenhang tussen twee variabelen te schatten en het gaat hierbij om symmetrische associatiematen. Er is dus geen veronderstelling over causaliteit.

### De covariatie

De covariatie wordt ook de kruisproductensom genoemd. De Engelstalige benaming hiervoor is de Sum of Squares (afgekort: SSxy) en ze stelt de mate voor waarin beide variabelen samen variëren (synoniem: co-variëren). Het is de som van de kruisproducten. Voor elke onderzoekseenheid kan je een kruisproduct berekenen. Eerder hebben we laten zien dat je voor elke onderzoekseenheid de afwijking tegenover het rekenkundig gemiddelde kan berekenen en dat vermenigvuldigen met zichzelf. Dat was eigenlijk een bijzonder geval van een kruisproduct, met name het kruisproduct met zichzelf. Met kruisproduct bedoelen we het product van een afwijking van een onderzoekseenheid tegenover de gemiddelde x-waarde, en de afwijking van een onderzoekseenheid tegenover de gemiddelde y-waarde. Als we deze oefening uitvoeren voor elk element in onze steekproef, dan krijgen we voor elke eenheid een nieuwe waarde. Als we die nieuwe waarden met elkaar optellen, dan krijgen we een nieuwe som. Dat is de kwadratensom en deze is heel belangrijk. Immers, op basis van de kruisproductensom worden de parameters van de bivariate associatie op metrisch niveau berekend.

$$SS(x,y) = \{ (x_1 - \bar{x}) \cdot (y_1 - \bar{y}) + ... + (x_n - \bar{x}) \cdot (y_n - \bar{y}) \}$$

Wanneer we de berekeningswijze van de covariatie bekijken, dan zien we dat de eerder geziene variatie eigenlijk een bijzonder geval is van de covariatie. De variatie is eigenlijk de covariatie van een kenmerk met zichzelf. In tegenstelling tot de variatie, waar de gesommeerde deviatiescores (van één variabele) gekwadrateerd worden, vermenigvuldigt men bij de covariatie de gesommeerde deviatiescores van de twee variabelen. Deze producten noemt men kruisproducten.

### De covariantie

De covariatie is een maat die dezelfde nadelen heeft als de variatie. Omdat ze enkel gebaseerd is op de kruisproducten, krijgen we grote waarden. We moeten iets doen om deze maat te normeren. Een eerste belangrijke tussenstap is het berekenen van de covariantie. De covariantie (Sxy) van x en y is de kruisproductensom van (x - x̄) en (y - ȳ), gedeeld door n-1. Dus wordt de covariantie tussen x en y als volgt berekend:

$$Cov(x,y) = \frac{\{ (x_1 - \bar{x}) \cdot (y_1 - \bar{y}) + ... + (x_n - \bar{x}) \cdot (y_n - \bar{y}) \}}{n-1}$$

Gezien de covariantie afhankelijk is van de meeteenheid waarin de variabelen zijn opgenomen kan de absolute waarde van de covariantie weinig informatie bieden over de sterkte van de samenhang. Door te covariatie te delen hebben we het probleem van de normering nog niet opgelost. Vandaar dat ook hier nog steeds een vaste boven- en benedengrens ontbreekt, en dus ook het ontbreken van de mogelijkheid om waarden onderling te vergelijken. Wanneer bij wijze van voorbeeld inkomen wordt uitgedrukt in jaarlijks inkomen en leeftijd in jaren, bekomt men een grotere waarde van de covariantie dan wanneer men werkt met wekelijks inkomen. Dat zou ook weer niet mogen. Een associatie tussen twee kenmerken mag niet afhankelijk zijn van de meting (uitgedrukt in weken dan wel in jaren). Een grotere waarde van de covariantie duidt dus niet op een sterkere samenhang maar is een rechtstreeks gevolg van het feit dat de numerieke waarde en de spreiding van inkomen groter is bij jaarlijks dan bij wekelijks inkomen. Aan de relatie tussen inkomen en leeftijd is echter niets veranderd. De oplossing is het standaardiseren van de covariantie. Deze gestandaardiseerde covariantie is gekend als de product-moment correlatiecoëfficiënt van Pearson.

### De product-moment correlatiecoëfficiënt van Pearson

De correlatiecoëfficiënt, ook wel product-moment correlatiecoëfficiënt van Pearson genoemd, is gelijk aan de covariantie tussen X en Y in gestandaardiseerde vorm. De formule ziet er als volgt uit:

$$r_{xy} = \frac{Cov(x,y)}{S_x \cdot S_y}$$

Om de correlatie te berekenen volstaat het dus de covariantie Cov(x,y) te standaardiseren door de covariantie te delen door Sx*Sy. Standaardisatie maakt de interpretatie van de associatie tussen twee metrische variabelen eenvoudiger. De correlatie varieert dankzij het proces van standaardisering van min één tot plus één; waarbij nul wijst op gebrek aan correlatie.

Hier volgen enkele vuistregels voor de interpretatie van de associaties:
- 0 – 0,10 zeer zwak/geen verband;
- 0,11 – 0,30 zwak verband;
- 0,31 – 0,50 redelijk verband;
- 0,51 – 0,80 sterk verband;
- 0,81 – 0,99 zeer sterk verband;
- 1 perfect verband.

Het gaat hier om absolute waarden, ongeacht het teken. Er dient verder op gewezen te worden dat men veelvuldig de fout maakt om op basis van een lage waarde van de correlatie tussen twee variabelen te besluiten dat er geen verband zou bestaan tussen beide kenmerken. Men dient zich steeds te realiseren dat een correlatie toetst naar een lineair verband tussen twee variabelen. Het verdient aanbeveling om een puntenwolk (of scatterplot) van beide variabelen te bestuderen aangezien het mogelijk is dat de variabelen wel een samenhang vertonen maar dat dit verband niet lineair is.

## 2. Covariatie, covariantie en correlatie: een uitgewerkt rekenvoorbeeld

Een heleboel complexe multivariate analysetechnieken die criminoloog-onderzoekers gebruiken zijn gebaseerd op deze bivariate associatiematen. Precies omdat deze associatiematen zo belangrijk zijn in de statistiek, moeten studenten deze zeer goed kunnen interpreteren, maar ook beseffen hoe deze maten uitgerekend worden. We geven een uitgewerkt rekenvoorbeeld. We berekenen de associatie tussen twee testscores die studenten hebben op twee psychosociale proeven ter voorbereiding van een sollicitatiegesprek voor een job als strategisch analist bij de federale politie. We zetten even de stappen op een rijtje die je moet maken om de covariantie zelf uit te rekenen. In de praktijk maken criminologen echter gebruik van statistische verwerkingspakketten om deze berekening uit te voeren. Toch is het noodzakelijk dat je snapt wat er in werkelijkheid achter de schermen gebeurt wanneer je de samenhang tussen kenmerken berekent aan de hand van software pakketten. Het begrijpen van wat een statistische analyse doet, zal ervoor zorgen dat de kans dat je de resultaten van een analyse verkeerd interpreteert, aanzienlijk verkleint.

### Tabel: tussenstappen bij het berekenen van een correlatie

| Student | ScoreT1 | ScoreT2 | x - x̄ | y - ȳ | (x - x̄)² | (y - ȳ)² | (x - x̄)·(y - ȳ) |
|---------|---------|---------|--------|--------|-----------|-----------|------------------|
| An | 30,00 | 65,00 | 0 | 2 | 0 | 4 | 0 |
| Arno | 45,00 | 75,00 | 15 | 12 | 225 | 144 | 180 |
| Bart | 35,00 | 60,00 | 5 | -3 | 25 | 9 | -15 |
| Björn | 20,00 | 50,00 | -10 | -13 | 100 | 169 | 130 |
| Delphine | 40,00 | 80,00 | 10 | 17 | 100 | 289 | 170 |
| Hanne | 35,00 | 75,00 | 5 | 12 | 25 | 144 | 60 |
| Henk | 30,00 | 70,00 | 0 | 7 | 0 | 49 | 0 |
| Ines | 30,00 | 75,00 | 0 | 12 | 0 | 144 | 0 |
| Jeroen | 25,00 | 55,00 | -5 | -8 | 25 | 64 | 40 |
| Jurgen | 20,00 | 40,00 | -10 | -23 | 100 | 529 | 230 |
| Kim | 40,00 | 75,00 | 10 | 12 | 100 | 144 | 120 |
| Robert | 25,00 | 60,00 | -5 | -3 | 25 | 9 | 15 |
| Nele | 20,00 | 60,00 | -10 | -3 | 100 | 9 | 30 |
| Sara | 25,00 | 50,00 | -5 | -13 | 25 | 169 | 65 |
| Sofie | 30,00 | 55,00 | 0 | -8 | 0 | 64 | 0 |
| **N= 15** | **x̄ = 30** | **ȳ = 63** | | | **SS = 850** | **SS = 1940** | **SSxy = 1025** |

### Stappen te volgen in het uitrekenen van een correlatie:

Hieronder hebben we de stappen uitgeschreven. We brengen in herinnering dat we gebruik maken van dezelfde gegevens, met name de testscores van studenten op twee examens. Echter, in plaats van te kijken naar de individuele variatie in de testscores, gaan we nu kijken naar de mate waarin deze twee testscores samenhangen.

1. Bereken het rekenkundig gemiddelde van de twee variabelen, zoals eerder werd uiteengezet.
2. Bereken de afwijkingen van elke onderzoekseenheid ten opzichte van het rekenkundig gemiddelde voor de beide variabelen X en Y. Anders gesteld: bereken de deviatiescores voor elke onderzoekseenheid op basis van de variabelen X en Y.
3. Kwadrateer de deviatiescore op basis van X en op basis van Y. Op die manier leg je de basis voor de berekening van de variatie in X en Y en de covariatie tussen X en Y.
4. Neem de kwadratensom van de deviatiescores op basis van X en op basis van Y.
5. Bereken de variantie van X en de variantie van Y. Dit gebeurt door zowel variatie van X als de variatie van Y te delen door N-1.
6. Bereken de vierkantswortel van de variantie in X en de vierkantswortel van de variantie in Y. Je hebt nu ook de standaardafwijking van X en van Y.
7. Bereken de kruisproductensom en je hebt de covariatie tussen X en Y.
8. Deel de kruisproductensom door n-1 en je hebt de covariantie tussen X en Y.
9. Vermenigvuldig de standaardafwijking van X met de standaardafwijking van Y.
10. Deel de covariantie tussen X en Y door de vermenigvuldiging van de standaardafwijking van X met de standaardafwijking van Y. Dit resultaat is de correlatiecoëfficiënt van Pearson.

Als je berekening juist is stel je vast dat de correlatie 0.79 bedraagt. Een heranalyse met het statistisch verwerkingspakket SPSS leert ons hetzelfde.

---

De volledige inhoud van hoofdstuk 8 is opgenomen in het verplichte leermateriaal. Bestudeer het volledig hoofdstuk grondig, inclusief alle rekenvoorbeelden en SPSS-output, voor een diepgaand begrip van correlatie- en regressieanalyse.