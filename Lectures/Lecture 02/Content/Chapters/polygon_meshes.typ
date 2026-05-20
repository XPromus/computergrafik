#import "../../Template/definitions.typ": *
#import "../../Template/template.typ": hszg-green, chapter-title-slide

#chapter-title-slide(section-name: [Polygon Meshes])

#include "polygon_meshes/definitions.typ"

#slide[
  = Polygon Meshes
  #set align(horizon)
  Klassisch und allgegenwärtig in Computergrafik
  - Erstellen polygonaler Objekte ist unkompliziert
  - Es gibt visuell eﬃziente Algorithmen zur Erzeugung schattierter Bilder,
  - Kann auf Basis anderer Daten erstellt werden
  Schwierigkeiten bei Polygon Meshes:
  - geometrische Genauigkeit
  - Formmanipulation

  #figure(
    image("../../Images/polygon_dolphin.png", width: 50%)
  )
]

#slide[
  = Polygon Meshes
  #set align(horizon)
  #toolbox.side-by-side()[
    Tori in verschiedenen Polygonauﬂösungsstufen:
    - (a) 50 Quads
    - (b) 200 Quads
    - (c) 3200 Quads
    - (d) 819200 Quads (da hier das Drahtgitter so fein ist, dass auf jedes Pixel mindestens eine Gitterlinie fällt, sieht es so aus, als ob der Torus eine geschlossene Oberfläche hätte)
  ][
    #figure()[
      #image("../../Images/tori_segments.png", fit: "contain")
    ]
  ]
]

#slide[
  = Polygon Meshes
  #set align(horizon + center)
  #figure()[
    #image("../../Images/polygon_modes.png", fit: "contain")
  ]
]

#slide[
  = Konvexe Polygone
  #set align(horizon)
  #v(1fr)
  - Bei zwei beliebigen Punkten $P_(1)$, $P_(2)$ innerhalb des Polygons befinden sich alle Punkte, die auf dem Liniensegment zwischen $P_(1)$ und $P_(2)$ liegen, innerhalb des Polygons.
  // - Alle Punkte $ P = u times P_(1) plus (1 minus u) times P_(2), u in [0,1] $ liegen innerhalb des Polygons, vorausgesetzt, dass $P_(1)$ und $P_(2)$ innerhalb des Polygons liegen
  #v(1fr)
  #figure(
    cetz.canvas(length: 7cm, {
      import cetz.draw: *

      line((0, 0), (1, 0), (0.7, 1), (-1, 1), close: true, stroke: 2.5pt)
      line((-0.3, 0.8), (0.2, 0.2), stroke: 2.5pt + hszg-green, name: "line")
      content("line.0%", [$P_(1)$], padding: (bottom: 35pt, right: 25pt))
      content("line.100%", [$P_(2)$], padding: (top: 35pt, left: 25pt))
    })
  )
  #v(1fr)
]

#slide[
  = Konkave Polygone
  #set align(horizon)
  #v(1fr)
  - Konkaves Polygon - Ein Polygon, das nicht konvex ist.
  #set align(center)
  #text(weight: "light", fill: gray)[Well no shit, captain obvious!]
  #v(1fr)
  #figure(
    cetz.canvas(length: 7cm, {
      import cetz.draw: *
      line((0, 0), (1, 0), (1, 1), (0, 1), (0.5, 0.5), close: true, stroke: 2.5pt)
      line((0.3, 0.9), (0.3, 0.1), stroke: 2.5pt + hszg-green, name: "line")
      line((0.3, 0.7), (0.3, 0.3), stroke: 2.5pt + red)
      content("line.0%", [$P_(1)$], padding: (left: 35pt))
      content("line.100%", [$P_(2)$], padding: (left: 35pt))
    })
  )
  #v(1fr)
]

#slide[
  = (Nicht) Einfache Polygone
  #set align(horizon)
  #v(1fr)
  - *Einfache Polygone* - Kanten kreuzen sich nicht
  - *Nicht einfache Polygone* - Kanten kreuzen sich
    - Zwei verschiedene OpenGL-Implementierungen können nicht einfache Polygone unterschiedlich darstellen. OpenGL prüft nicht, ob Polygone einfach sind.
  #v(1fr)
  Deshalb oft Triangles
    - Triangle-Polygon garantiert *konvex* und *einfach* (und planar in 3D)
  #v(1fr)
  #grid(
    columns: (1fr, 1fr, 1fr),
    inset: 10pt,
    align: center + top,
    [
      #figure(
        cetz.canvas(length: 3cm, {
          import cetz.draw: *

          line((0, 0.5), (0.5, 0), (0.5, 1), close: true, stroke: 2.5pt)
        })
      )
      Triangle
    ], [
      #figure(
        cetz.canvas(length: 3cm, {
          import cetz.draw: *

          line((0, 0), (1, 0), (1, 1), (0, 1), (0.5, 0.5), close: true, stroke: 2.5pt)
        })
      )
      Einfaches (konkaves) Polygon
    ], [
      #figure(
        cetz.canvas(length: 3cm, {
          import cetz.draw: *

          line((0, 0), (1, 1), (1, 0), (0, 1), close: true, stroke: 2.5pt)
        })
      )
      Nicht einfaches Polygon
    ]
  )
  #v(1fr)
]
