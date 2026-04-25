// lib/template.typ
#import "titlepage.typ": titlepage
#import "../etc/declaration.typ": declaration

#let epigraph(quote, author) = align(center)[
  #block(width: 80%)[_ #quote _ \ #align(right)[--- #author]]
]

#let ai_table(..rows) = table(
  columns: (1.5fr, 2.5fr, 2.5fr, 2fr),
  fill: (col, row) => if row == 0 { luma(171) } else if calc.rem(row, 2) == 0 { luma(219) } else { luma(241) },
  stroke: white,
  inset: 10pt,
  align: horizon,
  // Offizielle Spaltenüberschriften nach Anforderung
  [*Verwendete KI-Tools*], 
  [*Beschreibung der Nutzung*], 
  [*Prompt(s) / Eingabe(n)*], 
  [*Anmerkung und Reflexion*],
  ..rows
)

#let dhbw_paper(
  title: "", thesis_type: "", degree: "", course_of_studies: "", course: "", 
  author: "", company: (:), university_advisor: "", faculty: "", submission_date: none,
  declaration_location: "", declaration_date: none, use_ai: false, has_blocking_notice: true, 
  abstract_src: none, abbreviations_src: none, ai_usage_src: none, appendix_src: none,
  bibliography_src: none, body
) = {
  
  // --- 1. GLOBALE FORMATIERUNG ---
  set document(title: title, author: author)
  set text(font: ("Calibri", "Arial"), size: 12pt, lang: "de", hyphenate: true)
  
  // 1,5-zeilig (Anf. 2.1.6) und Absatzabstand 6pt (Anf. 2.1.5)
  set par(leading: 0.65em, justify: true, spacing: 1.5em)
  
  // Blaue Links für Verzeichnisse
  show link: set text(fill: blue)

  // Überschriften-Größen (Anf. 2.3): 16pt / 14pt / 12pt
  show heading.where(level: 1): set text(size: 16pt)
  show heading.where(level: 2): set text(size: 14pt)
  show heading.where(level: 3): set text(size: 12pt)
  
  // Abstände für Überschriften (Anf. 2.3)
  show heading: set block(above: 24pt, below: 12pt)
  show heading.where(level: 1): it => {
    pagebreak(weak: true)
    v(1.5em)
    it
    v(1em)
  }

  // Inhaltsverzeichnis Design
  show outline.entry: it => {
    if it.level == 1 {
      v(1em, weak: false)
      pad(left: 1em, strong(text(size: 14pt, it))) 
    } else {
      v(0.5em, weak: false)
      text(size: 12pt, it)
    }
  }

  // Beschriftungen (Anf. 2.5)
  show figure.where(kind: table): set figure.caption(position: top)
  show figure.where(kind: image): set figure.caption(position: bottom)
  set figure.caption(separator: ": ")
  show figure.caption: set text(size: 11pt)

  // --- 2. FRONTMATTER (Römisch) ---
  // Ränder & Abstände nach Anf. 2.1.1, 2.1.2, 2.1.3
  set page(
    margin: (top: 2.5cm, bottom: 2.0cm, left: 3.5cm, right: 2.5cm),
    numbering: "I",
    footer-descent: 1.25cm,
    footer: context { 
      set text(size: 9pt)
      stack(
        line(length: 100%, stroke: 0.5pt),
        v(0.5em),
        align(right)[#counter(page).display()]
      )
    }
  )
  
  titlepage(
    title: title, thesis_type: thesis_type, degree: degree, course_of_studies: course_of_studies,
    course: course, author: author, company: company, university_advisor: university_advisor,
    faculty: faculty, submission_date: submission_date, has_blocking_notice: has_blocking_notice
  )
  pagebreak()
  
  counter(page).update(1) // Erklärung = II
  declaration(
    author: author, 
    title: title, 
    declaration_location: declaration_location, 
    declaration_date: declaration_date,
    use_ai: use_ai
  )
  pagebreak()

  if abstract_src != none { abstract_src; pagebreak() }

  heading(level: 1, numbering: none, outlined: false)[Inhaltsverzeichnis]
  outline(title: none, indent: 2em, depth: 3) 
  pagebreak()

  if abbreviations_src != none {
    heading(level: 1, numbering: none, outlined: true)[Abkürzungsverzeichnis]
    abbreviations_src
    pagebreak()
  }

  [#metadata(none) <front_end>] 

  // --- 3. HAUPTTEIL & NACHSPANN (Arabisch) (Anf. 2.1.4) ---
  set page(numbering: "1")
  counter(page).update(1)
  set heading(numbering: "1.1")
  
  body
  pagebreak()

  // --- BACKMATTER (Römisch fortgesetzt) ---
  set heading(numbering: none)
  set page(numbering: "I")
  
  context {
    let front_pages = query(<front_end>)
    if front_pages.len() > 0 {
      let last_roman_val = counter(page).at(front_pages.first().location()).first()
      counter(page).update(last_roman_val + 1)
    }
  }

  // Verzeichnisse nach dem Hauptteil
  if bibliography_src != none {
    bibliography_src
    pagebreak()
  }

  if appendix_src != none {
    appendix_src
    pagebreak()
  }

  if ai_usage_src != none {
    heading(level: 1, outlined: true)[Hilfsmittelverzeichnis]
    ai_usage_src
  }
}