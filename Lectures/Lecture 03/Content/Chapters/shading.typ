#import "../../Template/definitions.typ": *
#import "../../Template/template.typ": hszg-green, chapter-title-slide, subchapter-title-slide
#import "@preview/cetz:0.5.2"

#chapter-title-slide(section-name: [Shading])

#slide[
  = Shading
  #set align(horizon)
  
  - Shading (Schattierung) beschreibt Oberflächeneigenschaften von Objekten
  - Berechnung der Normalenvektoren über Interpolation im Polygonnetz
  - Ziel: glattere, organischere Darstellung von Objekten

  #figure(
    image("../../Images/flat_phong_shading.png"),
    caption: [
      Unterschiedliche Renderergebnisse bei Flat- und Phong-Shading.
    ]
  )
]

#slide[
  = Shading Modelle
  #set align(horizon)

  - Bestimmung des Farbtons eines Objektpunktes oder Pixels durch Anwendung des Beleuchtungsmodells
  - Im Idealfall sollte der Renderer das Beleuchtungsmodell an jedem sichtbaren Punkt auf jeder Oberfläche anwenden
    - Dieser Ansatz kann zu viele Berechnungen erfordern
  - Alternative:
    - Anwendung von Beleuchtungsmodell auf Teilmenge von Punkten
    - Interpolation der Intensität der anderen Punkte
    - Anwendung des Beleuchtungsmodells nur auf sichtbare Flächen
  - Die Modelle sind nur grob physikalisch und betonen empirischen Erfolg und Effizienz
]

#subchapter-title-slide(section-name: [Shading Modelle])

// #slide[
//   = Flat Shading
//   #set align(horizon)

//   - Abtasten der Beleuchtung an einem Punkt pro Polygon
//   - Verwenden konstanter Interpolation
//   - Alle anderen Punkte des Polygons erhalten die Intensität dieses Punktes
  
//   Dieser Ansatz wäre gültig, wenn:
//   - die wahre Oberfläche wirklich facettiert ist, also $N$ konstant ist, und
//   - die Lichtquelle im Unendlichen ist, so dass $L$ konstant ist, und
//   - der Betrachter sich im Unendlichen befindet, so dass $V$ konstant ist.
// ]

#slide[
  = Flat Shading
  #set align(horizon)

  - Berechnung der Farbe für jedes Face, basierend auf einer einzelnen Lichtberechnung
  - Farbe wird auf das komplette Face angewendet
  - Farbe wird bestimmt durch den Winkel zwischen der Face-Normalen und der Lichtquelle

  #figure(
    image("../../Images/flat_shading_torus.png", width: 50%)
  )
]

#slide[
  = Flat Shading
  === Eigenschaften
  #set align(horizon)

  - *Berechnung*: Eine Lichtberechnung pro Polygon
  - *Aussehen*: Erstellt einen facettenreiches Aussehen, bei dem jedes Face eine einheitliche Farbe hat
  - *Performance*: Schnellste der drei Techniken
  - *Use-Case*: Einfache, low-poly Modelle, bei denen das facettierte Aussehen gewünscht ist
]

// #slide[
//   = Gouraud Shading
//   #set align(horizon)

//   - Anwendung des Beleuchtungsmodells an jeder Vertex \ (Beispiel: $I_(1)$, $I_(2)$, $I_(3)$)
//   - Intensitäten als Teil der Scan-Konvertierung interpoliert
//     - Interpolieren der Spannenendpunkte aus Kantenscheitelpunkten (Beispiel: $I_(a)$, $I_(b)$)
//     - Interpolieren von Punkten innerhalb einer Spannweite aus Spannweitenendpunkten (Beispiel: $I_(p)$)
  
//   #figure(
//     cetz.canvas(length: 5cm, {
//       import cetz.draw: *

//       line(
//         (0, 0), 
//         (1, 1), 
//         (2, 0), 
//         close: true, 
//         stroke: (
//           paint: hszg-green, 
//           thickness: 2.5pt,
//           join: "round"
//         ), 
//         fill: hszg-green.lighten(90%)
//       )
//       line(
//         (0, 0.5), 
//         (2, 0.5), 
//         stroke: (
//           thickness: 2.5pt, 
//           dash: "loosely-dashed",
//           cap: "round"
//         )
//       )

//       circle((1, 0.5), radius: 5pt, name: "Ip", fill: black)
//       content("Ip.south", [$I_(p)$], padding: (top: 35pt))

//       circle((0.5, 0.5), radius: 5pt, name: "Ia", fill: black)
//       content("Ia.north", [$I_(a)$], padding: (bottom: 25pt, right: 25pt))

//       circle((1.5, 0.5), radius: 5pt, name: "Ib", fill: black)
//       content("Ib.north", [$I_(b)$], padding: (bottom: 25pt, left: 25pt))

//       content((0, 0), [$I_(2)$], padding: (right: 25pt))
//       content((2, 0), [$I_(3)$], padding: (left: 25pt))
//       content((1, 1), [$I_(1)$], padding: (bottom: 25pt))
//     })
//   )
// ]

#slide[
  = Gouraud Shading
  #set align(horizon)

  - Lichtberechnungen werden an allen Vertices der Polygone berechnet
  - Die Farben an den Vertices werden interpoliert über die Fläche des Polygons
  - Erstellt einen Gradienten auf jedem Face

  #figure(
    image("../../Images/gouraud_shading_torus.png", width: 50%)
  )
]

#slide[
  = Gouraud Shading
  === Eigenschaften
  #set align(horizon)
  #v(1fr)
  - *Berechnung*: Berechnung an alles Vertices
  - *Aussehen*: Weichere Übergänge zwischen Farben, dadurch weniger Facetten als bei Flat Shading
  - *Performance*: Langsamer als Flat Shading aber schneller als Phong, da es Interpolation nutzt, aber weniger Lichtberechnungen
  - *Use-Case*: Weiches Shading ist gewollt, aber Performance ist ein kritischer Faktor
  #v(1fr)
  *Allerdings*: Fehler an den Kanten der Polygonen oft vorhanden
  #v(1fr)
]

#slide[
  = Phong Shading
  #set align(horizon)

  Verbessert das Gouraud-Schattierungsmodell
  - Anwenden des Beleuchtungsmodells auf jeden Pixel
  - Dies erfordert eine Normale $N$ an jedem Pixel
  - $N$ an jedem Pixel wird aus den Normalen des Polygons interpoliert
  // Gouraud wendet das Beleuchtungsmodell an jedem Scheitelpunkt an, dann interpoliert es den Pixelwert
  // - Dies erfordert eine Normale nur an den Scheitelpunkten

  #figure(
    image("../../Images/phong_shading_torus.png", width: 60%)
  )

  // #figure(
  //   cetz.canvas(length: 5cm, {
  //     import cetz.draw: *

  //     line(
  //       (0, 0), 
  //       (1, 1), 
  //       (2, 0), 
  //       close: true, 
  //       stroke: (
  //         paint: hszg-green, 
  //         thickness: 2.5pt,
  //         join: "round"
  //       ), 
  //       fill: hszg-green.lighten(90%)
  //     )
  //     line(
  //       (0, 0.5), 
  //       (2, 0.5), 
  //       stroke: (
  //         thickness: 2.5pt, 
  //         dash: "loosely-dashed",
  //         cap: "round"
  //       )
  //     )

  //     circle((1, 0.5), radius: 5pt, name: "Np", fill: black)
  //     content("Np.south", [$N_(p)$], padding: (top: 35pt))

  //     circle((0.5, 0.5), radius: 5pt, name: "Na", fill: black)
  //     content("Na.north", [$N_(a)$], padding: (bottom: 25pt, right: 25pt))

  //     circle((1.5, 0.5), radius: 5pt, name: "Nb", fill: black)
  //     content("Nb.north", [$N_(b)$], padding: (bottom: 25pt, left: 25pt))

  //     content((0, 0), [$N_(2)$], padding: (right: 25pt))
  //     content((2, 0), [$N_(3)$], padding: (left: 25pt))
  //     content((1, 1), [$N_(1)$], padding: (bottom: 25pt))
  //   })
  // )
]

// #slide[
//   = Phong Shading
//   #set align(horizon)

//   Interpolation der Normalen eines Pixels, $N$, als Teil der Scan-Konvertierung
//   - Um $N$ an den Endpunkten eines Bereichs zu erhalten, interpoliert Sie aus den Normalen der Kantenscheitelpunkte
//   - Um $N$ innerhalb eines Bereichs zu erhalten, wird von den Endpunkten des Bereichs interpoliert
// ]

#slide[
  = Phong Shading
  #set align(horizon)
  #grid(
    columns: (1fr, 0.75fr),
    [
      Dieser Ansatz vermeidet einige Fehler bei der spiegelden Beleuchtungsfehler, die bei Gouraud Schattierung auftreten
      - Gouraud verpasst Glanzlichter innerhalb von Polygonen
      - Gouraud streut Glanzlichter entlang Kanten, wenn ein Glanzlicht am Scheitelpunkt eines Polygons auftritt

      4-5 mal langsamer als Gouraud-Schattierung aber heute sehr verbreitet
    ], [
      #figure(
        image("../../Images/grouraud_sphere.png", width: 60%),
        caption: [
          Eine Sphere, die mit Gouraud schattiert wurde. Man beachte die Fehler an den Kanten der Polygone.
        ]
      )
    ]
  )
]

#slide[
  = Phong Shading
  === Eigenschaften
  #set align(horizon)

  - *Berechnungen*: Lichtberechnungen werden an allen Pixel berechnet
  - *Aussehen*: Realistisches und weiches Shading mit akkuraten Highlights und Reflektionen
  - *Performance*: Langsamstes Modell mit den meisten Berechnungen
  - *Use-Case*: High-Quality Renderings, zum Beispiel: Animationsfile oder Spiele
]

// #slide[
//   = Phong Shading
//   #set align(horizon)

//   - Lichtberechnungen werden pro Pixel berechnet
//   - Interpolation der Flächennormalen und daraus Berechnung der Farben

//   #figure(
//     image("../../Images/phong_shading_torus.png", width: 60%)
//   )
// ]

#slide[
  = Shading
  #set align(horizon)

  #grid(
    columns: (1fr, 1fr, 1fr),
    align: top,
    inset: 5pt,
    [
      #grid(
        inset: 15pt,
        columns: (1fr),
        stroke: hszg-green + 2.5pt,
        grid.cell(fill: hszg-green)[
          #set align(center)
          Flat Shading
        ], grid.cell(fill: hszg-green.lighten(90%))[
          keine Interpolation, Farbe für gesamtes Polygon durch einzelnen Vertex bestimmt
          #v(1fr)
          #align(center)[
            #image("../../Images/shading_comp/flat_shading.png", fit: "contain")
          ]
          #v(20pt)
        ]
      )
    ], [
      #grid(
        inset: 15pt,
        columns: (1fr),
        stroke: hszg-green + 2.5pt,
        grid.cell(fill: hszg-green)[
          #set align(center)
          Gouraud Shading
        ], grid.cell(fill: hszg-green.lighten(90%))[
          Lichtintensität wird an jedem Scheitelpunkt berechnet und über die Oberfläche interpoliert
          #v(1fr)
          #align(center)[
            #image("../../Images/shading_comp/gouraud_shading.png", fit: "contain")
          ]
          #v(20pt)
        ]
      )
    ], [
      #grid(
        inset: 15pt,
        columns: (1fr),
        stroke: hszg-green + 2.5pt,
        grid.cell(fill: hszg-green)[
          #set align(center)
          Phong Shading
        ], grid.cell(fill: hszg-green.lighten(90%))[
          Die Normalen werden über die Oberfläche interpoliert, die Lichtintensität wird für jedes Pixel berechnet
          #v(1fr)
          #align(center)[
            #image("../../Images/shading_comp/phong_shading.png", fit: "contain")
          ]
          #v(20pt)
        ]
      )
    ]
  )
]
