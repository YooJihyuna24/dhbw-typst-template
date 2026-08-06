# DHBW-Typst-Vorlage für Projekt- und Bachelorarbeiten

Typst-Vorlage für wissenschaftliche Arbeiten an der DHBW. Umgesetzt sind die
formalen Vorgaben aus *„Hinweise zur Anfertigung von Projekt- und
Bachelorarbeiten"*, Version 2.0 vom 11.11.2025 — im Code und in dieser Datei
kurz **H** mit Abschnittsnummer, z. B. H 2.1.1 für die Seitenränder.

Nichts in der Vorlage ist an einen bestimmten Studiengang gebunden: Fakultät,
Studiengang, Abschlussgrad und Standortlogo trägst du selbst ein. Die
Hinweise V2.0 stammen von der Fakultät Wirtschaft der DHBW Karlsruhe
(Studiengänge Wirtschaftsinformatik sowie Data Science und Künstliche
Intelligenz); die formalen Regeln anderer Studiengänge und Standorte sind
weitgehend identisch. Vergleiche im Zweifel mit dem Merkblatt deines
Studiengangs — abweichende Wünsche lassen sich in `lib/template.typ` an einer
Stelle ändern.

Die Erklärung entspricht der Fassung für die **Jahrgänge 2024 ff** (DHBW StuPrO
2024, Stand 16.07.2025). Wer noch nach der StuPrO Wirtschaft 2018 schreibt
(Jahrgang 2023), ersetzt den Wortlaut in `etc/declaration.typ` durch die
Selbstständigkeitserklärung aus Anhang 6 der Hinweise.

Ziel der Vorlage: Du schreibst Text, das Layout ist bereits konform.

---

## Schnellstart

1. **Repository kopieren** (Template auf GitHub verwenden oder `git clone`).
2. **`main.typ` ausfüllen.** Oben in der Datei steht eine Schritt-für-Schritt-
   Liste mit allen 15 Angaben, die du selbst eintragen musst. Solange ein Feld
   leer ist, erscheint auf dem Titelblatt „…" — wie im Muster in Anhang 1.
3. **Kapitel schreiben** in `chapters/`.
4. **Quellen pflegen** in `etc/bibliography.bib` — am bequemsten über Zotero mit
   der Erweiterung *Better BibTeX* und aktiviertem „Keep updated". Die
   Schritt-für-Schritt-Anleitung dazu steht als Kommentar oben in der
   `.bib`-Datei.
5. **Kompilieren:**
   - VS Code + Erweiterung **Tinymist Typst** → Vorschau live neben dem Text, oder
   - `typst watch main.typ` in der Konsole, oder
   - [typst.app](https://typst.app) (Projekt hochladen, ohne Installation).

Voraussetzung: **Typst ≥ 0.13**. Prüfen mit `typst --version`. Getestet mit
0.13.1, 0.14.0 und 0.15.1 — alle drei erzeugen dasselbe Ergebnis.

Vor dem ersten eigenen Satz: `chapters/00_beispiele.typ` einmal ansehen
(Zitate, Abbildungen, Tabellen, Verweise) und danach löschen — samt der
zugehörigen `#include`-Zeile in `main.typ`.

---

## Ordnerstruktur

```text
main.typ                  ← Kommandozentrale: Angaben + Kapitel-Reihenfolge
chapters/                 ← deine Inhalte
  00_beispiele.typ        ← Kurzanleitung (vor Abgabe löschen)
  01_einleitung.typ       ← Gerüst nach H 3.8.1
  02_grundlagen.typ       ← Gerüst nach H 3.8.2
  03_analyse.typ
  04_konzeption.typ
  05_umsetzung.typ
  06_fazit.typ            ← Gerüst nach H 3.8.3
etc/
  abstract.typ            ← Kurzfassung (üblich, laut H nicht Pflicht)
  abbreviations.typ       ← Abkürzungsverzeichnis (H 3.5, optional, aus)
  glossary.typ            ← Glossar (H 3.9, optional, aus)
  appendix.typ            ← Anhang mit Anlagen (H 3.10, optional)
  attachments.typ         ← Beigabenverzeichnis (H 3.12, optional, aus)
  ai_usage.typ            ← Hilfsmittelverzeichnis (H 3.13)
  declaration.typ         ← Erklärung, Wortlaut aus Anhang 6 — nicht ändern!
  blocking_notice.typ     ← Sperrvermerk, Wortlaut aus Anhang 5 — nicht ändern!
  bibliography.bib        ← Quellen (BibLaTeX) + Zotero-Anleitung
  dhbw_style.csl          ← Zitierstil APA 7
img/                      ← Logos und Grafiken
lib/                      ← Layout-Engine (normalerweise unverändert lassen)
  template.typ            ← alle Formatregeln, je Regel mit H-Fundstelle
  titlepage.typ           ← Titelblatt nach Anhang 1–4
  components.typ          ← Helfer: #quelle, #hilfsmittel-block, #epigraph
CHECKLISTE.md             ← Abgabe-Checkliste (formale Prüfung)
```

---

## Wer ist wer: die Verzeichnisse

| Teil | Was gehört hinein | Wo |
|---|---|---|
| **Abkürzungsverzeichnis** (H 3.5) | löst Kürzel auf: „BPMN — Business Process Model and Notation" | Vorspann, nach dem Inhaltsverzeichnis |
| **Glossar** (H 3.9) | erklärt Fachbegriffe inhaltlich: „Geschäftsprozess — Folge von …" | Nachspann, vor dem Anhang |
| **Anhang** (H 3.10) | Material **im PDF**: Datentabellen, Listings, Interviewleitfäden. Hinter einem Zwischenblatt, je Teil eine Anlagennummer | Nachspann |
| **Beigabenverzeichnis** (H 3.12) | Inhaltsübersicht der **separat abgegebenen ZIP-Datei** — die Dateien selbst sind nicht im PDF | Nachspann, nach dem Literaturverzeichnis |
| **Hilfsmittelverzeichnis** (H 3.13) | eingesetzte KI-Werkzeuge mit Zweck, Prompt und Reflexion | letzter Teil der Arbeit |

Reihenfolge im Nachspann nach der Auflistung in H 3: Glossar → Anhang →
Literaturverzeichnis → Beigabenverzeichnis → Hilfsmittelverzeichnis. Viele
Betreuende erwarten das Literaturverzeichnis **vor** dem Anhang; das ist mit
`bibliography_first: true` umgeschaltet und in der Praxis ebenso akzeptiert.

---

## Was die Vorlage automatisch erfüllt

Alle Werte sind an einem kompilierten PDF nachgemessen (Angaben in Klammern).

| Anforderung | Fundstelle | Umsetzung |
|---|---|---|
| Ränder 2,5 / 2,0 / 3,5 / 2,5 cm, DIN A4 | H 2.1.1, 2.1.7 | gemessen: links 3,500 cm, rechts 2,500 cm, oben 2,44 cm bis zur Oberkante der ersten Zeile |
| Kopf- und Fußzeile 1,25 cm vom Blattrand | H 2.1.2, 2.1.3 | Seitenzahl endet 1,24 cm über der Unterkante |
| Fußzeile mit durchgezogenem Strich, Seitenzahl rechts | H 2.1.3, 2.1.4 | Strich über die volle Textbreite, Zahl am rechten Textrand |
| Zeilenabstand 1,5 | H 2.1.6, 2.2 | gemessen 20,9 pt (Word-Soll bei 12 pt: 20,7 pt) |
| 6 pt Abstand vor Absätzen | H 2.1.5 | gemessen 26,9 pt = Zeilenabstand + 6 pt |
| Schriftgröße 12, Blocksatz mit Silbentrennung | H 2.1.6, 2.2 | Fließtext durchgängig 12,0 pt |
| Absatzkontrolle (Witwen/Waisen) | H 2.1.5 | `text(costs: …)` |
| Flattersatz in Aufzählungen | H 2.1.6 | `show list/enum` |
| Überschriften 16/14/12 pt fett, ohne Kursiv/Unterstreichung/Silbentrennung | H 2.3 | gemessen 16,0 / 14,0 / 12,0 pt |
| Abstand vor Überschrift 12–24 pt, danach 9–18 pt | H 2.3 | 24 pt bzw. 18 pt gesetzt — Typst misst von der Basislinie bis zur Versalienoberkante, sichtbar bleiben 18,2 bzw. 12,6 pt Weißraum (Absatzabstand zum Vergleich: 13,5 pt) |
| Überschrift steht nie allein am Seitenende | H 2.3 | `sticky: true` |
| Neues Hauptkapitel auf neuer Seite | H 2.3 | `pagebreak(weak: true)` |
| Dezimalgliederung, automatisch nummeriert | H 2.3, 3.4 | `numbering: "1.1"` |
| Fußnoten 10 pt, einzeilig, Trennstrich, durchgehend nummeriert | H 2.4 | gemessen 10,0 pt, Zeilenabstand 11,9 pt |
| Abbildung: Unterschrift, Tabelle: Überschrift, eine Stufe kleiner | H 2.5 | Beschriftungen 11,0 pt |
| Durchgehende Nummerierung „Abb. 1", „Tab. 1" (nicht kapitelweise) | H 2.5 | `figure(supplement: …)` |
| Quelle unter der Beschriftung, nicht im Verzeichnis | H 2.5 | `#quelle[…]`, 10 pt |
| Titelblatt mit allen Pflichtangaben, Logos möglich | H 3.1 | `lib/titlepage.typ`, Aufbau nach Anhang 1 |
| Sperrvermerk wörtlich nach Anhang 5, eigenes Blatt, nicht nummeriert | H 3.2 | `etc/blocking_notice.typ` |
| Erklärung wörtlich nach Anhang 6, nicht nummeriert, nicht im IHV | H 3.3 | `etc/declaration.typ` |
| Seitenzahlen: römisch für die Verzeichnisse, arabisch ab Textteil durchgehend bis zum Ende | H 2.1.4 | Titelblatt/Sperrvermerk/Erklärung ohne Zahl, dann I…VI, dann 1…n ohne Rücksprung |
| Inhaltsverzeichnis mit Führungspunkten, Seitenzahlen rechts, alle folgenden Elemente inkl. Anlagen | H 3.4 | Einträge 1,5-zeilig, mehrzeilige Einträge 1-zeilig |
| Abbildungs-/Tabellenverzeichnis, Format „Abb. 1: Titel" | H 3.6, 3.7, Anhang 7 | erscheinen automatisch, sobald Abbildungen bzw. Tabellen existieren |
| Anhang hinter Zwischenblatt, Anlagen fortlaufend nummeriert und im IHV | H 3.10 | `= Titel` im Anhang wird zu „Anlage 1: Titel" |
| Kurzbeleg Autor-Jahr im Fließtext, nur zitierte Quellen, DOI, keine ISBN | H 3.11 | APA 7 via `dhbw_style.csl` |
| Hilfsmittelverzeichnis für KI-Werkzeuge | H 3.13 | `etc/ai_usage.typ` |

---

## Häufige Anpassungen

Alle Schalter stehen im `dhbw_paper(…)`-Block in `main.typ`:

- **Serifenschrift statt Arial** (H 2.2 lässt beides zu): `font: "Times New Roman"`.
  Nur die Überschriften serifenlos? Zusätzlich `heading_font: "Arial"`.
  Trage immer nur Schriften ein, die auf deinem Rechner installiert sind —
  jede unbekannte Familie meldet Typst als Warnung. Unter Linux ist Arial in
  der Regel nicht vorhanden; dort hilft das Paket `fonts-liberation`
  (Familienname „Liberation Sans", metrisch identisch mit Arial).
- **Kopfzeile mit Trennlinie** (H 2.1.2, optional): `header_text: "Kurztitel der Arbeit"`.
- **Inhaltsverzeichnis kürzen:** `outline_depth: 3` listet nur bis Ebene 1.1.1.
  Standard ist `none` = alle Ebenen, wie H 3.4 es verlangt.
- **Literaturverzeichnis vor dem Anhang:** `bibliography_first: true`.
- **Anderer Zitierstil** (H 3.11 erlaubt APA, DGPs, DIN ISO 690):
  `bibliography_style: "din-1505-2"` oder eigene CSL-Datei in `etc/` ablegen.
- **Überschrift „Quellenverzeichnis"** statt „Literaturverzeichnis":
  `bibliography_title: "Quellenverzeichnis"`.
- **Eingescannte Unterschrift** (bei elektronischer Abgabe gefordert, H 3.3):
  `signature: "/img/unterschrift.png"`.
- **Sperrvermerk**: `has_blocking_notice: true` — erzeugt Hinweis auf dem
  Titelblatt *und* das Sperrvermerk-Blatt. H 3.2: „Ein Sperrvermerk sollte
  vermieden werden."

Nicht anpassen solltest du den Wortlaut in `etc/declaration.typ` und
`etc/blocking_notice.typ`: Beide müssen laut H 3.2 und H 3.3 *genau* mit den
Vorlagen aus Anhang 5 bzw. 6 übereinstimmen.

---

## Abgabe

In den Studiengängen Wirtschaftsinformatik sowie Data Science und Künstliche
Intelligenz wird ausschließlich elektronisch abgegeben (H 5):

- PDF in den Moodle-Raum hochladen, Dateiname nach dem Schema
  `KURS_Nachname_Vorname_Art.pdf`, z. B. `WWI24B_Mustermann_Max_PA2.pdf`:

  ```bash
  typst compile main.typ WWI24B_Mustermann_Max_PA2.pdf
  ```

- Beigaben als ZIP mit den Verzeichnissen `Quelltexte`,
  `Projektdokumentationen`, `Elektronische Quellen`, `Sonstiges` — und im
  Beigabenverzeichnis auflisten (H 3.12, H 5).
- Umfang laut Gutachtenformular: Projektarbeit 20–30 Seiten, Bachelorarbeit
  40–60 Seiten (gezählt wird der Textteil).

Vor dem Hochladen `CHECKLISTE.md` durchgehen.

---

## Was die Vorlage nicht kann

Formale Automatik ersetzt keine inhaltliche Prüfung. Das Gutachtenformular
bewertet zu 90 % Inhalt (Themenerfassung 20, Themenbearbeitung 40,
Quellenauswahl 30 Punkte) und zu 10 % formale Aspekte. Auf diese Punkte musst du
selbst achten:

- keine Ich-/Wir-Form, keine Füllwörter, keine Umgangssprache (H 4.2)
- Querverweise mit konkreter Kapitelnummer (H 4.2)
- kein einzelnes Unterkapitel — entweder Text direkt unter der Überschrift oder
  mindestens zwei Unterpunkte (H 4.1)
- jede Abbildung, Tabelle und Anlage wird im Text erwähnt (H 2.5, H 3.10)
- Rechtschreibprüfung laufen lassen, doppelte Leerzeichen suchen (H 2.1.6)
- höchstens drei Trennstriche in Folge (H 2.1.6) — die Vorlage senkt die
  Trennhäufigkeit, prüfen musst du selbst
