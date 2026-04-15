#import "../../Template/definitions.typ": *
#import "../../Template/template.typ": chapter-title-slide

#let chapter_name = [Übersicht]
#chapter-title-slide(section-name: chapter_name)

#slide[
  = #chapter_name
  #set align(horizon)
]
