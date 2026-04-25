# 🎓 DHBW - Typst Vorlage für wissenschaftliche Arbeiten

Willkommen zur modernen Typst-Vorlage für wissenschaftliche Arbeiten (Bachelor-, Studien- und Projektarbeiten) an der **DHBW**. 

Diese Vorlage wurde entwickelt, um die traditionelle LaTeX-Vorlage exakt nachzuahmen, während sie die Benutzerfreundlichkeit und Geschwindigkeit von **Typst** nutzt. Sie erfüllt die strikten Layout-Vorgaben bezüglich Seitenrändern (2,5cm oben, 2,0cm unten, 3,5cm links, 2,5cm rechts) und der Paginierung (Römisch/Arabisch/Römisch).

## ✨ Features
* **DHBW-Konform:** Automatische Einhaltung aller Formatvorgaben für Ränder, Zeilenabstände (1,5-zeilig) und Schriftgrößen (16pt/14pt/12pt).
* **KI-Nutzungsnachweis:** Integrierte Vorlage für die Reflexion generativer KI gemäß den neuesten Fakultätsbeschlüssen (Option 1 & 2).
* **Modularer Aufbau:** Strikte Trennung zwischen System-Logik und deinen Inhalten.
* **Automatisierung:** Verzeichnisse (Inhalt, Abbildungen, Abkürzungen) werden vollautomatisch erstellt und korrekt verlinkt.

---

## 📂 Ordnerstruktur

Das Repository folgt einer klaren Logik, um dir den Fokus auf den Inhalt zu ermöglichen:

```text
dhbw-typst-template/
├── main.typ               <-- ZENTRALE STEUERUNG (Metadaten & Kapitel-Import)
├── chapters/              <-- DEINE INHALTE
│   ├── 01_einleitung.typ  
│   └── ...                <-- Erstelle hier weitere Kapitel-Dateien
├── etc/                   <-- FORMALIA & VERZEICHNISSE
│   ├── abbreviations.typ  (Abkürzungsverzeichnis / Glossar)
│   ├── abstract.typ       (Kurzfassung der Arbeit)
│   ├── ai_usage.typ       (KI-Nutzungsnachweis - DHBW Pflicht bei Nutzung)
│   ├── appendix.typ       (Anhang)
│   ├── bibliography.bib   (Literatur-Datenbank im BibLaTeX-Format)
│   ├── declaration.typ    (Selbstständigkeitserklärung inkl. KI-Passus)
│   └── dhbw_style.csl     (Zitierstil-Definition für Zitate & Quellen)
├── img/                   <-- GRAFIKEN (Logos, Diagramme, Screenshots)
└── lib/                   <-- LAYOUT-ENGINE (Bitte nicht ändern)
    ├── titlepage.typ      (Design des Deckblatts)
    └── template.typ       (Die DHBW-Formatierungsregeln)

## 🚀 Schnellstart

1.  **Metadaten anpassen:** Öffne die `main.typ` und trage deine persönlichen Daten sowie die Infos zur Arbeit in den `dhbw_paper`-Block ein.
2.  **Inhalt schreiben:** Erstelle deine Kapitel im Ordner `chapters/` und binde sie in der `main.typ` via `#include` ein.
3.  [cite_start]**KI dokumentieren:** Falls du KI-Tools nutzt, trage diese in der etc/ai_usage.typ ein.
4.  **Kompilieren:** Nutze die Typst-App oder das VS-Code Plugin. Dein PDF wird in Echtzeit ohne Hilfsdateien erstellt.

---

## ⚖️ Rechtlicher Hinweis

Diese Vorlage enthält die offiziell beschlossene **Eigenständigkeitserklärung** (Stand 2025). Achte darauf, den Text in etc/declaration.typ nur in Absprache mit deinen Prüfern zu verändern, da dieser laut DHBW-Vorgabe unverändert zu übernehmen ist.

---

## 🛠️ Konfiguration vor dem Start

Bevor du mit dem Schreiben beginnst, arbeite diese vier Punkte ab:

### 1. Die Kommandozentrale (`main.typ`)
Hier fütterst du das Template mit den Metadaten für das Deckblatt und die Erklärungen:

```typ
// main.typ
#show: dhbw_paper.with(
  title: "<Titel der Arbeit>",           // Exakter Titel deiner Arbeit
  thesis_type: "<Typ der Arbeit>",       // z. B. 1. Projektarbeit, Bachelorarbeit
  degree: "<Akademischer Grad>",         // z. B. Bachelor of Science (B. Sc.)
  faculty: "<Fakultät>",                 // Deine Fakultät (z. B. Wirtschaft)
  submission_date: "<Abgabedatum>",      // Geplant oder tatsächliche Abgabe
  course_of_studies: "<Studiengang>",    // Dein Studiengang (z. B. Data Science)
  course: "<Kurs>",                      // Deine Kursbezeichnung (z. B. WDS24B1)
  author: "<Vorname Nachname>",          // Dein vollständiger Name
  company: (
    name: "<Unternehmen>",               // Name deines Dualen Partners
    location: "<Standort>",              // Standort des Unternehmens
    advisor: "<BetreuerIn Unternehmen>", // Dein betrieblicher Betreuer
  ),
  university_advisor: "<BetreuerIn DHBW>", // Dein wissenschaftlicher Betreuer
  declaration_location: "<Ort>",         // Ort für die Eigenständigkeitserklärung
  declaration_date: "<Datum>",           // Datum für die Erklärung
  use_ai: true,                          // true = KI genutzt (Option 2), false = keine KI (Option 1)
  has_blocking_notice: true,             // true = Sperrvermerk einblenden, false = ausblenden
)
```

### 2. Die rechtlichen "Must-Haves" (etc/)

Passe diese Dateien einmalig an, um die Verzeichnisse vorzubereiten:

    etc/abstract.typ: Ersetze den Platzhalter durch deine Kurzfassung.

    etc/abbreviations.typ: Trage deine Abkürzungen in die Tabelle ein.

    etc/declaration.typ: Der Text ist DHBW-konform. Der Parameter use_ai in der main.typ steuert automatisch den korrekten Wortlaut.

    etc/bibliography.bib: Füge hier deine Quellen im BibLaTeX-Format ein.

### 3. Der KI-Nachweis (etc/ai_usage.typ)

Die Dokumentation deiner KI-Nutzung ist an der DHBW Pflicht:

    Keine KI genutzt? Stelle in der main.typ einfach use_ai: false ein. Das Hilfsmittelverzeichnis wird dann automatisch ausgeblendet.

    KI genutzt? Dokumentiere jede Nutzung in der ai_usage.typ in den jeweiligen Tabellen.

### 4. Visuelle Identität (img/)

Ersetze die Platzhalter-Bilder durch die offiziellen Logos:

    img/DHBW_logo.png: Logo deines Standorts (muss diesen Dateinamen haben).

    img/company_logo.png: Dein Firmenlogo (optional).