// lib/template.typ
#import "frontmatter.typ": titlepage, declaration, blocking-notice

// --- HILFSFUNKTIONEN ---
#let epigraph(quote, author) = align(center)[
  #block(width: 80%)[
    _ #quote _ \
    #align(right)[--- #author]
  ]
]

// --- HAUPT-TEMPLATE ---
#let dhbw-paper(
  title: "",
  footer-title: "",
  thesis-type: "",
  degree: "",
  submission-date: none,
  course-of-studies: "",
  course: "",
  author: "",
  company: (:),
  university-advisor: "",
  declaration-location: "",
  declaration-date: none,
  has-blocking-notice: true,
  is-seminar-paper: false,
  body
) = {

  // --- 1. GLOBALE DOKUMENTENEINSTELLUNGEN ---
  set document(title: title, author: author)
  set text(font: ("Calibri", "Carlito", "Arial", "sans-serif"), size: 12pt, lang: "de")
  set par(leading: 0.8em, justify: true)
  
  show heading: set block(above: 1.5em, below: 1em)
  show heading: set text(weight: "bold")

  set table(
    fill: (col, row) => 
      if row == 0 { luma(171) }
      else if calc.rem(row, 2) == 0 { luma(219) }
      else { luma(241) },
    stroke: white
  )

  // --- 2. DECKBLATT ---
  titlepage(
    title: title,
    thesis-type: thesis-type,
    degree: degree,
    course-of-studies: course-of-studies,
    course: course,
    author: author,
    company: company,
    university-advisor: university-advisor,
    submission-date: submission-date,
    has-blocking-notice: has-blocking-notice,
    is-seminar-paper: is-seminar-paper
  )

  // --- 3. FRONTMATTER ---
  let dhbw-footer(numbering-style) = context {
    line(length: 100%, stroke: 0.5pt)
    v(2mm)
    grid(
      columns: (1fr, auto, 1fr),
      [], 
      [#text(size: 10pt)[#footer-title]], 
      align(right)[#text(size: 10pt)[#counter(page).display(numbering-style)]] 
    )
  }

  set page(
    margin: (left: 3.5cm, right: 2.5cm, top: 2.5cm, bottom: 3cm),
    footer: dhbw-footer("I")
  )
  
  counter(page).update(1)

  declaration(
    title: title,
    thesis-type: thesis-type,
    author: author,
    declaration-location: declaration-location,
    declaration-date: declaration-date
  )
  pagebreak()

  if has-blocking-notice {
    blocking-notice()
    pagebreak()
  }

  // --- 4. VERZEICHNISSE ---
  heading(level: 1, outlined: false)[Inhaltsverzeichnis]
  outline(title: none, indent: auto)
  pagebreak()

  heading(level: 1, outlined: false)[Abbildungsverzeichnis]
  outline(title: none, target: figure.where(kind: image))
  pagebreak()

  heading(level: 1, outlined: false)[Tabellenverzeichnis]
  outline(title: none, target: figure.where(kind: table))
  pagebreak()

  // --- 5. HAUPTTEIL ---
  set page(footer: dhbw-footer("1"))
  counter(page).update(1)

  body
}