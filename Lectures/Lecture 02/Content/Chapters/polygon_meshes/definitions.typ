#import "../../../Template/definitions.typ": *
#import "../../../Template/template.typ": hszg-green, chapter-title-slide, subchapter-title-slide

//#subchapter-title-slide(section-name: [Definitionen])

#slide[
  = Polygon Meshes
  == Definitionen
  #set align(horizon)

  #definition[
    *Polygon* \
    Eine vielseitige, ebene Figur, die aus Vertices und Edges besteht. 
    Die Edges sind dabei in einer geschlossenen Kette miteinander verbunden.
  ]
]

#slide[
  = Polygon Meshes
  == Definitionen
  #set align(horizon)

  #definition[
    *Vertices* \
    Darstellung eines Punktes im 2D oder 3D Raum. 
    An einer Vertex kreuzen bzw. treffen sich zwei oder mehr Edges.
    #align(center)[$A(x, y)$ in 2D, $A(x,y,z)$ in 3D]
  ]
]

#slide[
  = Polygon Meshes
  == Definitionen
  #set align(horizon)

  #definition[
    *Edges* \
    Liniensegmente im 2D oder 3D Raum, die zwei Vertices, $A$ und $B$ miteinander verbinden.
    #align(center)[$(A_(x),A_(y))$ und $(B_(x),B_(y))$]
  ]
]
