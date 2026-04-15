#import "../../Template/definitions.typ": *
#import "../../Template/template.typ": hszg-green, chapter-title-slide

#chapter-title-slide(section-name: [Polygon Meshes])

#slide[
  = Surfaces
  #set align(horizon)
  Klassisch und allgegenwärtig in Computergrafik
  - Erstellen polygonaler Objekte ist unkompliziert
  - Es gibt visuell eﬃziente Algorithmen zur Erzeugung schattierter Bilder
  - Eine Maschinendarstellung, konvertiert aus anderen Benutzerdarstellungen wie parametrische/impliziten Oberﬂächen, CSG/Volumen
  Schwierigkeiten bei Polygon Meshes:
  - geometrische Genauigkeit
  - Formmanipulation
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
  = Polygon Meshes
  #set align(horizon)
  #toolbox.side-by-side()[
    *Definition:*
    - Ein Polygon ist eine vielseitige, ebene Figur, die aus Eckpunkten und Kanten besteht.
    - Vertices werden durch Punkte (x,y) dargestellt (x,y,z in 3D)
    - Edges/Kanten werden als Liniensegmente dargestellt, die zwei Punkte verbinden: (x1,y1) und (x2,y2)
  ][
    #figure()[
      #image("../../Images/polygon_specifications.png", fit: "contain")
    ]
  ]
]

#slide[
  = Konvexe Polygone
  #set align(horizon)
  - Konvexes Polygon - Bei zwei beliebigen Punkten P1, P2 innerhalb des Polygons befinden sich alle Punkte, die auf dem Liniensegment zwischen P1 und P2 liegen, innerhalb des Polygons.
  - Alle Punkte $ P = u times "P1" plus (1 minus u) times "P2", u in [0,1] $ liegen innerhalb des Polygons, vorausgesetzt, dass P1 und P2 innerhalb des Polygons liegen
]

#slide[
  = Konkave Polygone
  #set align(horizon)
  - Konkaves Polygon - Ein Polygon, das nicht konvex ist.
  #v(150pt)
  #set align(center)
  #text(weight: "light", fill: gray)[Well no shit, captain obvious!]
]

#slide[
  = (Nicht) Einfache Polygone
  #set align(horizon)
  - *Einfache Polygone* - Polygone, deren Kanten sich nicht kreuzen
  - *Nicht einfache Polygone* - Polygone, deren Kanten sich kreuzen
    - Zwei verschiedene OpenGL-Implementierungen können nicht einfache Polygone unterschiedlich darstellen. OpenGL prüft nicht, ob Polygone einfach sind.
  - Dreieck / Triangle
    - Polygon garantiert konvex und einfach (und planar in 3D)
  #figure()[
    #image("../../Images/polygons_non_easy.png", fit: "contain")
  ]
]
