#import "../../../Template/definitions.typ": *
#import "../../../Template/template.typ": *

#subchapter-title-slide(section-name: [Rendering Pipeline])

#slide[
  = Klassische Rendering-Pipeline
  #set align(horizon)
  - Pipeline = Arbeitsschritte zur Darstellung von 2D Graﬁken von 3D Objekten
  #figure()[
    #diagram(
      node-shape: rect, 
      node-inset: 10pt,
      node-stroke: 1pt,
      node((0, 0))[Anwendung],
      edge("-|>"),
      node((1, 0))[Geometrie],
      edge("-|>"),
      node((2, 0))[Rasterung],
      edge("-|>"),
      node((3, 0))[Bildschirm],
    )
  ]
  #figure()[
    #image("../../../Images/rendering.png", fit: "contain")
  ]
]

#slide[
  = Klassische Rendering-Pipeline
  #set align(horizon)
  - Umwandeln der 3D-Welt in (normalisierte) Kamerakoordinaten
  - Ausschnitt & Bestimmung der sichtbaren Oberﬂächen
    - Berechnen der Menge der vom Betrachtungspunkt aus sichtbaren Oberﬂächen
  - Rasterung (Scan-Konvertierung)
    - Beleuchtung und Schattierung (lokale, direkte Beleuchtungsmodelle): Rendertiefe, Beleuchtungseﬀekte, Materialeigenschaften
]

#slide[
  //TODO: Finish Rendering Pipeline diagram
  = Klassische Rendering-Pipeline
  #set align(horizon + center)
  #figure()[
    #let default-node-width = 175pt

    #diagram(
      node-stroke: 1pt, 
      node-inset: 10pt,
      node-shape: rect,
      node((0, 0), width: default-node-width, height: default-node-width)[
        Transform Object to World Coordinates
      ],
      edge("-|>"),
      node((1, 0), width: default-node-width, height: default-node-width)[
        Transform World to Camera Coordinates
      ],
      edge("-|>"),
      node((2, 0), width: default-node-width, height: default-node-width)[
        Apply Normalizing Transformation
      ],
      edge("-|>"),
      node((0, 1), width: default-node-width, height: default-node-width)[
        Clip Against View Volume
      ],
      edge("-|>"),
      node((1, 1), width: default-node-width, height: default-node-width)[
        Visible Surface Determination
      ],
      edge("-|>"),
      node((2, 1), width: default-node-width, height: default-node-width)[
        Shading and Rasterization
      ],
    )
  ]
]

#slide[
  = Klassische Rendering-Pipeline
  #set align(horizon)
  - 3D ist wie das Aufnehmen eines Fotos (... vieler Fotos)
  #image("../../../Images/model_view_camera.png", fit: "contain")
]
