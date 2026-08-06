// etc/glossary.typ
// ═══════════════════════════════════════════════════════════════════════════
// Glossar (H 3.9, optional)
//
// UNTERSCHIED ZUM ABKÜRZUNGSVERZEICHNIS:
//   Abkürzungsverzeichnis (H 3.5) → löst Kürzel auf:
//                                   "BPMN — Business Process Model and Notation"
//   Glossar (H 3.9)               → erklärt Fachbegriffe inhaltlich:
//                                   "Geschäftsprozess — Folge von logisch …"
// Das Abkürzungsverzeichnis steht im Vorspann nach dem Inhaltsverzeichnis,
// das Glossar im Nachspann zwischen Textteil und Anhang.
//
// "Da sich die Projekt- bzw. Bachelorarbeit an fachkundige Leser richtet, kann
// meist auf ein Glossar verzichtet werden." (H 3.9)
//
// Standardmäßig ist das Glossar deaktiviert. Zum Aktivieren in main.typ die
// Zeile `// glossary_src: include "etc/glossary.typ",` einkommentieren.
// Es steht dann zwischen Textteil und Anhang.
// ═══════════════════════════════════════════════════════════════════════════

#let glossar = (
  (
    "Geschäftsprozess",
    "Folge von logisch zusammenhängenden Aktivitäten, die ein fachliches "
      + "Ergebnis für einen internen oder externen Kunden erzeugt.",
  ),
)

#grid(
  columns: (10em, 1fr),
  row-gutter: 1em,
  column-gutter: 0.5em,
  ..glossar
    .sorted(key: ((term, definition)) => lower(term))
    .map(((term, definition)) => (strong(term), definition))
    .flatten()
)
