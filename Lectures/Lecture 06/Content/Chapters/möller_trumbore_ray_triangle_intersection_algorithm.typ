#import "../../Template/definitions.typ": *
#import "../../Template/template.typ": *

#alternate-chapter-title-slide(
  section-name: [Algorithmus],
  alternate-name: [
    Möller-Trumbore Intersection Algorithmus
  ]
)

#slide[
  = Möller-Trumbore Intersection Algorithmus
  #set align(horizon)

  - Schnelle Methode um den Schnittpunkt von einem Ray und einem Triangle im 3D Raum zu berechnen
  - Benötigt keine Vorberechnungen
  - Häufig genutzer Algorithmus für Raytracing in der Computergrafik
  
  *Bestandteile* \
  - Ray
  - Triangle
  - Plane, auf der das Triangle liegt
]

#slide[
  = Definitionen
  #set align(horizon)

  - *Ray:* _Origin Point_ $O$ und Richtungsvektor $accent(v, arrow)$
  - *Punkt auf dem Ray:* $accent(r, arrow)(t) eq O plus t accent(v, arrow)$ mit $-infinity lt t lt infinity$
  - *Triangle*: Drei Vertices $v_(1)$, $v_(2)$ und $v_(3)$
  - *Plane*: Punkt, der auf der Plane (z.B.: $v_(1)$) und ein _Plane Vektor_, der orthogonal zu jedem Punkt auf der Plane liegt
  - *Plane Vektor*: Das Kreuzprodukt der Vektoren von $v_(1)$ zu $v_(2)$ und $v_(1)$ zu $v_(3)$  
  #align(center)[$accent(n, arrow) dot (P_(1) - P_(2)) eq 0$ wenn $accent(n, arrow) eq (v_(2) - v_(1)) times (v_(3) - v_(1))$]
]
