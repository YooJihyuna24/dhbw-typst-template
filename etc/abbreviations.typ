// etc/abbreviations.typ
// ═══════════════════════════════════════════════════════════════════════════
// Abkürzungsverzeichnis (H 3.5, optional)
//
// Löst nur Kürzel auf. Für
// inhaltliche Definitionen von Fachbegriffen ist das Glossar zuständig
// (etc/glossary.typ, H 3.9).
//
// - Abkürzungen sparsam verwenden; keine "Bequemlichkeitsabkürzungen" (AN für
//   Arbeitnehmer). Sinnvoll sind Fachabkürzungen wie IEEE.
// - Abkürzungen des allgemeinen Sprachgebrauchs (z. B. usw., vgl.) müssen nicht
//   aufgeführt werden.
// - Jede Abkürzung wird bei der ERSTEN Verwendung im Text ausgeschrieben.
//
// Einträge einfach in die Liste unten eintragen — sortiert wird automatisch.
// Nicht benötigt? In main.typ `abbreviations_src: none` setzen.
// ═══════════════════════════════════════════════════════════════════════════

#let abkuerzungen = (
  ("API", "Application Programming Interface"),
  ("DHBW", "Duale Hochschule Baden-Württemberg"),
  ("KI", "Künstliche Intelligenz"),
)

#grid(
  columns: (6em, 1fr),
  row-gutter: 0.8em,
  column-gutter: 0.5em,
  ..abkuerzungen
    .sorted(key: ((short, long)) => lower(short))
    .map(((short, long)) => (strong(short), long))
    .flatten()
)
