// lib/frontmatter.typ

// --- DECKBLATT ---
#let titlepage(
  title: "",
  thesis-type: "",
  degree: "",
  course-of-studies: "",
  course: "",
  author: "",
  company: (:),
  university-advisor: "",
  submission-date: none,
  has-blocking-notice: false,
  is-seminar-paper: false,
) = {
  // Das Deckblatt hat oft keine Kopf-/Fußzeile und spezielle Ränder
  set page(margin: (top: 3cm, bottom: 3cm, left: 3.5cm, right: 2.5cm), footer: none, header: none)
  
  align(center)[
    // Logo (wir gehen von PNG aus, da es in Typst leichter zu handhaben ist als PDF)
    #image("../img/DHBW_logo.png", width: 6cm)
    
    #v(4cm)
    #text(size: 14pt)[Fakultät Wirtschaft] \
    
    #v(2cm)
    #text(size: 14pt)[Studiengang #course-of-studies] \
    
    #v(1em)
    #text(size: 18pt, weight: "bold")[#title] \
    
    #v(1cm)
    #text(size: 14pt)[#thesis-type] \
    
    #v(1em)
    Im Rahmen der Prüfung zum #degree \
    
    #if has-blocking-notice {
      v(0.5cm)
      text(size: 14pt, fill: red, weight: "bold")[Sperrvermerk]
      v(0.5cm)
    } else {
      v(2cm)
    }
    
    #v(3cm)
    #submission-date.display("[day]. [month repr:long] [year]") \
    
    // Drückt den restlichen Inhalt ans untere Ende der Seite
    #v(1fr) 
    
    // Metadaten-Tabelle am Ende der Seite
    #align(left)[
      #grid(
        columns: (auto, 1fr),
        row-gutter: 1.5em,
        column-gutter: 1cm,
        [VerfasserIn:], [#author],
        [Kurs:], [#course],
        [Dualer Partner:], [#company.name, #company.location],
        ..if not is-seminar-paper {
          ([Betreuer der Ausbildungsfirma:], [#company.advisor])
        } else {
          () // Leeres Array, falls Seminararbeit
        },
        [Wissenschaftlicher BetreuerIn:], [#university-advisor],
        [Abgabedatum:], [#submission-date.display("[day]. [month repr:long] [year]")]
      )
    ]
  ]
}

// --- SPERRVERMERK ---
#let blocking-notice() = {
  align(center)[
    #heading(level: 1, outlined: true)[#text(fill: red)[Sperrvermerk]]
  ]
  
  par(justify: true)[
    Der Inhalt dieser Arbeit darf weder als Ganzes noch in Auszügen Personen außerhalb des Prüfungsprozesses und des Evaluationsverfahrens zugänglich gemacht werden, sofern keine anders lautende Genehmigung des Dualen Partners vorliegt.
  ]
  v(2cm)
}

// --- EIDESSTATTLICHE ERKLÄRUNG ---
#let declaration(title: "", thesis-type: "", author: "", declaration-location: "", declaration-date: none) = {
  align(center)[
    #heading(level: 1, outlined: true)[Selbstständigkeitserklärung]
  ]
  
  par(justify: true)[
    Ich versichere hiermit, dass ich die vorliegende #thesis-type mit dem Thema:
  ]
  
  align(center)[
    #v(0.5em)
    #text(weight: "bold")[#title]
    #v(0.5em)
  ]
  
  par(justify: true)[
    selbstständig verfasst und keine anderen als die angegebenen Quellen und Hilfsmittel benutzt habe. Ich versichere zudem, dass die eingereichte elektronische Fassung mit der gedruckten Fassung übereinstimmt.
  ]
  
  v(1.8cm)
  
  grid(
    columns: (auto, 1fr, 6cm),
    [#declaration-location, den #declaration-date.display("[day]. [month repr:long] [year]")],
    [], // Platzhalter für den Abstand
    [
      #line(length: 100%, stroke: 0.5pt)
      #v(0.2em)
      #author
    ]
  )
}