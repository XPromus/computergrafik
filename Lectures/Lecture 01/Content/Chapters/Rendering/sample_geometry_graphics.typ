#import "../../../Template/definitions.typ": *
#import "../../../Components/chapter_titile_slide.typ": chapter-title-slide

#slide[
  = Computergrafik Paradigmen
  #grid(
    columns: (1fr, 1fr),
    inset: 15pt,
    [
      #figure(
        image("../../../Images/sample_based_graphics.png", fit: "contain", width: 75%)
      )
      #align(center)[
        #text(
          weight: "bold"
        )[
          Sample-Based Graphics
        ]
      ]
      #v(10pt)
      - Diskrete _Samples_ werden für visuelle Informationen benutzt
      - Pixels werden durch digitalisierung von Bildern erstellt
      - Beispiele: Photoshop, GIMP, Krita
    ], [
      #figure(
        image("../../../Images/geometry_based_graphics.png", fit: "contain", width: 75%)
      )
      #align(center)[
        #text(weight: "bold")[
          Geometry-Based Graphics
        ] 
      ]
      #v(10pt)
      - Geometrisches Modell wird zusammen mit Darstellungs-Attributen erstellt
      - Modell wird gesampled zur Darstellung (rendering)
      - Für 2D: Illustrator, Inkscape
      - Für 3D: CAD, Blender, Maya
    ]
  )
]

#slide[
  = Sample-Based vs. Geometry-Based
  #set align(horizon)
  #grid(
    columns: (1fr, 1fr),
    [
      #figure(
        image("../../../Images/sample_geometry_comparison.png", fit: "contain")
      )
    ], [
      #grid(
        rows: (1fr, 1fr),
        align: horizon,
        inset: 15pt,
        [
          Für *Sample-Based* Grafiken ist der originale Datensatz selbst ein Sample (z.B. ein Foto). 
          Es kann keine bessere Auflösung als die des Originals erlangt werden.
        ], [
          #set align(top)
          Bei *Geometry-Based* Grafiken hat der Computer ein mathematisches bzw. geometrisches Modell als Basis. 
          Dieses Modell erlaubt Skalierung und Zoom ohne Qualitätsverlust.
        ]
      )
    ]
  )
]

#slide[
  = Kombinieren der Paradigmen
  #set align(horizon)
  #grid(
    columns: (1fr, auto, 1fr, auto, 1fr),
    inset: 30pt,
    [
      #image("../../../Images/character_without_texture.png", fit: "contain")
    ], [$plus$], [
      #image("../../../Images/minecraft_character_textures.png", fit: "contain")
    ], [$eq$], [
      #image("../../../Images/minecraft_steve.png", fit: "contain")
    ]
  )
  - Geometry-Based und Sample-Based Grafiken werden beim Rendering oft kombiniert
  - 3D Modell ist Geometry-Based
  - Texturen des Modells sind Sample-Based Grafiken
  - Verbesserte Qualität und Performance des Endprodukts
]

#slide[
  = Sampling für den Monitor
  #set align(horizon + center)
  #notice[Sampling zur finalen Darstellung][
    Immer wenn ein Bild auf einem Monitor dargestellt wird, muss Sampling durchgeführt werden. 
    Dabei ist es egal ob die Grafik, die wir darstellen wollen, Geometry-Based oder Sample-Based ist. 
    Die Grafik muss in die Pixel des Monitors _gepackt_ werden. 
    Geometry-Based Grafiken erlauben hier nur unlimitiertes Skalieren.
  ]
]
