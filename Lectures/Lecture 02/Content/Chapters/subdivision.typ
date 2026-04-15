#import "../../Template/definitions.typ": *
#import "../../Template/template.typ": hszg-green, chapter-title-slide

#chapter-title-slide(section-name: [Subdivision])

#slide[
  = Subdivision
  #set align(horizon)
  *Frage*: Wie macht man eine glatte Kurve? \

  *Antwort*: Schneiden der Ecken der Polyline so lange, bis Sie etwas erhalten, das keine Ecken mehr hat also glatt bzw. smooth ist.

  #figure()[
    #image("../../Images/subdivision.png", fit: "contain")
  ]
]

#slide[
  = Subdivision
  #set align(horizon)
  Eingenschaften:
  - Genau
  - Lokale Unterstützung von Problempunkten
  - Affine Invariante
  - Arbiträre Topologie
  - Garantierte Kontinuität
  - Effiziente Anzeige
]

#slide[
  = Subdivision
  #set align(horizon)
  Grobmaschiges Mesh & Unterteilungsregel
  - Glatte Oberfläche als Grenze der Folge von Verfeinerungen definieren
  #figure()[
    #image("../../Images/subdivision_2.png", fit: "contain")
  ]
]

#slide[
  = Subdivision
  == Loop Unterteilungsregel
  #set align(horizon)
  Jedes Dreieck in 4 Dreiecke verfeinern, indem jede Kante geteilt und neue Eckpunkte verbunden werden.

  #figure()[
    #cetz.canvas({
      import cetz.draw: *

      let scale = 5
      let emptyFill = white
      let fullFill = black

      content((0, 0), name: "normal")[
        #cetz.canvas({
          circle((0 * scale, 0 * scale), radius: 0.25, fill: emptyFill, name: "n1")
          circle((1 * scale, 0 * scale), radius: 0.25, fill: emptyFill, name: "n2")
          circle((0.5 * scale, 1 * scale), radius: 0.25, fill: emptyFill, name: "n3")

          line("n1", "n2")
          line("n1", "n3")
          line("n2", "n3")
        })
      ]

      content((10, 0), name: "subdivided")[
        #cetz.canvas({
          circle((0 * scale, 0 * scale), radius: 0.25, fill: emptyFill, name: "n1")
          circle((1 * scale, 0 * scale), radius: 0.25, fill: emptyFill, name: "n2")
          circle((0.5 * scale, 1 * scale), radius: 0.25, fill: emptyFill, name: "n3")

          line("n1", "n2")
          line("n1", "n3")
          line("n2", "n3")

          circle((1.5 * scale / 2, 1 * scale / 2), radius: 0.25, fill: fullFill, name: "nn1")
          circle((1 * scale / 2, 0 * scale / 2), radius: 0.25, fill: fullFill, name: "nn2")
          circle((0.5 * scale / 2, 1 * scale / 2), radius: 0.25, fill: fullFill, name: "nn3")

          line("nn1", "nn2")
          line("nn1", "nn3")
          line("nn2", "nn3")
        })
      ]

      line("normal", "subdivided", mark: (end: "stealth", fill: black, scale: 5))

    })
  ]
]

#slide[
  = Subdivision
  == Loop Unterteilungsregel
  #set align(horizon + center)
  #figure()[
    #image("../../Images/subdivision_loop.png", fit: "contain", width: 85%)
  ]
]

#slide[
  = Subdivision
  #set align(horizon)
  - Viele weitere Methoden möglich („Subdivision Zoo“)
  - Blender verwendet vor allem den Catmull-Clark Algorithmus
  #set align(horizon + center)
  #figure()[
    #image("../../Images/subdivision_3.png", fit: "contain")
  ]
]

#slide[
  = Subdivision
  == Catmull-Clark
  #set align(horizon + center)
  #figure()[
    #image("../../Images/subdivision_catmull.png", fit: "contain", width: 85%)
  ]
]

#slide[
  = Subdivision
  #set align(horizon)
  Alle Unterteilungsschemata haben 2 Schritte:
  1. *Aufspaltung oder Verfeinerungsschritt*: Topologische Regel, die neue Eckpunkte einführt und die Konnektivität modifiziert
  2. *Schritt der Mittelwertbildung oder Glättung*: Geometrische Regel, die die Positionen für neue oder alle Scheitelpunkte durch gewichtete Mittelwerte berechnet.
]

#slide[
  = Adaptive Subdivision
  #set align(horizon)
  Adaptive Approximation: Oberfläche wird nur dort unterteilt, wo die Topologie der Oberfläche mehr Details erfordet
  - Auswahl der kritischen Netzbereiche (Scheitelpunkte) von Hand
  - oder automatische Erkennung von gekrümmten (weiter unterteilen) vs. ﬂachen (nicht weiter unterteilen) Bereichen
]

#slide[
  = Polygonal Meshes vs. Subdivision
  #set align(horizon)
  - Erstellung einer Subdivision Surface durch Modifier
  - Zwei Arten werden unterstützt:
    - HSDS Modifier bringt hierarchische Subdivision Surfaces
    - MeshSmooth Modifier bringt Weichzeichnung
  - Modifier werden am besten als Finishing Tool genutzt

  #guideline[HSDS][
    The HSDS modiﬁer implements Hierarchical SubDivision Surfaces. 
    It is intended primarily as a ﬁnishing tool rather than as a modeling tool. 
    For best results, perform most of your modeling using low-polygon methods, and then use HSDS to add detail and adaptively reﬁne the model. \

    #text(weight: "light")[Quelle: 3DS Max Help]
  ]
]
