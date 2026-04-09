#import "../../Template/definitions.typ": *
#import "../../Components/chapter_titile_slide.typ": chapter-title-slide

#chapter-title-slide(section-name: [Mesh Representation], title-text: "Mesh Representation")

#slide[
  = Mesh Representation
  #set align(horizon)
  - Meshes können unterschiedlich abgespeichert und repräsentiert werden
  - Mesh Representations:
    - Independent Faces
    - Vertex and Face Table
    - Adjacency Lists
    - (Winged Edge)
]

#slide[
  = Mesh Representation
  #set align(horizon)
  - Independent Faces:
    - Jede Fläche listet Vertex-Koordinaten auf
      - Redundante Eckpunkte
      - Keine Topologie-Informationen
  - Vertex und Face-Table
    - Jede Fläche listet Vertex-Referenzen auf
      - Gemeinsam genutzte Eckpunkte, kompaktere Darstellung
      - Immer noch keine Topologie-Informationen
]

#slide[
  = Mesh Representation
  == Vertex und Face-Table
  #set align(horizon)

  #figure()[
    #canvas({
      let light-red = rgb("#f9c5c5")
      let light-orange = rgb("#f2ceaa")
      let light-blue = rgb("#b9d6f2")
      let light-teal = rgb("#b1e2d8")

      set-style(line: (stroke: 0.8pt))

      scope({
        custom-node((0, 0), 3, red.lighten(60%), "v3")
        custom-node((4, -0.5), 4, green.lighten(60%), "v4")
        custom-node((-2, -2), 1, blue.lighten(60%), "v1")
        custom-node((1, -3), 2, yellow.lighten(60%), "v2")
        custom-node((6, -3), 5, orange.lighten(60%), "v5")

        line("v3", "v1")
        line("v2", "v1")
        line("v3", "v2")
        line("v3", "v4")
        line("v2", "v5")
        line("v4", "v5")
        line("v2", "v4")

        content((-0.4, -1.5), $F_1$)
        content((1.5, -1.2), $F_2$)
        content((3.7, -2.2), $F_3$)
      })
    })
  ]

  #grid(
    columns: (1fr, 1fr),
    inset: 5pt,
    [
      #table(
        columns: (1fr, 1fr),
        inset: 5pt,
        align: horizon + center,
        table.cell(
          colspan: 2,
          fill: gray.darken(60%),
          [#text(fill: white)[*Vertex Table*]],
        ),
        [v1], [x1 y1 z1],
        [v2], [x2 y2 z2],
        [v3], [x3 y3 z3],
        [v4], [x4 y4 z4],
        [v5], [x5 y5 z5],
      )
    ],[
      #table(
        columns: (1fr, 1fr),
        inset: 5pt,
        align: horizon + center,
        table.cell(
          colspan: 2,
          fill: gray.darken(60%),
          [#text(fill: white)[*Face Table*]],
        ),
        [F1], [v1 v2 v3],
        [F2], [v2 v4 v3],
        [F3], [v2 v5 v4],
      )
    ]
  )  
]

#slide[
  = Mesh Representation
  #set align(horizon)
  *Adjacency Lists:* Alle Vertex-, Kanten- und Flächenadjazenzen speichern
  - Eﬃzientes Traversieren der Topologie
  - Zusätzlicher Speicher
  *Winged Edge*: Erweiterte Mesh-Darstellung
  - Speichert nur einige Adjazenzbeziehungen; kann auf Anfrage andere ableiten
  - Wenig zusätzlicher Speicherplatz (feste Datensätze)
]

#slide[
  = Mesh Representation
  == Adjacency Lists
  #set align(horizon + center)
  #figure()[
    #canvas({
      let light-red = rgb("#f9c5c5")
      let light-orange = rgb("#f2ceaa")
      let light-blue = rgb("#b9d6f2")
      let light-teal = rgb("#b1e2d8")

      let scale = 1.5

      set-style(line: (stroke: 0.8pt))

      scope({
        custom-node((0 * scale, 0 * scale), 3, red.lighten(60%), "v3")
        custom-node((4 * scale, -0.5 * scale), 4, green.lighten(60%), "v4")
        custom-node((-2 * scale, -2 * scale), 1, blue.lighten(60%), "v1")
        custom-node((1 * scale, -3 * scale), 2, yellow.lighten(60%), "v2")
        custom-node((6 * scale, -3 * scale), 5, orange.lighten(60%), "v5")

        line("v3", "v1")
        line("v2", "v1")
        line("v3", "v2")
        line("v3", "v4")
        line("v2", "v5")
        line("v4", "v5")
        line("v2", "v4")

        content((-0.4 * scale, -1.5 * scale), $F_1$)
        content((1.5 * scale, -1.2 * scale), $F_2$, name: "f2")
        content((3.7 * scale, -2.2 * scale), $F_3$)

        content((-1.2 * scale, -0.5 * scale), $e_1$)
        content((0.1 * scale, -1 * scale), $e_3$, name: "e3")
        content((-0.8 * scale, -2.7 * scale), $e_2$)
        content((3.7 * scale, -3.3 * scale), $e_6$)
        content((5.5 * scale, -1.5 * scale), $e_7$)
        content((2 * scale, 0.2 * scale), $e_4$)
        content((2.3 * scale, -2.4 * scale), $e_5$)

        content(
          (-7, 2), 
          frame: "rect",
          padding: 3.5pt,
          [
            #table(
              inset: 10pt,
              align: horizon,
              table.cell(
                fill: gray.darken(60%),
                [#text(fill: white)[$e_3$]]
              ),[
                $V_2$ $V_3$
              ],[
                $e_1$ $e_4$ $e_2$ $e_5$ $e_6$
              ],[
                $F_1$ $F_2$
              ]
            )
          ], 
          name: "e3_table"
        )

        line("e3", "e3_table")

        content(
          (8, 5), 
          frame: "rect",
          padding: 3.5pt,
          [
            #table(
              inset: 10pt,
              align: horizon,
              table.cell(
                fill: gray.darken(60%),
                [#text(fill: white)[$F_3$]]
              ),[
                $V_2$ $V_4$ $V_3$
              ],[
                $e_5$ $e_4$ $e_3$
              ],[
                $F_3$ $F_2$
              ]
            )
          ], 
          name: "f2_table"
        )

        line("f2", "f2_table")

        content(
          (2, 5), 
          frame: "rect",
          padding: 3.5pt,
          [
            #table(
              inset: 10pt,
              align: horizon,
              table.cell(
                fill: gray.darken(60%),
                [#text(fill: white)[$V_2$]]
              ),[
                $V_5$ $V_4$ $V_3$ $V_1$
              ],[
                $e_6$ $e_5$ $e_3$ $e_2$
              ],[
                $F_3$ $F_2$ $F_1$
              ]
            )
          ], 
          name: "v2_table"
        )

        line("v2", "v2_table")
      })
    })
  ]
]
