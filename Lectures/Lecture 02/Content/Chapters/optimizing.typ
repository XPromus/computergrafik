#import "../../Template/definitions.typ": *
#import "../../Template/template.typ": hszg-green
#import "../../Components/chapter_titile_slide.typ": chapter-title-slide

#let cCircle(pos, custom_scale: int, name: str, cfill: color) = {
  import cetz.draw: *
  circle(pos, radius: 0.2, fill: cfill, name: name)
}

#let edgeCollapseOriginal = [
  #cetz.canvas({
    import cetz.draw: *
    let scale = 1

    cCircle((0 * scale, -1 * scale), custom_scale: scale, name: "n1", cfill: black)
    cCircle((0 * scale, 1 * scale), custom_scale: scale, name: "n2", cfill: black)
    cCircle((-1.5 * scale, 0 * scale), custom_scale: scale, name: "n3", cfill: black)
    cCircle((1.5 * scale, 0 * scale), custom_scale: scale, name: "n4", cfill: black)
    cCircle((1 * scale, -2 * scale), custom_scale: scale, name: "n5", cfill: black)
    cCircle((1 * scale, 2 * scale), custom_scale: scale, name: "n6", cfill: black)
    cCircle((-1 * scale, -2 * scale), custom_scale: scale, name: "n7", cfill: black)
    cCircle((-1 * scale, 2 * scale), custom_scale: scale, name: "n8", cfill: black)

    line("n1", "n2")
    line("n1", "n3")
    line("n1", "n4")
    line("n1", "n5")
    line("n1", "n7")

    line("n2", "n3")
    line("n2", "n4")
    line("n2", "n6")
    line("n2", "n8")

    line("n3", "n8")
    line("n3", "n7")

    line("n4", "n5")
    line("n4", "n6")

    line("n5", "n7")

    line("n6", "n8")

    line("n1.center", "n2.center", "n3.center", fill: hszg-green.transparentize(50%), close: true, stroke: hszg-green.darken(30%) + 2pt)

    line("n1.center", "n2.center", "n4.center", fill: hszg-green.transparentize(50%), close: true, stroke: hszg-green.darken(30%) + 2pt)
  })
]

#let edgeCollapseCollapsed = [
  #cetz.canvas({
    import cetz.draw: *
    let scale = 1

    cCircle((-1.5 * scale, 0 * scale), custom_scale: scale, name: "n3", cfill: black)
    cCircle((1.5 * scale, 0 * scale), custom_scale: scale, name: "n4", cfill: black)
    cCircle((0,0), custom_scale: scale, name: "n", cfill: hszg-green)
    cCircle((1 * scale, -2 * scale), custom_scale: scale, name: "n5", cfill: black)
    cCircle((1 * scale, 2 * scale), custom_scale: scale, name: "n6", cfill: black)
    cCircle((-1 * scale, -2 * scale), custom_scale: scale, name: "n7", cfill: black)
    cCircle((-1 * scale, 2 * scale), custom_scale: scale, name: "n8", cfill: black)

    for ii in range(3, 9) {
      line("n", "n" + str(ii))
    }

    line("n3", "n8")
    line("n3", "n7")

    line("n4", "n5")
    line("n4", "n6")

    line("n5", "n7")

    line("n6", "n8")
  })
]

#chapter-title-slide(section-name: [Optimierung], title-text: "Polygon Mesh Optimierung")

#slide[
  = Polygon Mesh Optimierung
  #set align(horizon)
  - Hauptnachteil von Polygonnetzen:
    - oft hohe Polygonanzahl zur Synthese eines Objekts für eine qualitativ hochwertige Edition
    - Heutige Modelle > 10 Mio Polygone möglich
  
  #v(30pt)

  #box(stroke: black + 1pt, inset: 15pt, radius: 10pt, fill: gray.lighten(80%))[
    #text(
      weight: "light",
    )[
      „It makes no sense to use 500 polygons in describing an object if it covers only 20 raster units on the display ... 
      For example, when we view the human body from a very large distance, we might need to present only specks for the eyes, or perhaps a block for the head, totally eliminating the eyes from consideration“

      _(James H. Clark, 1976)_
    ]
  ]
]

#slide[
  = Polygon Mesh Optimierung
  #set align(horizon)
  - Polygone auf ein Niveau reduzieren, das der geforderten Qualität angemessen ist
    - Anwendung: Grad der Detailannäherung
    - \[Clark76, Funkhouser93\]
    - VRML, OpenSceneGraph: LOD-Knoten
  - Problem: „PopUp-Eﬀekt“
  #figure()[
    #image("../../Images/lod_1.png", fit: "contain")
  ]
]

#slide[
  = Progressive Meshes
  == Edge Collapse
  #set align(horizon)
  *Idee*: Sequenz von Kanteneinbrüchen (edge collapses) anwenden
  - Erstellung einer Hierarchie von Objekten
  - Blender: Decimate Modiﬁer
  - In modernen Engines (bspw. UE4) teilweise integriert

  #let cCircle(pos, custom_scale: int, name: str, cfill: color) = {
    import cetz.draw: *
    circle(pos, radius: 0.2, fill: cfill, name: name)
  }
  #v(20pt)
  #figure()[
    #diagram(
      node((-2, 0), name: "original")[
        #edgeCollapseOriginal
      ],
      edge("-|>")[Edge Collapse],
      node((2, 0), name: "collapsed")[
        #edgeCollapseCollapsed
      ]
    )
  ]
]

#slide[
  = Progressive Meshes
  == Edge Collapse
  #set align(horizon + center)

  #figure()[
    #image("../../Images/lod_2_edge_collapse.png", fit: "contain")
  ]
]

#slide[
  = Progressive Meshes
  == Edge Collapse & Vertes Split
  #set align(horizon)

  *Welche Kanten sind auszuwählen*
  - einfache Heuristik: Kanten, die enge Polygone mit ähnlicher Orientierung verbinden
  - oder komplexere Heuristiken

  *Kantenkollaps ist umkehrbar!*
  - inverse Operation: Vertex Split
  - kann erforderliche Vertex-Informationen in einem gröberen Netz speichern
  - verlustfrei
]

#slide[
  = Progressive Meshes
  == Edge Collapse & Vertex Split
  #set align(horizon + center)

  #figure()[
    #diagram(
      node((-2, 0), name: <original>)[
        #edgeCollapseOriginal
      ],
      edge(<original>, "-|>", <collapsed>, bend: 30deg)[Edge Collapse],
      edge(<collapsed>, "-|>", <original>, bend: 30deg)[Vertex Split],
      node((2, 0), name: <collapsed>)[
        #edgeCollapseCollapsed
      ]
    )
  ]
]

#slide[
  = Progressive Meshes
  #set align(horizon)
  *Anwendung:*
  - continuous level of detail
  - progressive Übertragung / Transmission
  - selektive Verfeinerung, z.B. betrachterabhängig
  - Mesh compression
]
