#import "../../../../template/definitions.typ": *

#set math.vec(delim: "[")

== Grundlagen
*Themen:* Vektoren, Vektor Ops, Dot/Cross Product, Vektor Normalisierung, 3D Geometrie (Punkte, Linien, Ebenen)

*Dot Product*
$ vec(a, b, c) dot vec(1, 2, 3) = a + 2b + 3c $

*Cross Product*
$ vec(a_(1), a_(2), a_(3)) times vec(b_(1), b_(2), b_(3)) = vec(a_(2)b_(3) - a_(3)b_(2), a_(3)b_(1) - a_(1)b_(3), a_(1)b_(2) - a_(2)b_(1)) $

*Normalisierung* \
Ein Vektor wird auf eine Größe von 1 skaliert. Dabei wird die Richtung des Vektors beibehalten.

*Anwendung*: Bewegung eines Spielers mit WASD. 
Alle Werte des Bewegungsvektors sind dabei auf den Bereich von -1 bis 1 begrenzt.
Bewegt sich der Spieler geradeaus, ist der Bewegungsvektor $vec(0, 1)$. 
Somit beträgt die Länge des Vektors auch 1. 
Bewegt sich der Spieler diagonal mit einem Input von W und D, wäre der Bewegungsvektor $vec(1, 1)$. 
Die Länge des Vektors wäre somit 1.41 und der Spieler würde sich schneller auf der Diagonalen bewegen. 
Damit sich der Spieler in alle Richtungen gleich schnell bewegt, muss der Bewegungsvektor normalisiert werden.

#showybox(
  frame: (
    border-color: blue,
    title-color: blue,
    body-color: blue.lighten(90%)
  ),
  title-style: (
    color: black,
    weight: "bold",
    align: center,
  ),
  title: "Beispiel zur Normalisierung eines Vektors",
  [
    Normalisierung des Vectors $vec(1, 1)$ auf die Größe $1$. Der Vektor $vec(1, 1)$ besitzt die Größe $1.41$ und soll auf die Größe $1$ skaliert werden.

    #math.equation(
      block: true,
      $vec(1, 1) -->_("normalisierung") vec(frac(1, 1.41), frac(1, 1.41)) eq vec(0.709, 0.709)$
    )<vector_norm_example>
  ]
)

*Ziele:* Positionen repräsentieren, Richtungen, Normalen, Winkeln berechnen, Projektionen, Distanzen

*Übungen:* Vector Klasse implementieren, Funktionen für dot/cross Produkte schreiben, normalisierung, Einfach Geometrieprobleme lösen (point-plane distance, line-plane distance)

=== Lineare Algebra

=== Vektoren
