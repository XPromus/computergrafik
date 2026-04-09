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
  == TAA + SMAA mit Upscaling
  #set align(horizon)
]

#slide[
  = #chapter_name
  #set align(horizon + center)
  #text(weight: "bold", size: 30pt)[
    Weitere Details folgen
  ]
]
