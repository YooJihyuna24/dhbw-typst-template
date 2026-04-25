// etc/appendix.typ

// Nummerierung auf Buchstaben umstellen und bei "A" neu beginnen
#set heading(numbering: "A.1")
#counter(heading).update(0)

= Anhang <anhang>

+ Digitale Version der Arbeit // Das Pluszeichen erzeugt automatisch \begin{enumerate}
+ Interviews
  + Expertmann 2018