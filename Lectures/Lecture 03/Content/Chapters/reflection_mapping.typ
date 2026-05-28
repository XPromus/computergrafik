#import "../../Template/definitions.typ": *
#import "../../Template/template.typ": *

#slide[
  = Reflection Mapping
  #set align(horizon)

  - Simulation von spiegelnden Oberflächen durch Textur
  - Vorteil: schnell zu berechnen im Vergleich zu Raytracing
  - Nachteil: Variation der Umwelt nicht bzw. schwer in Spiegelung übertragbar

  #figure(
    image("../../Images/reflection_mapping_example.png")
  )
]

#slide[
  = Erstellung der Environment Map
  #set align(horizon)
  #v(1fr)
  - Eine Environment Map ist ein kreisförmiges Panorama-Bild
  - Aufnahme eines kreisförmigen Panorama-Bildes:
    - 360 Grad Kamera
    - Bild einer gespiegelten Kugel (Light Probe) 
  #v(1fr)
  #grid(
    columns: (1fr, 1fr, 1fr),
    align: center + horizon,
    [
      #image("../../Images/light_probes/light_probe_1.png")
    ], [
      #image("../../Images/light_probes/light_probe_2.png")
    ], [
      #image("../../Images/light_probes/light_probe_3.png")
    ]
  )
  #v(1fr)
]

#slide[
  = Environment Maps als Lichtquelle
  #set align(horizon)
  #v(1fr)
  - Annahme: Licht, dass durch Environment Map aufgenommen wurde, kann aus einer unendlichen Distanz ausgegeben werden
  - Ergebnis: Environment Map besteht aus direktionalen Lichtquellen
  #v(1fr)
  #grid(
    columns: (1fr, 1fr),
    [
      #image("../../Images/environment_map_lighting.png", fit: "contain", width: 50%)
    ], [
      #image("../../Images/reflection_mapping.png", fit: "contain")
    ]
  )
  #v(1fr)
]
