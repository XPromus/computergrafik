#import "../../Template/definitions.typ": *
#import "../../Template/template.typ": hszg-green
#import "../../Components/chapter_titile_slide.typ": chapter-title-slide

#chapter-title-slide(section-name: [LOD], title-text: "Level of Detail")

#slide[
  = Continuous Level of Detail (CLOD)
  #set align(horizon)
  #toolbox.side-by-side()[
    - Modell mit mehreren Auﬂösungen, das durch Vereinfachung des ursprünglichen Modells (in der linken oberen Ecke) erhalten wurde
    - Anzahl der Dreiecke beträgt jeweils
      - 96966
      - 13334
      - 3334
      - 668
  ][
    #image("../../Images/clod_1.png", fit: "contain")
  ]
]

#slide[
  = Level of Detail
  == Switch-LoD
  #set align(horizon)
  - Einfachste Form zur Anwendung von LoD-Stufen
  - Harte Abstandsgrößen deﬁnieren Anzeige der Detailstufen

  #let textbox(
    textContent, 
    originX: int, 
    originY: int, 
    width: int, 
    height: int
  ) = {
    import cetz.draw: *

    rect(
      (originX, originY), 
      (originX + width, originY + height),
      fill: gray,
      name: "textbox"
    )

    content("textbox", [#textContent])
  }

  #figure()[
    #cetz.canvas({
      import cetz.draw: *
      circle((-1, 0), fill: black, radius: 5pt)
      content((-1, -1))[Auge]

      line((-1, 0), (20, 0), mark: (end: "straight"))

      line((5, -0.5), (5, 5.5))
      content((5, -1))[$r_1$]
      
      line((10, -0.5), (10, 3.5))
      content((10, -1))[$r_2$]
      
      line((15, -0.5), (15, 1.5))
      content((15, -1))[$r_3$]

      line((-0.25, 0.5), (17.5, 0.5), mark: (end: "straight"))
      line((-0.25, 2.5), (12.5, 2.5), mark: (end: "straight"))
      line((-0.25, 4.5), (7.5, 4.5), mark: (end: "straight"))

      line((0, 0.25), (0, 2), mark: (end: "straight"))
      line((0, 2.25), (0, 4), mark: (end: "straight"))
      line((0, 4.25), (0, 6), mark: (end: "straight"))

      line((-0.25, 1.5), (0.25, 1.5))
      line((-0.25, 3.5), (0.25, 3.5))
      line((-0.25, 5.5), (0.25, 5.5))

      textbox(originX: 10, originY: 0.5, width: 5, height: 1)[*LOD 3*]
      textbox(originX: 5, originY: 2.5, width: 5, height: 1)[*LOD 2*]
      textbox(originX: 0, originY: 4.5, width: 5, height: 1)[*LOD 1*]

      content((-1, 0.5))[#text(size: 15pt, weight: "bold")[0%]]
      content((-1, 1.5))[#text(size: 15pt, weight: "bold")[100%]]

      content((-1, 2.5))[#text(size: 15pt, weight: "bold")[0%]]
      content((-1, 3.5))[#text(size: 15pt, weight: "bold")[100%]]

      content((-1, 4.5))[#text(size: 15pt, weight: "bold")[0%]]
      content((-1, 5.5))[#text(size: 15pt, weight: "bold")[100%]]
    })
  ]
]

#slide[
  = Level of Detail
  == Fade-LoD
  #set align(horizon)
  - "Überblendtechnik", um LoD-Stufen optisch zu verschmelzen
  - Verschmelzung durch Farb-Mischung / alpha blending

  #let textbox(
    textContent, 
    originX: int, 
    originY: int, 
    width: int, 
    height: int,
    drawBack: bool
  ) = {
    import cetz.draw: *

    rect(
      (originX, originY), 
      (originX + width, originY + height),
      fill: gray,
      name: "textbox"
    )

    line(
      (originX + width, originY),
      (originX + width + 2, originY),
      (originX + width, originY + 1),
      (originX + width, originY),
      fill: gray,
    )

    if drawBack == true {
      line(
        (originX, originY),
        (originX - 2, originY),
        (originX, originY + 1),
        (originX, originY),
        fill: gray,
      )
    }
    
    content("textbox", [#textContent])
  }

  #figure()[
    #cetz.canvas({
      import cetz.draw: *
      circle((-1, 0), fill: black, radius: 5pt)
      content((-1, -1))[Auge]

      line((-1, 0), (20, 0), mark: (end: "straight"))

      line((5, -0.5), (5, 5.5))
      content((5, -2))[$r_1$]
      
      line((10, -0.5), (10, 3.5))
      content((10, -2))[$r_2$]
      
      line((15, -0.5), (15, 1.5))
      content((15, -2))[$r_3$]

      line((-0.25, 0.5), (17.5, 0.5), mark: (end: "straight"))
      line((-0.25, 2.5), (12.5, 2.5), mark: (end: "straight"))
      line((-0.25, 4.5), (7.5, 4.5), mark: (end: "straight"))

      line((0, 0.25), (0, 2), mark: (end: "straight"))
      line((0, 2.25), (0, 4), mark: (end: "straight"))
      line((0, 4.25), (0, 6), mark: (end: "straight"))

      line((-0.25, 1.5), (0.25, 1.5))
      line((-0.25, 3.5), (0.25, 3.5))
      line((-0.25, 5.5), (0.25, 5.5))

      textbox(originX: 11, originY: 0.5, width: 3, height: 1, drawBack: true)[*LOD 3*]
      textbox(originX: 6, originY: 2.5, width: 3, height: 1, drawBack: true)[*LOD 2*]
      textbox(originX: 0, originY: 4.5, width: 4, height: 1)[*LOD 1*]

      content((-1, 0.5))[#text(size: 15pt, weight: "bold")[0%]]
      content((-1, 1.5))[#text(size: 15pt, weight: "bold")[100%]]

      content((-1, 2.5))[#text(size: 15pt, weight: "bold")[0%]]
      content((-1, 3.5))[#text(size: 15pt, weight: "bold")[100%]]

      content((-1, 4.5))[#text(size: 15pt, weight: "bold")[0%]]
      content((-1, 5.5))[#text(size: 15pt, weight: "bold")[100%]]

      line((4, -0.5), (4, 5.5), stroke: (dash: "dashed"))
      line((6, -0.5), (6, 5.5), stroke: (dash: "dashed"))
      line((4, -0.5), (6, -0.5), mark: (end: "straight", start: "straight"))
      rect((4, 0), (6, 0.5), fill: gray.transparentize(60%))
      content((5, -1))[$"fade"_1$]

      line((9, -0.5), (9, 3.5), stroke: (dash: "dashed"))
      line((11, -0.5), (11, 3.5), stroke: (dash: "dashed"))
      line((9, -0.5), (11, -0.5), mark: (end: "straight", start: "straight"))
      rect((9, 0), (11, 0.5), fill: gray.transparentize(60%))
      content((10, -1), fill: white)[$"fade"_2$]

      line((14, -0.5), (14, 1.5), stroke: (dash: "dashed"))
      line((16, -0.5), (16, 1.5), stroke: (dash: "dashed"))
      line((14, -0.5), (16, -0.5), mark: (end: "straight", start: "straight"))
      rect((14, 0), (16, 0.5), fill: gray.transparentize(60%))
      content((15, -1))[$"fade"_3$]
    })
  ]
]

#slide[
  = Level of Detail
  == Morph-LoD
  #set align(horizon)
  - Kontinuierliche Formveränderung zwischen LoD-Stufen
  - Bei komplexen Modellen erheblicher Rechenaufwand $->$ Vertex Shader

  #let textbox(
    textContent, 
    originX: int, 
    originY: int, 
    width: int, 
    height: int,
    drawBack: bool
  ) = {
    import cetz.draw: *

    rect(
      (originX, originY), 
      (originX + width, originY + height),
      fill: gray,
      name: "textbox"
    )

    rect(
      (originX + width, originY), 
      (originX + width + 2, originY + height),
      fill: gray,
    )
    
    content("textbox", [#textContent])
  }

  #figure()[
    #cetz.canvas({
      import cetz.draw: *
      circle((-1, 0), fill: black, radius: 5pt)
      content((-1, -1))[Auge]

      line((-1, 0), (20, 0), mark: (end: "straight"))

      line((5, -0.5), (5, 5.5))
      content((5, -2))[$r_1$]
      
      line((10, -0.5), (10, 3.5))
      content((10, -2))[$r_2$]
      
      line((15, -0.5), (15, 1.5))
      content((15, -2))[$r_3$]

      line((-0.25, 0.5), (17.5, 0.5), mark: (end: "straight"))
      line((-0.25, 2.5), (12.5, 2.5), mark: (end: "straight"))
      line((-0.25, 4.5), (7.5, 4.5), mark: (end: "straight"))

      line((0, 0.25), (0, 2), mark: (end: "straight"))
      line((0, 2.25), (0, 4), mark: (end: "straight"))
      line((0, 4.25), (0, 6), mark: (end: "straight"))

      line((-0.25, 1.5), (0.25, 1.5))
      line((-0.25, 3.5), (0.25, 3.5))
      line((-0.25, 5.5), (0.25, 5.5))

      textbox(originX: 10, originY: 0.5, width: 3, height: 1, drawBack: true)[*LOD 3*]
      textbox(originX: 5, originY: 2.5, width: 3, height: 1, drawBack: true)[*LOD 2*]
      textbox(originX: 0, originY: 4.5, width: 3, height: 1)[*LOD 1*]

      content((-1, 0.5))[#text(size: 15pt, weight: "bold")[0%]]
      content((-1, 1.5))[#text(size: 15pt, weight: "bold")[100%]]

      content((-1, 2.5))[#text(size: 15pt, weight: "bold")[0%]]
      content((-1, 3.5))[#text(size: 15pt, weight: "bold")[100%]]

      content((-1, 4.5))[#text(size: 15pt, weight: "bold")[0%]]
      content((-1, 5.5))[#text(size: 15pt, weight: "bold")[100%]]

      line((3, -0.5), (3, 5.5), stroke: (dash: "dashed"))
      line((3, -0.5), (5, -0.5), mark: (end: "straight", start: "straight"))
      rect((3, 0), (5, 0.5), fill: gray.transparentize(60%))
      content((4, -1))[#text(size: 15pt, weight: "bold")[morph]]

      line((8, -0.5), (8, 3.5), stroke: (dash: "dashed"))
      line((8, -0.5), (10, -0.5), mark: (end: "straight", start: "straight"))
      rect((8, 0), (10, 0.5), fill: gray.transparentize(60%))
      content((9, -1), fill: white)[#text(size: 15pt, weight: "bold")[morph]]

      line((13, -0.5), (13, 1.5), stroke: (dash: "dashed"))
      line((13, -0.5), (15, -0.5), mark: (end: "straight", start: "straight"))
      rect((13, 0), (15, 0.5), fill: gray.transparentize(60%))
      content((14, -1))[#text(size: 15pt, weight: "bold")[morph]]
    })
  ]
]

#slide[
  = Level of Detail
  == Morph-LoD
  #set align(horizon + center)
  #figure()[
    #let scale = 3

    #let bottomLeft = (0, 0)
    #let bottomRight = (1, 0)
    #let topLeft = (0.5, 1)
    #let topRight = (1.5, 1)

    #let getScaledPositionCustom(pos: (int, int), scale: int) = {
      return (pos.at(0) * scale, pos.at(1) * scale)
    }

    #let getScaledPosition(pos: (int, int)) = {
      return (pos.at(0) * scale, pos.at(1) * scale)
    }

    #let step1Diagram = [
      #cetz.canvas({
        import cetz.draw: *
        line(
          getScaledPosition(pos: bottomLeft), 
          getScaledPosition(pos: bottomRight),
          getScaledPosition(pos: (0.5, 0.2)),
          getScaledPosition(pos: bottomLeft), 
          fill: gray
        )
        line(
          getScaledPosition(pos: bottomLeft), 
          getScaledPosition(pos: topLeft),
          getScaledPosition(pos: (0.5, 0.2)),
          getScaledPosition(pos: bottomLeft), 
          fill: gray
        )
        line(
          getScaledPosition(pos: topRight), 
          getScaledPosition(pos: bottomRight),
          getScaledPosition(pos: (1, 0.8)),
          getScaledPosition(pos: topRight), 
          fill: gray
        )
        line(
          getScaledPosition(pos: topRight), 
          getScaledPosition(pos: topLeft),
          getScaledPosition(pos: (1, 0.8)),
          getScaledPosition(pos: topRight), 
          fill: gray
        )
        line(
          getScaledPosition(pos: (0.8, 0.8)), 
          getScaledPosition(pos: bottomRight),
          getScaledPosition(pos: (1, 0.8)),
          getScaledPosition(pos: (0.8, 0.8)), 
          fill: gray.darken(50%)
        )
        line(
          getScaledPosition(pos: (0.8, 0.8)), 
          getScaledPosition(pos: topLeft),
          getScaledPosition(pos: (1, 0.8)),
          getScaledPosition(pos: (0.8, 0.8)), 
          fill: gray.darken(50%)
        )
        line(
          getScaledPosition(pos: (0.8, 0.8)), 
          getScaledPosition(pos: topLeft),
          getScaledPosition(pos: (0.5, 0.2)),
          getScaledPosition(pos: (0.8, 0.8)), 
          fill: gray.lighten(50%)
        )
        line(
          getScaledPosition(pos: (0.8, 0.8)), 
          getScaledPosition(pos: bottomRight),
          getScaledPosition(pos: (0.5, 0.2)),
          getScaledPosition(pos: (0.8, 0.8)), 
          fill: gray.lighten(50%)
        )
      })
    ]

    #let step2Diagram = [
      #cetz.canvas({
        import cetz.draw: *
        line(
          getScaledPosition(pos: bottomLeft), 
          getScaledPosition(pos: bottomRight),
          getScaledPosition(pos: (0.5, 0.5)),
          getScaledPosition(pos: bottomLeft), 
          fill: gray
        )
        line(
          getScaledPosition(pos: bottomLeft), 
          getScaledPosition(pos: topLeft),
          getScaledPosition(pos: (0.5, 0.5)),
          getScaledPosition(pos: bottomLeft), 
          fill: gray
        )
        line(
          getScaledPosition(pos: topRight), 
          getScaledPosition(pos: bottomRight),
          getScaledPosition(pos: (1, 0.9)),
          getScaledPosition(pos: topRight), 
          fill: gray
        )
        line(
          getScaledPosition(pos: topRight), 
          getScaledPosition(pos: topLeft),
          getScaledPosition(pos: (1, 0.9)),
          getScaledPosition(pos: topRight), 
          fill: gray
        )
        line(
          getScaledPosition(pos: (0.8, 0.8)), 
          getScaledPosition(pos: bottomRight),
          getScaledPosition(pos: (1, 0.9)),
          getScaledPosition(pos: (0.8, 0.8)), 
          fill: gray.darken(50%)
        )
        line(
          getScaledPosition(pos: (0.8, 0.8)), 
          getScaledPosition(pos: topLeft),
          getScaledPosition(pos: (1, 0.9)),
          getScaledPosition(pos: (0.8, 0.8)), 
          fill: gray.darken(50%)
        )
        line(
          getScaledPosition(pos: (0.8, 0.8)), 
          getScaledPosition(pos: topLeft),
          getScaledPosition(pos: (0.5, 0.5)),
          getScaledPosition(pos: (0.8, 0.8)), 
          fill: gray.lighten(50%)
        )
        line(
          getScaledPosition(pos: (0.8, 0.8)), 
          getScaledPosition(pos: bottomRight),
          getScaledPosition(pos: (0.5, 0.5)),
          getScaledPosition(pos: (0.8, 0.8)), 
          fill: gray.lighten(50%)
        )
      })
    ]

    #let step3Diagram = [
      #let center = (0.75, 0.8)

      #cetz.canvas({
        import cetz.draw: *
        line(
          getScaledPosition(pos: bottomLeft), 
          getScaledPosition(pos: bottomRight),
          getScaledPosition(pos: center),
          getScaledPosition(pos: bottomLeft), 
          fill: gray.lighten(50%)
        )
        line(
          getScaledPosition(pos: bottomLeft), 
          getScaledPosition(pos: topLeft),
          getScaledPosition(pos: center),
          getScaledPosition(pos: bottomLeft), 
          fill: gray
        )
        line(
          getScaledPosition(pos: topLeft), 
          getScaledPosition(pos: topRight),
          getScaledPosition(pos: center),
          getScaledPosition(pos: topLeft), 
          fill: gray.darken(50%)
        )
        line(
          getScaledPosition(pos: topRight), 
          getScaledPosition(pos: bottomRight),
          getScaledPosition(pos: center),
          getScaledPosition(pos: topRight), 
          fill: gray
        )
      })
    ]

    #let step4Diagram = [
      #let center = (0.75, 0.5)

      #cetz.canvas({
        import cetz.draw: *
        line(
          getScaledPosition(pos: bottomLeft), 
          getScaledPosition(pos: bottomRight),
          getScaledPosition(pos: center),
          getScaledPosition(pos: bottomLeft), 
          fill: gray
        )
        line(
          getScaledPosition(pos: bottomLeft), 
          getScaledPosition(pos: topLeft),
          getScaledPosition(pos: center),
          getScaledPosition(pos: bottomLeft), 
          fill: gray
        )
        line(
          getScaledPosition(pos: topLeft), 
          getScaledPosition(pos: topRight),
          getScaledPosition(pos: center),
          getScaledPosition(pos: topLeft), 
          fill: gray
        )
        line(
          getScaledPosition(pos: topRight), 
          getScaledPosition(pos: bottomRight),
          getScaledPosition(pos: center),
          getScaledPosition(pos: topRight), 
          fill: gray
        )
      })
    ]

    #let step5Diagram = [
      #let center = (0.75, 0.5)

      #cetz.canvas({
        import cetz.draw: *
        line(
          getScaledPosition(pos: bottomLeft), 
          getScaledPosition(pos: bottomRight),
          getScaledPosition(pos: topRight),
          getScaledPosition(pos: bottomLeft), 
          fill: gray
        )
        line(
          getScaledPosition(pos: bottomLeft), 
          getScaledPosition(pos: topLeft),
          getScaledPosition(pos: topRight),
          getScaledPosition(pos: bottomLeft), 
          fill: gray
        )
      })
    ]

    #let step5Diagram = [
      #let center = (0.75, 0.5)

      #cetz.canvas({
        import cetz.draw: *
        line(
          getScaledPositionCustom(pos: bottomLeft, scale: 1), 
          getScaledPositionCustom(pos: bottomRight, scale: 1),
          getScaledPositionCustom(pos: topRight, scale: 1),
          getScaledPositionCustom(pos: bottomLeft, scale: 1), 
          fill: gray
        )
        line(
          getScaledPositionCustom(pos: bottomLeft, scale: 1), 
          getScaledPositionCustom(pos: topLeft, scale: 1),
          getScaledPositionCustom(pos: topRight, scale: 1),
          getScaledPositionCustom(pos: bottomLeft, scale: 1), 
          fill: gray
        )
      })
    ]

    #let step6Diagram = [
      #let center = (0.75, 0.5)
      #let customScale = 0.25

      #cetz.canvas({
        import cetz.draw: *
        line(
          getScaledPositionCustom(pos: bottomLeft, scale: customScale), 
          getScaledPositionCustom(pos: bottomRight, scale: customScale),
          getScaledPositionCustom(pos: topRight, scale: customScale),
          getScaledPositionCustom(pos: bottomLeft, scale: customScale), 
          fill: gray
        )
        line(
          getScaledPositionCustom(pos: bottomLeft, scale: customScale), 
          getScaledPositionCustom(pos: topLeft, scale: customScale),
          getScaledPositionCustom(pos: topRight, scale: customScale),
          getScaledPositionCustom(pos: bottomLeft, scale: customScale), 
          fill: gray
        )
      })
    ]

    #let stepSize = 0.75

    #diagram(
      node((0, 0))[
        #step1Diagram
      ],
      edge("-|>", bend: 60deg),
      node((stepSize * 1, 0))[
        #step2Diagram
      ],
      edge("-|>", bend: 60deg),
      node((stepSize * 2, 0))[
        #step3Diagram
      ],
      edge("-|>", bend: 60deg),
      node((stepSize * 3, 0))[
        #step4Diagram
      ],
      edge("-|>", bend: 60deg),
      node((stepSize * 4, 0))[
        #step5Diagram
      ],
      edge("-|>", bend: 60deg),
      node((stepSize * 5, 0))[
        #step6Diagram
      ]
    )    
  ]
]
