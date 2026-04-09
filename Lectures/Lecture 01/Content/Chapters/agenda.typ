#import "../../Template/definitions.typ": *
#import "../../Template/template.typ": chapter-title-slide

#let chapter_name = [Agenda]
#chapter-title-slide(section-name: chapter_name)

#slide[
  = Agenda
  #set align(horizon)
  #toolbox.side-by-side()[
    #set align(top)
    == Vorlesung
    - Einführung in die Computergrafik
    - Historische Entwicklung
    - Rendering Methoden
    - Linien Rendering
    - Polygone
    - Übersicht über die Rendering Pipeline
    - Z-Buffer
    - Kurze Einführung in Anti-Aliasing
    - Anwendungen der Computergrafik
  ][
    #set align(top)
    == Seminar
    - Installation der nötigen Tools
    - Erstellung eines einfachen LWJGL Projektes
  ]
]
