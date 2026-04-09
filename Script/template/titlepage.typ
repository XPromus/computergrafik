#import "../data/constants.typ": *

#let subtitle(
  content: str
) = {
  block()[
    #text(size: 15pt, style: "italic")[#content]
  ]
}

#align(center)[
  #v(150pt)
  //#image("../images/logo.svg", fit: "contain", width: 50%)
  #v(100pt)
  #text(
    size: 25pt,
    weight: "bold"
  )[
    #COURSE_NAME
  ]
  #subtitle(content: "Skript")
  \ \
  #text(size: 18pt, style: "normal")[
    #WRITER
  ]
  \
  #text(size: 15pt, style: "normal", fill: blue)[
    #EMAIL
  ]
]