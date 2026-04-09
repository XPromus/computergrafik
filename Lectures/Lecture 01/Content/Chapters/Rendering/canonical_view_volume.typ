#import "../../../Template/definitions.typ": slide
#import "../../../Template/template.typ": subchapter-title-slide, hszg-green

#import "@preview/showybox:2.0.4": showybox

#let chapter_name = [Canonical View Volume]
#subchapter-title-slide(section-name: chapter_name)

#slide[
  = #chapter_name
  #set align(horizon)
  - Ein, oft als Box, definierter Bereich, der alles abdeckt, was die Kamera sieht 
  - Alles, was sich in dem #chapter_name befindet wird gerendert.
  - Geometrie aus der Kamerasicht wird auf einen festen und normalisierten Bereich überführt
  #set align(center)
  #showybox(
    frame: (
      border-color: hszg-green,
      body-color: hszg-green.lighten(75%),
      thickness: 2.5pt
    ),
  )[
    #set align(left)
    *Beispiel:* Vulkan
    $ X text("from") (-1, 1) $
    $ Y text("from") (-1, 1) $
    $ Z text("from") (0, 1) $
  ]

  $Z$ normalisiert Tiefenwerte. Einfacheres Depth-Testing
]

#slide[
  = #chapter_name
  #set align(horizon)
  Welt verzerren, bis das Betrachtungsvolumen in Welt in ein paralleles kanonisches Betrachtungsvolumen passt
  - vereinfacht Beschneiden/Entfernen verdeckter Oberflächen/Schattierungen
  - durch die Multiplikation mit einer 4 x 4-Transformationsmatrix

  #figure()[
    #image("../../../Images/canonical_view_volume.png", fit: "contain")
  ]
]

#slide[
  = #chapter_name
  #set align(horizon)
  Die 3D zu 2D-Projektion (in die "Projektionsebene") ist jetzt einfach:
  - Ignorieren Sie einfach den z-Wert!
  - In Wirklichkeit behalten wir den z-Wert für die Entfernung verdeckter Oberflächen (Z-Buffer) und Schattierungseﬀekte bei.

  #figure()[
    #image("../../../Images/canonical_view_volume_2.png", fit: "contain")
  ]
]

#slide[
  = #chapter_name
  == Viewing Frustum (Sichtkegel)
  #set align(horizon)
  - #chapter_name ist nah mit dem Viewing Frustum verwandt
  - Viewing Frustum gibt die Region im Raum an, die auf dem Bildschirm erscheinen wird
  *Bestandteile*:
    - *Near Plane*: Die nahe Grenze zur Kamera
    - *Far Plane*: Die ferne Grenze zur Kamera
    - *Field of View*: Der Winkel in vertikale Richtung
    - *Aspect Ratio*: Das Seitenverhältnis zwischen Breit und Höhe
]

#slide[
  = #chapter_name
  == Viewing Frustum (Sichtkegel)
  #set align(horizon)
  #figure(
    image("../../../Images/view_frustum.png", fit: "contain")
  )
]

#slide[
  = #chapter_name
  == Viewing Frustum (Sichtkegel)
  #set align(horizon)
  - Der Viewing Frustum wird in das #chapter_name transformiert
  - Nach der Transformation erfolgt Clipping und Rasterisierung
  #figure()[
    #image("../../../Images/canonical_view_volume_2.png", fit: "contain")
  ]
]
