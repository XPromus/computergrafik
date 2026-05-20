#import "Template/definitions.typ": *
#import "Template/template.typ": *

#show: frame-style(styles.boxy)

#show: codly-init.with()
#codly(languages: codly-languages)

#title-slide(
  group: [Hochschule Zittau/Görlitz],
  title: [Computergrafik],
  subtitle: [Vorlesung 2],
  extra: [Christopher-Manuel Hilgner]
)

#show: setup

#slide[
  = Agenda
  #set align(horizon)

  - Wiederholung Grafikpipeline
  - Polygon Meshes
  - Mesh Representation
  - Subdivision
  - Optimierung
  - Level of Detail
  - Grafikprimitive
]

#include "Content/content.typ"
