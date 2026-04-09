#import "../../../Template/definitions.typ": *
#import "../../../Template/template.typ": subchapter-title-slide

#let chapter_name = [Z-Buffer]
#subchapter-title-slide(section-name: chapter_name)

#slide[
  = Z-Buffer
  #set align(horizon)
  - Buffer mit Pixel-Informationen
    - Bild-Buffer, mit Pixelfarbe
    - Z-Buffer, mit Pixeltiefeninformationen
  - Polygone werden in beliebiger Reihenfolge gerendert
  - Alle Polygone werden gerendert
  - Z-Buffer wird verwendet, um bei Überlappungen zu entscheiden welches Polygon Pixel _bekommt_
  - Kein Sortieren notwendig
  
  #figure()[
    #image("../../../Images/z-buffer.png", fit: "contain")
  ]
]

#slide[
  = Z-Buffer
  #set align(horizon)
  - sehr schnell 
  - In fast allen Grafikkarten implementiert
  - kann aber kein Anti-Aliasing durchführen
    - erfordert die Kenntnis aller an einem bestimmten Pixel beteiligten Polygone
  - Problem: *Z-Fighting*
]

#slide[
  = #chapter_name
  == Z-Fighting
  #set align(horizon)
  - kann im Falle von komplanaren Polygonen auftreten (Abbildung)
  - kann durch eine begrenzte Auﬂösung des Tiefenpuﬀers verursacht werden (z.B. 16 Bit)
  #figure(
    image("../../../Images/z_fighting.png", fit: "contain", width: 60%),
    caption: [Z-Fighting zwischen einer _Plane_ und einem _Cube_]
  )
]

#slide[
  = Z-Buffer
  == Beispiel
  #set align(horizon + center)
  #grid(
    columns: (auto, 1fr),
    grid.cell()[
      Aktuelle Z-Depth: $1.0$
      #v(15pt)
      Je kleiner die Z-Depth, \
      desto näher ist das Objekt \ 
      an der Kamera
    ], grid.cell()[
      #cetz.canvas({
        import cetz.draw: *
        circle((0, 0), fill: red.lighten(100%), stroke: red.lighten(100%) + 5pt, radius: (5, 5), name: "sphere")
        rect((-1, -1), (-2, -2), stroke: 5pt, name: "pixel")
        content((5, 7), text()[Pixel auf dem Bildschirm], name: "sphere_depth")
        line((-1, -1), "sphere_depth", stroke: 2.5pt)
      })
    ]
  )
]

#slide[
  = Z-Buffer
  == Beispiel
  #set align(horizon + center)
  #grid(
    columns: (auto, 1fr),
    grid.cell()[
      Aktuelle Z-Depth: $1.0$ \
      #v(15pt)
      $1.0 gt 0.6$
      #v(15pt)
      Neue Z-Depth: $0.6$
    ], grid.cell()[
      #cetz.canvas({
        import cetz.draw: *
        circle((0, 0), fill: red.lighten(50%), stroke: red + 5pt, radius: (5, 5), name: "sphere")
        rect((-1, -1), (-2, -2), stroke: 5pt, name: "pixel")
        content((5, 7), text()[Tiefe der #text(fill: red, weight: "bold")[Sphere] ist $0.6$], name: "sphere_depth")
        line((-1, -1), "sphere_depth", stroke: 2.5pt)
      })
    ]
  )
]

#slide[
  = Z-Buffer
  == Beispiel
  #set align(horizon + center)
  #grid(
    columns: (auto, 1fr),
    grid.cell()[
      Aktuelle Z-Depth: $0.6$ \
      #v(15pt)
      $0.6 gt 0.3$
      #v(15pt)
      Neue Z-Depth: $0.3$
    ], grid.cell()[
      #cetz.canvas({
        import cetz.draw: *
        circle((0, 0), fill: red.lighten(50%), stroke: red + 5pt, radius: (5, 5), name: "sphere")
        rect((-6, -6), (0, 0), stroke: 5pt + blue, fill: blue.lighten(50%))
        rect((-1, -1), (-2, -2), stroke: 5pt, name: "pixel")
        content((5, 7), text()[Tiefe des #text(fill: blue, weight: "bold")[Cubes] ist $0.3$], name: "sphere_depth")
        line((-1, -1), "sphere_depth", stroke: 2.5pt)
      })
    ]
  )
]

#slide[
  = Z-Buffer
  == Beispiel
  #set align(horizon + center)
  #grid(
    columns: (auto, 1fr),
    grid.cell()[
      Aktuelle Z-Depth: $0.3$ \
      #v(15pt)
      $0.9 gt 0.3$
      #v(15pt)
      Neue Z-Depth: $0.3$
    ], grid.cell()[
      #cetz.canvas({
        import cetz.draw: *
        line((-7, -7), (-2, 5), (8, 5), (3, -7), close: true, fill: green.lighten(50%), stroke: green + 5pt)
        circle((0, 0), fill: red.lighten(50%), stroke: red + 5pt, radius: (5, 5), name: "sphere")
        rect((-6, -6), (0, 0), stroke: 5pt + blue, fill: blue.lighten(50%))
        rect((-1, -1), (-2, -2), stroke: 5pt, name: "pixel")
        content((5, 6), text()[Tiefe der #text(fill: green, weight: "bold")[Plane] ist $0.9$], name: "sphere_depth")
        line((-1, -1), "sphere_depth", stroke: 2.5pt)
      })
    ]
  )
]
