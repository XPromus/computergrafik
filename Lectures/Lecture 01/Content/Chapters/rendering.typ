#import "../../Template/definitions.typ": *
#import "../../Template/template.typ": *

#chapter-title-slide(section-name: [Rendering])

#include "Rendering/sample_geometry_graphics.typ"

#include "Rendering/line_rendering.typ"

#include "Rendering/polygon_rendering.typ"

#include "Rendering/rendering_pipeline.typ"

#slide[
  //TODO: Graphics for showing clipping planes
  = Synthetische Kamera
  #set align(horizon)
  - Kamera/Viewpoint Location
  - Kamera/Viewpoint Direction
  - Kamera/Viewpoint Orientation
  - Kamera/Viewpoint Lens (View Volume)
    - Breite/Höhe der Lens
    - Front/Back Clipping Planes
  - Parallele oder perspektivische Projektion
]

#slide[
  = Parallele und perspektivische Projektion
  #set align(horizon + center)
  #figure()[
    #image("../../Images/perspective_ortho_projection.png", fit: "contain")
  ]
]

#include "Rendering/canonical_view_volume.typ"

#slide[
  = Clipping
  #set align(horizon)
  - Polygone außerhalb der Ansichtsvolumen verwerfen
  - Polygone gegen Ansichtsvolumen beschneiden
    - auch leicht im Canonical View Volume durchführbar
    - Einfach gegen eine Box zu clippen als gegen einen Sichtkegel
  
  #figure()[
    #image("../../Images/clipping.png", fit: "contain")
  ]
]

#slide[
  = Visible Surface Determination
  #set align(horizon)
  - *Objekt-Präzisionsmethoden*
    - pro Polygon; Welt-/Kamerakoordinaten; Fließkommazahlen
    - z.B. Backface Culling
      - vom Betrachter abgewandte Polygone verwerfen
    - z.B. Occlusion Culling
      - Polygone verwerfen, die durch andere Polygone verdeckt sind
      - z.B. Portal-Rendering - Szene in Zellen/Sektoren (Räume) und Portale (Türen) unterteilen
  - *Bild-Präzisionsverfahren*
    - pro Pixel; Bildschirmkoordinaten; ganzzahlige Werte
    - z.B. Z-Buﬀer
    - z.B. Occlusion Culling durch Oﬀ-Screen-Rendering
]

#include "Rendering/z_buffer.typ"

#include "Rendering/anti_aliasing.typ"
