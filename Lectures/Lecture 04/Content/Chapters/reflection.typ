#import "../../Template/definitions.typ": *
#import "../../Template/template.typ": *

#chapter-title-slide(section-name: [Reflexionen])

#slide[
  = Planare Reflexionen
  #set align(horizon)

  *Reflexionen durch Environment Mapping*
  - Simulation von Reflexionen durch Environment Mapping auf grkrümmten Oberflächen
  - Funktioniert nicht bei ebenen Oberflächen
  - Weitere Einschränkungen: Reflektierte Objekte wirken weiter weg

  *Planare Reflexionen* 
  - Geben Hinweise auf räumliche Beziehung und erhöhen Realismus

  #image("../../Images/planar_reflection.png", width: 30%)
]

#slide[
  = Planare Reflexionen
  #set align(horizon)

  *Grundlegende Idee*
  - Kopie des zu reflektierenden Objektes erstellen
  - Kopie in die reflektierte Position transformieren und rendern

  *Gesetz der Reflektion*
  Eingehender Winkel $eq$ Ausgehender Winkel
]

#slide[
  = Planare Reflexion
  #set align(horizon)

  #figure(
    cetz.canvas(length: 2.5cm, {
      import cetz.draw: *

      line((0, 0), (5, 0), name: "reflector", stroke: 2.5pt)
      content("reflector.75%", padding: (bottom: 25pt))[reflector]

      set-style(
        mark: (end: "straight", scale: 2)
      )
      line(
        (2.5, 0), 
        (2.5, 2), 
        name: "n",
        stroke: 2pt
      )
      content("n.100%", [$n$], padding: (bottom: 25pt, left: 25pt))

      set-style(
        mark: (end: ">")
      )
      line((4, 2), (1, -2), name: "viewer", stroke: hszg-green + 2pt)
      content("viewer.0%", [viewer], padding: (left: 75pt))

      line((2.5, 0), (1, 2), name: "angleOfReflection", stroke: hszg-green.darken(50%) + 2pt)

      circle((0.6, 2.5), radius: 40pt, fill: hszg-green.lighten(90%), stroke: (paint: hszg-green, thickness: 2pt), name: "reflected_geometry")
      content("reflected_geometry.west", align(center)[reflected \ geometry], padding: (right: 125pt))
      circle((0.6, -2.5), radius: 40pt, fill: hszg-green.lighten(90%), stroke: (paint: hszg-green, thickness: 2pt, dash: "dashed"), name: "image_geometry")
      content("image_geometry.west", align(center)[image \ geometry], padding: (right: 125pt))
    })
  )
]

#slide[
  = Planare Reflexion
  #set align(horizon)

  - Annahme: Ebene ist $z eq 0$
  - Es wird um die $z$-Achse gespiegelt
  - Beispiel: `glScalef(x: 1, y: 1, z: -1);`
  \
  - Backfacing wird zu Frontfacing
  - Lichtquellen sollten auch reflektiert werden
  - Clipping mit Stencil Buffer benötigt
]

#slide[
  = Planare Reflexionen
  #set align(horizon)

  Schritte des Renderns:
  1. Reflektierende Teile der Grundplatte in den Stencil Buffer
  2. Das skalierte Modell ($(1, 1, -1)$) wird mit Stencil Buffer maskiert
  3. Rendern der Grundplatte (halbtransparent)
  4. Rendern des nicht skalierten Modells 

  #figure(
    image("../../Images/planar_reflection_stencil.png")
  )
]
