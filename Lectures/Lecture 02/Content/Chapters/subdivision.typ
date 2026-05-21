#import "../../Template/definitions.typ": *
#import "../../Template/template.typ": hszg-green, chapter-title-slide, subchapter-title-slide

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

#subchapter-title-slide(section-name: [Catmull-Clark])

#slide[
  = Catmull-Clark
  == Übersicht
  #set align(horizon)

  #grid(
    columns: (1fr, 1fr),
    [
      - Rekursiver Ansatz zur Verfeinerung von Meshes
      - Die fertige Mesh wird nur aus Vierecken bestehen und weicher aussehen als ursprünglich
      - Je mehr Durchgänge, desto abgerundeter wird die Mesh
    ], [
      #show figure.caption: it => [
        #text(size: 13pt, weight: "bold")[#it.supplement #context it.counter.display(it.numbering):] #it.body
      ]

      #figure(
        image("../../Images/catmull/overview.png", width: 60%),
        caption: text(size: 13pt)[
          3-stufige Subdivision an einem Würfel. 
          Mit jedem Schritt nähert sich der Würfel der Form einer Kugel an. 
        ]
      )
    ]
  )
]

#slide[
  = Catmull-Clark
  == Abfolge
  #set align(horizon)

  Für jedes Face wird ein #text(fill: blue)[_Face Point_] hinzugefügt. \
  Jeder #text(fill: blue)[_Face Point_] ist der Durchschnitt aller Punkte des jeweiligen Faces

  #figure(
    image("../../Images/catmull/step_1.png", width: 80%),
    caption: [
      Blaue Spheres als #text(fill: blue)[_Face Points_]
    ]
  )
]

#slide[
  = Catmull-Clark
  == Abfolge
  #set align(horizon)

  Für jede Edge wird ein #text(fill: fuchsia)[_Edge Point_] hinzugefügt. \
  Jeder #text(fill: fuchsia)[_Edge Point_]  ist der Durchschnitt der zwei benachbarten #text(fill: blue)[_Face Points_] $(A, F)$ und die beiden Endpunkte der Kante $(M, E)$.

  $ frac(A plus F plus M plus E, 4) $

  #figure(
    image("../../Images/catmull/step_2.png", width: 50%),
    caption: [
      Mangenta Würfel als #text(fill: fuchsia)[_Edge Points_] 
    ]
  )
]

#slide[
  = Catmull-Clark
  == Abfolge - _Vertex Points_
  #set align(horizon)
  #v(1fr)
  Erstelle neue #text(fill: hszg-green)[_Vertex Points_]. 
  Für jeden ursprünglichen Punkt $P$, nehme den Durchschnitt $F$ aller $n$ erstellen #text(fill: blue)[_Face Point_], deren Faces $P$ berühren und nehme den Durchschnitt $R$ aller $n$ Kanten-Mittelpunkte der ursprünglichen Kanten, die $P$ berühren. 
  Jeder ursprüngliche Punkt wird zum neuen #text(fill: hszg-green)[_Vertex Points_] $V$ verschoben.
  #v(1fr)
  $ V eq frac(F plus 2 R plus (n minus 3) P, n) $
  #v(1fr)
]

#slide[
  = Catmull-Clark
  == Abfolge - _Vertex Points_
  #set align(horizon)
  
  #figure(
    image("../../Images/catmull/step_3.png", width: 80%),
    caption: [
      Grüne Kegel als neue #text(fill: hszg-green)[_Vertex Points_]
    ]
  )
]

#slide[
  = Catmull-Clark
  == Abfolge - Erstellen von neuen _Edges_ und _Faces_
  #set align(horizon)

  1. Verbinde jeden neuen #text(fill: blue)[_Face Point_] mit den neuen #text(fill: fuchsia)[_Edge Points_] aller ursprünglichen Edges, die das ursprüngliche Face definieren

  #figure(
    image("../../Images/catmull/step_4.png", width: 70%),
    caption: [
      Neue Edges, 4 pro #text(fill: blue)[_Face Point_]
    ]
  )
]

#slide[
  = Catmull-Clark
  == Abfolge - Erstellen von neuen _Edges_ und _Faces_
  #set align(horizon)

  2. Verbinde jeden neuen #text(fill: hszg-green)[_Vertex Point_] mit den neuen #text(fill: fuchsia)[_Edge Points_]  aller ursprünglichen Kanten, die am ursprünglichen Knoten inzident sind

  *Inzident*: Eine Kante $e$ ist inzident zu einem Knoten $v$, wenn $v$ einer der Endpunkte von $e$ ist.

  #figure(
    image("../../Images/catmull/step_5.png", width: 60%),
    caption: [
      3 neue Edges pro Vertex
    ]
  )
]

#slide[
  = Catmull-Clark
  == Abfolge - Faces erstellen
  #set align(horizon)

  3. Definiere neue Faces, die von Edges umschlossen sind.

  #figure(
    image("../../Images/catmull/step_6.png", width: 80%),
    caption: [
      Finale Faces der Mesh
    ]
  )
]

#subchapter-title-slide(section-name: [Zusammenfassung])

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
    The HSDS mofifier implements Hierarchical subdivision Surfaces. 
    It is intended primarily as a ﬁnishing tool rather than as a modeling tool. 
    For best results, perform most of your modeling using low-polygon methods, and then use HSDS to add detail and adaptively reﬁne the model. \

    #text(weight: "light")[Quelle: 3DS Max Help]
  ]
]
