// chapters/01_einleitung.typ
#import "../lib/template.typ": epigraph

= Einleitung

#epigraph[Des Menschen größtes Verdienst bleibt wohl, wenn er die Umstände soviel als möglich bestimmt und sich so wenig als möglich von ihnen bestimmen läßt.][Johann Wolfgang von Goethe #footnote[Vgl. @Freund2014[S. 10]]]

Ein zum Thema passendes Zitat ist fast immer eine gute Einleitung für die Arbeit. BPMN ist eine Modellierungssprache. #footnote[Vgl. @Freund2014[S. 1]] Bei der ersten Verwendung von Abkürzungen... 
"Das ist ein direktes Zitat aus dem Internet". #footnote[@OMG2018[S. 3]]
Es gibt viele schlechte Quellen. #footnote[Vgl. @schlechteQuelle2[S. 1-3]]

== Motivation <motivation>
Abbildungen und Tabellen sind natürlich auch möglich.

#figure(
  image("../img/DHBW_logo.png", width: 40%),
  caption: [Das Logo der DHBW]
) <dhbw_logo> // Das ist das Äquivalent zu \label{}

Mit einem Label in einer Abbildung oder Tabelle kann man darauf referenzieren, wie man an der @musterfirma_logo sehen kann. // @ referenziert automatisch Labels!

#figure(
  image("../img/company_logo.png", width: 30%),
  caption: [Das Logo der Musterfirma]
) <musterfirma_logo>

Die Breite einer Grafik oder Tabelle lässt sich über Prozente steuern. Bei Tabellen werden unsere DHBW-Farben jetzt vollautomatisch angewendet!

#figure(
  table(
    columns: 2,
    [*Eigenschaft*], [*Wert*], // Der Header wird automatisch dunkelgrau
    [Größe], [20 cm],
    [Gewicht], [1 kg],
    [Haarfarbe], [braun]
  ),
  caption: [Eine Tabelle ohne Quellenangabe]
) <beispiel_tabelle>

Aufzählungen macht man ganz einfach:
- Punkt 1
- Punkt 2

Nummerierte Aufzählungen:
+ Punkt 1
+ Punkt 2

Fußnoten sind besonders praktisch für Verweise auf andere Abschnitte der Arbeit. #footnote[Siehe Abschnitt @motivation] Mit dem \@-Symbol lassen sich Labels referenzieren. Das funktioniert bei Abbildungen (@dhbw_logo), Tabellen (@beispiel_tabelle) und Kapiteln.