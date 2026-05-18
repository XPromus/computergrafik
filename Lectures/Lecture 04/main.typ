#import "Template/definitions.typ": *
#import "Template/template.typ": *

#show: frame-style(styles.boxy)

#show: codly-init.with()
#codly(languages: codly-languages)
#show: frame-style(styles.boxy)

#title-slide(
  group: [Hochschule Zittau/Görlitz],
  title: [Computergrafik],
  subtitle: [Vorlesung 4],
  extra: [Christopher-Manuel Hilgner],
  topic: [Schatten & Reflexionen]
)

#show: setup

#include "Content/content.typ"
