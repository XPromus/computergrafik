#import "../../../Template/definitions.typ": *
#import "../../../Template/template.typ": subchapter-title-slide

#let chapter_name = [Anti-Aliasing]
#subchapter-title-slide(section-name: chapter_name)

#slide[
  = #chapter_name
  #set align(horizon)
  - Probleme mit der Rasterung
    - Darstellung einer Linie mit diskreten Pixelwerten ist die Abtastung einer
    - _Jaggies_ sind eine Manifestation von Stichprobenfehlern und Informationsverlust kontinuierlichen Funktion
  - Antialiasing-Idee (für Linienwiedergabe):
    - Rechteck (1 Pixel breit) statt mathematischer Linie
    - Pixelintensität abhängig von der Überlappung mit dem Einheitsrechteck:
      - wie viel Überlappung
      - wo Überschneidungen auftreten
]

#slide[
  = #chapter_name
  #set align(horizon + center)
  #figure()[
    #image("../../../Images/antialiasing.png", fit: "contain")
  ]
]

#slide[
  = #chapter_name
  == Typen
  #set align(horizon)
  - Supersampling Anti-Aliasing (*SSAA*)
  - Multisample Anti-Aliasing (*MSAA*)
  - Fast Approximate Anti-Aliasing (*FXAA*)
  - Temporal Anti-Aliasing (*TAA*)
  - Morphological Anti-Aliasing (*MLAA*)
  - Subpixel Morphological Anti-Aliasing (*SMAA*)
  - Deep Learning / AI-based Anti-Aliasing (DLSS/FSR Super Resolution + Anti-Aliasing hybrids)
]

#slide[
  = #chapter_name
  == Supersampling Anti-Aliasing (SSAA)
  #set align(horizon)
  - Erhöhung der Auflösung der Samples
  - Downscaling vom Ergebnis
  *Praktisch:* Der Frame wird bei einer höheren Auflösung gerendert und auf die Monitor Auflösung runterskaliert.
  #v(15pt)
  *Full-resolution SSAA*: Die ganze Szene wird mit einer höheren Auflösung gerendert
]

#slide[
  = #chapter_name
  == Temporal Anti-Aliasing (TAA)
  #set align(horizon)
  *Temporal Anti-Aliasing (TAA)* \
  - Sammlung von Bilddaten über mehrere Frames
  - Reduzierung von Aliasing mit historischen Daten
  - Braucht wenig Rechenleistung
  Probleme:
    - Ghosting durch schnelle Bewegungen oder veraltete historische Daten
    - Potentieller Verlust von kleinen Details
    - Erhöhter Speicherverbrauch durch das verwalten von historischen Daten
]

#slide[
  = #chapter_name
  == Temporal Anti-Aliasing (TAA)
  #set align(horizon + center)
  #figure(
    image("../../../Images/forza_ghosting.jpg", fit: "contain", width: 90%),
    caption: [Ghosting in Forza Horizon 5]
  )<forza_ghosting>
]

#slide[
  = #chapter_name
  == Temporal Anti-Aliasing (TAA)
  #set align(horizon + center)
  #grid(
    columns: (1fr),
    grid.cell()[
      #figure(
        image("../../../Images/assetto_corsa_rally_frame_1.png", width: 90%),
        caption: [Frame aus dem Trailer von _Assetto Corsa Rally_. Man beachte die *Reifen*.]
      )
    ], grid.cell()[
      #figure(
        image("../../../Images/assetto_corsa_rally_frame_2.png", width: 90%),
        caption: [Ghosting der Reifen durch die schnelle Bewegung des Fahrzeugs.]
      )
    ]
  )
]

#slide[
  = #chapter_name
  #set align(horizon + center)
  #text(weight: "bold", size: 30pt)[
    Weitere Details folgen
  ]
]
