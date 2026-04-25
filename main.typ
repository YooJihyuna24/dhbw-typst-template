// main.typ
#import "lib/template.typ": dhbw_paper

#show: dhbw_paper.with(
  title: "<Titel der Arbeit>",
  thesis_type: "<Typ der Arbeit>",
  degree: "<Akademischer Grad>",
  faculty: "<Fakultät>",
  submission_date: "<Abgabedatum>",
  course_of_studies: "<Studiengang>",
  course: "<Kursbezeichnung>",
  author: "<Vorname Nachname>",
  company: (
    name: "<Unternehmen>",
    location: "<Standort>",
    advisor: "<BetreuerIn Unternehmen>",
  ),
  university_advisor: "<Wissenschaftliche/r BetreuerIn>",
  declaration_location: "<Ort>",
  declaration_date: "<Datum>",
  use_ai: true, // Stelle auf 'false', wenn du keine KI genutzt hast
  has_blocking_notice: true,
  
  abstract_src: include "etc/abstract.typ",
  abbreviations_src: include "etc/abbreviations.typ",
  bibliography_src: {
    heading(level: 1)[Quellenverzeichnis]
    bibliography("etc/bibliography.bib", title: none, style: "etc/dhbw_style.csl")
  },
  appendix_src: include "etc/appendix.typ",
  ai_usage_src: include "etc/ai_usage.typ",
)

#include "chapters/01_einleitung.typ"