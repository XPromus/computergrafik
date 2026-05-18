#import "Template/definitions.typ": *
#import "Template/template.typ": *

#show: frame-style(styles.boxy)

#show: codly-init.with()
#codly(languages: codly-languages)

#title-slide(
  group: [Hochschule Zittau/Görlitz],
  title: [Computergrafik],
  subtitle: [Vorlesung 9],
  extra: [Christopher-Manuel Hilgner]
)

#show: setup

#include "Content/content.typ"
