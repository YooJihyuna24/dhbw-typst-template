// main.typ
#import "lib/template.typ": dhbw-paper

#show: dhbw-paper.with(
  title: "Der Titel einer wissenschaftlichen Arbeit kann auch sehr lang werden...",
  footer-title: "Kurztitel für die Fußzeile",
  thesis-type: "1. Projektarbeit",
  degree: "Bachelor of Science (B. Sc.)",
  submission-date: datetime(year: 2020, month: 8, day: 31),
  course-of-studies: "Wirtschaftsinformatik",
  course: "WWI19BX",
  author: "Max Mustermann",
  company: (
    name: "Musterfrau AG",
    location: "Karlsruhe",
    advisor: "Leonie Musterfrau",
    address: "Hauptstraße 1 \n 76133 Karlsruhe \n Deutschland",
    phone: "0721 1234567",
    email: "info@musterfrau-ag.de",
    logo: "img/company_logo.pdf"
  ),
  university-advisor: "Prof. Dr. Tina Mustermann",
  declaration-location: "Karlsruhe",
  has-blocking-notice: true, //Sperrvermerk
  is-seminar-paper: false
)

// --- VORSPANN ---
#include "etc/abstract.typ"
#include "etc/abbreviations.typ"

// --- HAUPTTEIL ---
#include "chapters/01_einleitung.typ"
#include "chapters/02_grundlagen.typ"
// #include "chapters/03_hauptteil.typ"
// #include "chapters/04_fazit.typ"

// --- LITERATURVERZEICHNIS ---
#bibliography("etc/bibliography.bib", style: "etc/dhbw_style.csl")

// --- ANHANG ---
#include "etc/appendix.typ"