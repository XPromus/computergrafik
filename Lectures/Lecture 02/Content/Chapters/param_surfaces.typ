#import "../../Template/definitions.typ": *
#import "../../Template/template.typ": hszg-green, chapter-title-slide

#chapter-title-slide(section-name: [Param. Oberflächen])

#slide[
  = Gekrümmte Polygone
  #set align(horizon)
  Rendering von gekrümmten Polygonen
  #figure()[
    #image("../../Images/curved_poly.png", fit: "contain")
  ]
  #enum(numbering: "(a)")[
    Gitter mit 16 Kontrollpunkten
  ][
    Bezierﬂäche aus 400 Quads im Drahtgittermodell
  ][
    Bezierﬂäche aus 400 Quads gefüllt und beleuchtet
  ]
]

#slide[
  = Parametrische Oberflächen
  #set align(horizon)
  - Verallgemeinerung parametrischer Kurven
    - bi-polynomial, z.B. bikubische parametrische Flächen
    - stückweise parametrische Flächen
    - z.B. Bézier-Oberﬂäche, NURBS-Oberﬂäche, ...
  - Häuﬁg verwendet für Computer Aided Design (CAD)
  - Mittlerweile Echtzeit-Renderings möglich
  - Zukünftig wohl sehr häuﬁge Anwendungsform
]

#slide[
  = Parametrische Oberflächen
  #set align(horizon + center)
  #figure()[
    #diagram(
      node-stroke: 1pt,
      edge-stroke: 10pt,
      node-inset: 10pt,
      node(
        (0, 0), 
        stroke: stroke(paint: hszg-green.darken(20%), thickness: 5pt)
      )[
        Polygon Meshes \
        #text(weight: "light")[Games]
      ],
      node(
        (0, 1), 
        stroke: stroke(paint: hszg-green.darken(20%), thickness: 5pt)
      )[
        Subdivision Surfaces \
        #text(weight: "light")[Filme]
      ],
      node(
        (0, 2), 
        stroke: stroke(paint: hszg-green.darken(20%), thickness: 5pt)
      )[
        Parametrische Oberflächen \
        #text(weight: "light")[CAD/CAM]
      ],
      edge(
        (2, 0), 
        "-|>", 
        (2, 2), 
        stroke: stroke(paint: hszg-green, thickness: 10pt)
      ),
      node(
        (4, 0.4), 
        shape: chevron.with(dir: bottom, angle: 20deg, fit: 1.25), width: 200pt,
        fill: hszg-green,
        stroke: stroke(paint: hszg-green.darken(20%), thickness: 5pt)
      )[
        erhöhte Genauigkeit
      ],
      node(
        (4, 1.6), 
        shape: chevron.with(dir: bottom, angle: 20deg, fit: 1.25), width: 200pt,
        fill: hszg-green,
        stroke: stroke(paint: hszg-green.darken(20%), thickness: 5pt)
      )[
        verlangsamtes Rendering
      ]
    )
  ]
]
