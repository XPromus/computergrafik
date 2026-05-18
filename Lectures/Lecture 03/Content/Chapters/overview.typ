#import "../../Template/definitions.typ": *
#import "../../Template/template.typ": hszg-green, chapter-title-slide, subchapter-title-slide

#chapter-title-slide(section-name: [Übersicht])

#slide[
  = Beleuchtung und Schattierung
  #set align(horizon)
  - Beleuchtung und Schattierung sind elementar, um die Illussion von 3D zu erzeugen
  - Tiefeninformationen können ohne Geometrieänderungen hinzugefügt werden

  #grid(
    columns: (1fr, 1fr),
    align: top,
    [
      #figure(
        image("../../Images/monkey_flat.png", width: 50%),
        gap: 15pt,
        caption: [
          Render eines Affen in Blender mit _Flat_ Rendering ohne Beleuchtung.
        ]
      )
    ], [
      #figure(
        image("../../Images/monkey_lighting.png", width: 50%),
        gap: 15pt,
        caption: [
          Render eines Affen in Blender mit Beleuchtung.
        ]
      )
    ]
  )
]

#slide[
  = Beleuchtung und Schattierung
  #set align(horizon)
  - Reflexion von Material bestimmt durch Materialeigenschaften: matt, specular, transparent
  - Multiple Reflexionen
    - *Lokale Modelle*: nur eine Reflexion (Licht $arrow$ Oberfläche $arrow$ Auge)
    - *Globale Modelle*: mehrere Reflexionen (Licht $arrow$ Oberfläche $A$ $arrow$ Oberfläche $B$ $arrow$ ... $arrow$ Auge)
]

#slide[
  = Beleuchtung und Schattierung
  #set align(horizon)
  *Grundtypen der Lichtinteraktion:*
  #enum(
    numbering: "(a)", 
    enum.item(1)[*Specular*: Reflexion in eine einzelne Richtung (z.B.: Spiegel)],
    enum.item(2)[*Diffuse*: Reflexion in alle Richtungen (z.B.: matte Overflächen)],
    enum.item(3)[*Translucent*: Durchlass von Licht durch das Material]
  )

  #figure(
    image("../../Images/light_interaction.png", fit: "contain", width: 90%),
    caption: [
      Arten der Lichtinteraktion
    ]
  )
]

#slide[
  = Beleuchtung und Schattierung
  #set align(horizon)
  - *Beleuchtung*: Interaktion von Licht und Material
  - *Shading*: Beleuchtung (auf Eckpunkte) und Feststellung von Pixelfarbe
  //TODO: Improve slide
]
