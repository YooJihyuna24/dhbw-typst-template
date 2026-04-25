// etc/declaration.typ

#let declaration(author: "", title: "", declaration_location: "", declaration_date: none, use_ai: false) = {
  align(center)[
    #heading(level: 1, outlined: false)[Selbstständigkeitserklärung]
  ]
  
  v(1cm)
  
  [Mit dem Hochladen versichere ich, dass ich mir bewusst bin, dass schriftliche Arbeiten, die ich im Rahmen meines Studiums als Studien- oder Prüfungsleistungen einreiche, eigenständig verfasst werden müssen. Das bedeutet u.a., dass ich für das Endprodukt selbst als Autor*in vollumfänglich verantwortlich bin. Dabei ist die Nutzung von Quellen, Zitaten sowie sonstiger Hilfsmittel nach den geltenden Regeln wissenschaftlicher Dokumentation im Sinne des Prinzips der Transparenz eindeutig und nachvollziehbar kenntlich zu machen. Es ist untersagt, fremde Texte als eigene auszugeben#if use_ai [ (siehe auch untenstehenden Hinweis zu KI-gestützten Werkzeugen).] else [.]]
  
  v(1em)
  
  [Ich versichere zudem, dass meine Arbeit weder vollständig noch in Teilen bereits in einem anderen Prüfungsverfahren verwendet oder veröffentlicht wurde. Wenn gebundene Fassungen verlangt werden, entspricht das in elektronischer Form eingereichte Exemplar inhaltlich vollständig den abgegebenen gebundenen Fassungen. Ein Verstoß gegen diese grundlegenden Prinzipien wissenschaftlichen Arbeitens wird als Täuschungsversuch gewertet. Die Konsequenzen sind in der aktuellen Studien- und Prüfungsordnung hinterlegt.]
  
  v(1em)
  
  if use_ai {
    [Ich bin mir bewusst, dass die Nutzung generativer KI-Werkzeuge keine Gewährleistung für die Qualität der erzeugten Inhalte bietet. Für etwaige fehlerhafte Inhalte sowie für Verstöße gegen Datenschutzrecht, Urheberrecht oder gegen die Regeln wissenschaftlichen Arbeitens (z. B. in Form von Plagiaten, erfundenen Quellen, falschen Belegen usw.) trage ich die volle Verantwortung. Ich versichere zudem, dass im Falle der Nutzung von KI-gestützten Werkzeugen:]
    
    [
      - diese ausschließlich als unterstützende Hilfsmittel eingesetzt wurden und mein eigener gestalterischer Beitrag den wesentlichen Anteil an der Arbeit darstellt und
      - ich die eingesetzten Werkzeuge, deren jeweilige Zwecke sowie den Umfang der Nutzung transparent dargelegt habe. Im Fall der Verwendung generativer KI habe ich der Arbeit einen Anhang beigefügt (Tabelle), in dem ich den Einsatz der entsprechenden Werkzeuge kritisch reflektiert und dokumentiert habe.
    ]
  } else {
    [Hiermit erkläre ich, dass ich die vorliegende Arbeit eigenständig und ohne die beabsichtigte Verwendung generativer KI-gestützter Werkzeuge erstellt habe.]
  }

  v(2cm)
  
  grid(
    columns: (auto, 1fr, 6cm),
    [#declaration_location, den #if type(declaration_date) == datetime { declaration_date.display("[day]. [month repr:long] [year]") } else { declaration_date }],
    [],
    [
      #line(length: 100%, stroke: 0.5pt)
      #v(0.2em)
      #author
    ]
  )
}