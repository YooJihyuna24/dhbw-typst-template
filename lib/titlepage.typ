// lib/frontmatter.typ

#let titlepage(
  title: "", thesis_type: "", degree: "", course_of_studies: "", course: "",
  author: "", company: (:), university_advisor: "", faculty: "", submission_date: none,
  has_blocking_notice: false, is_seminar_paper: false,
) = {
  set page(
    margin: (top: 2.5cm, bottom: 2.0cm, left: 3.5cm, right: 2.5cm), 
    footer: none, 
    header: none
  )
  
  align(center)[
    #image("../img/DHBW_logo.png", width: 6cm)
    
    #v(1.5cm)
    #text(size: 14pt)[Fakultät #faculty]
    
    #v(1cm)
    #text(size: 14pt)[Studiengang #course_of_studies]
    
    #v(1.5cm)
    #text(size: 18pt, weight: "bold")[#title]
    
    #v(1cm)
    #text(size: 14pt)[#thesis_type]
    
    #v(1em)
    Im Rahmen der Prüfung zum #degree
    
    #if has_blocking_notice {
      v(0.5cm)
      text(size: 14pt, fill: red, weight: "bold")[Sperrvermerk]
      v(0.5cm)
    }
    
    #v(1fr) 
    
    #align(center)[
      #grid(
        columns: (1fr, 1fr), 
        row-gutter: 1.5em, 
        column-gutter: 0.5cm, // Abstand zwischen Label und Wert
        align: (right, left), // Links rechtsbündig, rechts linksbündig
        [VerfasserIn:], [#author],
        [Kurs:], [#course],
        [Dualer Partner:], [#company.name, #company.location],
        ..if not is_seminar_paper { 
          ([Betreuer der Ausbildungsfirma:], [#company.advisor]) 
        } else { () },
        [Wissenschaftlicher BetreuerIn:], [#university_advisor],
        [Abgabedatum:], [#if type(submission_date) == datetime { 
          submission_date.display("[day]. [month repr:long] [year]") 
        } else { submission_date }]
      )
    ]
  ]
}