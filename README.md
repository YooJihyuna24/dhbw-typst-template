# 🎓 DHBW [Stadt] - Typst Vorlage für wissenschaftliche Arbeiten

Willkommen zur offiziellen (und inoffiziell besten) Typst-Vorlage für wissenschaftliche Arbeiten (Bachelor-, Studien- und Projektarbeiten) an der DHBW [Stadt].

Diese Vorlage ersetzt die traditionelle, oft fehleranfällige LaTeX-Vorlage durch ein modernes, pfeilschnelles und extrem benutzerfreundliches **Typst**-Setup. 

## ✨ Warum Typst?
* **Pfeilschnell:** Kompiliert dein PDF in Millisekunden.
* **Lesbar:** Die Syntax ist viel sauberer als LaTeX (keine kryptischen `\begin{...}` Blöcke).
* **Kein Müll:** Typst generiert keine Hilfsdateien (.aux, .log). Dein Ordner bleibt sauber.
* **Fokus auf Inhalt:** Das Layout (Ränder, Kopfzeilen, Verzeichnisse) ist komplett automatisiert.

---

## 📂 Ordnerstruktur

Das Repository ist strikt nach dem Prinzip "Trennung von Layout und Inhalt" aufgebaut:

```text
dhbw-typst-template/
├── main.typ               <-- HIER STARTEN! (Zentrale Steuerung & Metadaten)
├── chapters/              <-- Deine Textinhalte (Modular aufgebaut)
│   ├── 01_einleitung.typ  
│   ├── 02_grundlagen.typ
│   └── ...                <-- Hier einfach weitere .typ Dateien erstellen
├── etc/                   <-- Verzeichnisse, Literatur & Anhänge
│   ├── abbreviations.typ  (Abkürzungsverzeichnis)
│   ├── abstract.typ       (Kurzfassung)
│   ├── appendix.typ       (Anhang)
│   ├── bibliography.bib   (Deine Literatur-Datenbank / Export aus Zotero)
│   └── dhbw_style.csl     (Zitierstil: APA 7th Edition Deutsch)
├── img/                   <-- Bilder und Logos (Unterstützt: PNG, JPG, PDF, SVG)
└── lib/                   <-- SYSTEM-DATEIEN (Bitte nicht ändern)
    ├── frontmatter.typ    (Logik für Deckblatt & Erklärungen)
    └── template.typ       (Das Kern-Layout der DHBW)